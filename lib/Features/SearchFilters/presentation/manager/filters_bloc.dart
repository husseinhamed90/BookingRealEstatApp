
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:realestate/Features/SearchFilters/presentation/manager/sliders_cubit.dart';
import 'package:realestate/Features/SearchForm/data/remote/models/HotelModel.dart';
import '../../../../Core/AppTheme/Strings.dart';
import '../../../../Core/SharedModel/FireMessage.dart';
import '../../../../DependencyInjection.dart';
import '../../data/remote/models/LocationModel.dart';
import '../../domain/use_cases/FetchLocationsUseCase.dart';
import '../../domain/use_cases/FilterResultsUseCase.dart';

part 'filters_event.dart';
part 'filters_state.dart';

class FilteringBloc extends Bloc<LocationsEvent, FilteringState> {
  TextEditingController locationController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  int pageNumber=0;

  FilteringBloc() : super(FilteringState(errorMessage: FireMessage("Initial"),hotels: const [])) {
    startDateController.text="${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}";
    endDateController.text="${DateTime.now().add(const Duration(days: 1)).year}-${DateTime.now().add(const Duration(days: 1)).month}-${DateTime.now().add(const Duration(days: 1)).day}";
    on<FetchLocationsEvent>((event, emit) async{
      pageNumber=event.pageNumber;

      if(locationController.text!=""){
        emit(state.copyWith(errorMessage: FireMessage(loading)));
        final result  = await dl<FetchLocationsUseCase>().call(locationString: locationController.text);
          result.fold((left) =>emit(state.copyWith(errorMessage: left)),
                  (right) {
                emit(state.copyWith(errorMessage: FireMessage(""), locations: right,hotels: []));
                pageNumber=0;
                add(StartFilterDataEvent(locations: right,pageNumber: event.pageNumber));
              }
          );
      }
      else{
        emit(state.copyWith(errorMessage: FireMessage("Location Field Is Required")));
      }
    });
    on<FetchMore>((event, emit) async{
      pageNumber++;
      print(pageNumber);
      add(StartFilterDataEvent(locations: state.locations!,pageNumber: pageNumber));
     // emit(state.copyWith(errorMessage: event.errorMessage));
    });

    on<FireErrorMessageEvent>((event, emit) async{
      emit(state.copyWith(errorMessage: event.errorMessage));
    });

    on<StartFilterDataEvent>((event, emit) async{
      emit(state.copyWith(errorMessage: FireMessage(loading)));
      if(event.locations.isNotEmpty){

        state.copyWith(hotels: state.hotels);
        final result = await dl<FilterResultsUseCase>().call(pageNumber: pageNumber,maxPrice: dl<SlidersCubit>().pricesValues.end,minPrice: dl<SlidersCubit>().pricesValues.start,locationModel: event.locations[0],numberOfRooms: dl<SlidersCubit>().initRoomsNumber!.toInt(),numberOfAdults: dl<SlidersCubit>().initAdultsNumber!.toInt(),checkIn: startDateController.text,checkOut: endDateController.text);
        result.fold((left) =>emit(state.copyWith(errorMessage: left)),
                (right) {
                  emit(state.copyWith(errorMessage: FireMessage("result loaded"), hotels: state.hotels+=right,locations: event.locations));
                }
        );
      }
      else{
        emit(state.copyWith(errorMessage: FireMessage("Location Field Is Required")));
      }
    });
  }
}