import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:realestate/Core/Utils.dart';
import 'package:realestate/Features/SearchForm/domain/use_cases/FetchNearestHotelsUseCase.dart';
import '../../../../../Core/AppTheme/Strings.dart';
import '../../../../../Core/SharedModel/FireMessage.dart';
import '../../../../../DependencyInjection.dart';
import '../../../../FlatDetails/data/remote/models/HotelBlocksModel.dart';
import '../../../../FlatDetails/data/remote/models/HotelDetailsModel.dart';
import '../../../../SearchFilters/data/remote/models/LocationModel.dart';
import '../../../data/remote/models/HotelModel.dart';

part 'hotels_by_coordinates_event.dart';
part 'hotels_by_coordinates_state.dart';

class HotelsByCoordinatesBloc extends Bloc<HotelsByCoordinatesEvent, HotelsByCoordinatesState> {
  HotelsByCoordinatesBloc() : super(const HotelsByCoordinatesState().copyWith(message: FireMessage(loading))) {

    on<FetchHotelsByCoordinatesEvent>((event, emit) async{
      await handleInternetConnectionStates(
          onSuccessConnection: ()async=>await getNearestHotelsToYourCurrentLocation(emit),
          onFailureConnection: ()=> emit(state.copyWith(errorMessage: FireMessage("No Internet"),message: FireMessage(""))));
    });
  }

  Future<void> getNearestHotelsToYourCurrentLocation(Emitter<HotelsByCoordinatesState> emit) async {
    emit(state.copyWith(message: FireMessage(loading),errorMessage: null));
    Position position = await determinePosition();
    await getNearestHotels(position, emit);
  }

  Future<void> getNearestHotels(Position position, Emitter<HotelsByCoordinatesState> emit) async {
     await dl<FetchNearestHotelsUseCase>().call(longitude: position.longitude,latitude: position.latitude).then((value) {
       value.fold((left) => emit(state.copyWith(errorMessage: left,message: FireMessage(""))), (right) {
         emit(state.copyWith(hotels: right,message: FireMessage("Hotels Loaded")));
       });
     });
  }

  Future checkIfLocationServiceEnabled()async{
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
  }

  Future handleDeniedPermission(LocationPermission permission)async{
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
  }

  Future handleDeniedPermissionForever(LocationPermission permission)async{
    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied, we cannot request permissions.');
    }
  }

  Future<Position> determinePosition() async {
    LocationPermission permission = await Geolocator.requestPermission();
    await checkIfLocationServiceEnabled();
    await handleDeniedPermission(permission);
    await handleDeniedPermissionForever(permission);
    return await Geolocator.getCurrentPosition();
  }

}
