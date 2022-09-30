import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:realestate/Features/SearchForm/data/remote/models/HotelBlocksModel.dart';
import 'package:realestate/Features/SearchForm/data/remote/models/HotelDetailsModel.dart';
import 'package:realestate/Features/SearchForm/domain/use_cases/FetchNearestHotelsUseCase.dart';
import '../../../../../Core/FireMessage.dart';
import '../../../../../DependencyInjection.dart';
import '../../../../SearchFilters/data/remote/models/LocationModel.dart';
import '../../../data/remote/models/HotelModel.dart';
import '../../../domain/use_cases/FetchHotelRoomsUseCase.dart';

part 'hotels_by_coordinates_event.dart';
part 'hotels_by_coordinates_state.dart';

class HotelsByCoordinatesBloc extends Bloc<HotelsByCoordinatesEvent, HotelsByCoordinatesState> {
  HotelsByCoordinatesBloc() : super(const HotelsByCoordinatesState().copyWith(errorMessage: FireMessage("Loading"))) {
    on<FetchHotelsByCoordinatesEvent>((event, emit) async{
      Position position = await determinePosition();
      //emit(state.copyWith(errorMessage: ErrorMessage("Loading")));
      await dl<FetchNearestHotelsUseCase>().call(longitude: position.longitude,latitude: position.latitude).then((value){
        value.fold((left) => emit(state.copyWith(errorMessage: left)), (right) {
          emit(state.copyWith(hotels: right,errorMessage: FireMessage("Hotels Loaded")));
        });
      });
    });

    on<FetchRoomsEvent>((event, emit) async {
      emit(state.copyWith(errorMessage: FireMessage("Loading")));
      final list = await dl<FetchHotelRoomsUseCase>().call(hotelId: event.hotelId,userCurrency: event.currency);
      list.fold((left) {
        emit(state.copyWith(errorMessage: left));
      }, (right) {
        emit(state.copyWith(hotelBlocksModel: right,errorMessage: FireMessage("Hotel Details Loaded")));
        state.copyWith(errorMessage: FireMessage("Initial"));
      });
    });
  }

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }
}
