
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:realestate/Features/SearchForm/data/remote/models/HotelModel.dart';
import '../../../../Core/SharedModel/FireMessage.dart';
import '../../../../DependencyInjection.dart';
import '../../data/remote/models/LocationModel.dart';
import '../../domain/use_cases/FetchLocationsUseCase.dart';
import '../../domain/use_cases/FilterResultsUseCase.dart';

part 'filters_event.dart';
part 'filters_state.dart';

class FilteringBloc extends Bloc<LocationsEvent, FilteringState> {
  TextEditingController locationController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController guestsController = TextEditingController();

  FilteringBloc() : super(FilteringState(errorMessage: FireMessage("Initial"))) {
    on<FetchLocationsEvent>((event, emit) async{
      if(locationController.text!=""){
        emit(state.copyWith(errorMessage: FireMessage("Loading")));
        await dl<FetchLocationsUseCase>().call(locationString: locationController.text).then((value){
          value.fold((left) =>emit(state.copyWith(errorMessage: left)),
                  (right) {
                emit(state.copyWith(errorMessage: FireMessage("Locations Loaded"), locations: right));
                add(StartFilterDataEvent(locations: right));
              }
          );
        });
      }
      else{
        emit(state.copyWith(errorMessage: FireMessage("Location Field Is Required")));
      }

    });

    on<FireErrorMessageEvent>((event, emit) async{
      emit(state.copyWith(errorMessage: event.errorMessage));
    });

    on<StartFilterDataEvent>((event, emit) async{
      emit(state.copyWith(errorMessage: FireMessage("Loading")));
      if(event.locations.isNotEmpty){
        final result = await dl<FilterResultsUseCase>().call(locationModel: event.locations[0],numberOfRooms: 1,numberOfAdults: 1);
        result.fold((left) =>emit(state.copyWith(errorMessage: left)),
                (right) => emit(state.copyWith(errorMessage: FireMessage("Hotels Loaded"), hotels: right,locations: event.locations))
        );
      }
      else{
        emit(state.copyWith(errorMessage: FireMessage("Location Field Is Required")));
      }
    });
  }
}