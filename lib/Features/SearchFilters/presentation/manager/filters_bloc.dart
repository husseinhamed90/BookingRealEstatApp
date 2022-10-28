
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:realestate/Features/SearchFilters/presentation/manager/sliders_cubit.dart';
import 'package:realestate/Features/SearchForm/data/remote/models/HotelModel.dart';
import '../../../../Core/AppTheme/Strings.dart';
import '../../../../Core/SharedModel/FireMessage.dart';
import '../../../../Core/Utils.dart';
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

  FilteringBloc() : super(FilteringState(message: FireMessage("Initial"),hotels: const [])) {

    putInitialStartAndEndDate();
    on<FetchLocationsEvent>((event, emit) async{
      await handleInternetConnectionStates(
          onSuccessConnection: () async => await getLocations(event, emit),
          onFailureConnection: ()=>  emit(state.copyWith(errorMessage: FireMessage("No Internet"),message: FireMessage("")))
      );
    });

    on<FetchMore>((event, emit) async{
      await getMoreData();
    });

    on<FireErrorMessageEvent>((event, emit) async{
      emit(state.copyWith(errorMessage: event.errorMessage,message: FireMessage("")));
    });

    on<StartFilterDataEvent>((event, emit) async{
      await handleInternetConnectionStates(
          onSuccessConnection: () async => await startFilterResults(emit, event),
          onFailureConnection: ()=>  emit(state.copyWith(errorMessage: FireMessage("No Internet"),message: FireMessage("")))
      );
    });
  }
  Future<void> getLocations(FetchLocationsEvent event, Emitter<FilteringState> emit) async {
    pageNumber=event.pageNumber;
    if(locationController.text!=""){
      emit(state.copyWith(message: FireMessage(loading),errorMessage: null));
      final result  = await dl<FetchLocationsUseCase>().call(locationString: locationController.text);
      result.fold((left) =>emit(state.copyWith(errorMessage: left,message: FireMessage(""))),
              (right) {
            pageNumber=0;
            add(StartFilterDataEvent(locations: right,pageNumber: event.pageNumber));
          }
      );
    }
    else{
      emit(state.copyWith(errorMessage: FireMessage("Location Field Is Required"),message: FireMessage("")));
    }
  }


  void putInitialStartAndEndDate() {
    startDateController.text="${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}";
    endDateController.text="${DateTime.now().add(const Duration(days: 1)).year}-${DateTime.now().add(const Duration(days: 1)).month}-${DateTime.now().add(const Duration(days: 1)).day}";
  }

  Future<void> startFilterResults(Emitter<FilteringState> emit, StartFilterDataEvent event) async {
    await checkForLocationTextFieldValidation(event, emit);
  }

  Future<void> checkForLocationTextFieldValidation(StartFilterDataEvent event, Emitter<FilteringState> emit) async {
    if(event.locations.isNotEmpty){
      await startFiltering(event, emit);
    }
    else{
      emit(state.copyWith(errorMessage: FireMessage("No Location With This Name"),message: FireMessage("")));
    }
  }

  Future<void> startFiltering(StartFilterDataEvent event, Emitter<FilteringState> emit) async {
    state.copyWith(hotels: state.hotels);
    final result = await dl<FilterResultsUseCase>().call(pageNumber: pageNumber,maxPrice: dl<SlidersCubit>().pricesValues.end,minPrice: dl<SlidersCubit>().pricesValues.start,locationModel: event.locations[0],numberOfRooms: dl<SlidersCubit>().initRoomsNumber!.toInt(),numberOfAdults: dl<SlidersCubit>().initAdultsNumber!.toInt(),checkIn: startDateController.text,checkOut: endDateController.text);
    result.fold((left) =>emit(state.copyWith(errorMessage: left,message: FireMessage(""))),
            (right){
              emit(state.copyWith(errorMessage: null,message: FireMessage("result loaded"), hotels: state.hotels+=right,locations: event.locations));
            }
    );
  }

  Future<void> getMoreData() async{
    pageNumber++;
    add(StartFilterDataEvent(locations: state.locations!,pageNumber: pageNumber));
  }
}