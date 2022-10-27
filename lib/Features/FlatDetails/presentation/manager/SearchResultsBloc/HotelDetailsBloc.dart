import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:realestate/Features/FlatDetails/data/remote/models/DescriptionModel.dart';
import 'package:realestate/Features/SearchForm/data/remote/models/HotelModel.dart';
import 'package:realestate/Features/FlatDetails/domain/use_cases/FetchHotelDescriptionUseCase.dart';
import 'package:realestate/Features/FlatDetails/domain/use_cases/FetchHotelDetailsUseCase.dart';

import '../../../../../Core/AppTheme/Strings.dart';
import '../../../../../Core/SharedModel/FireMessage.dart';
import '../../../../../Core/Utils.dart';
import '../../../../../DependencyInjection.dart';
import '../../../../SearchForm/domain/entities/Hotel.dart';
import '../../../data/remote/models/HotelDetailsModel.dart';
import '../../../domain/use_cases/FetchHomePhotosUseCase.dart';
import '../../../domain/use_cases/FetchHotelRoomsUseCase.dart';
import 'HotelDetailsState.dart';

part 'HotelDetailsEvent.dart';

class HotelDetailsBloc extends Bloc<HotelDetailsEvent, HotelDetailsState> {

  HotelDetailsBloc() : super(const HotelDetailsState().copyWith(errorMessage: FireMessage(loading),hotelDetailsModel: null,hotelDescriptionModel: null,hotelPhotoModel: null)){
    on<FetchHotelDetailsEvent>((event, emit) async {
      await handleInternetConnectionStates(
          onSuccessConnection: ()async => await getHotelDetails(emit, event),
          onFailureConnection: ()=>  emit(state.copyWith(errorMessage: FireMessage("No Internet")))
      );
    });

    on<FetchHotelDescriptionEvent>((event, emit) async {
      await getHotelDescription(event, emit);
    });

    on<FetchHotelPhotosEvent>((event, emit) async {
      await getHotelPhotos(event, emit);
    });

    on<FetchRoomsEvent>((event, emit) async {
      await handleInternetConnectionStates(
          onSuccessConnection: ()async => await getHotelRooms(emit, event),
          onFailureConnection: ()=> emit(state.copyWith(errorMessage: FireMessage("No Internet"),hotelPhotoModel: state.hotelPhotoModel,hotelDetailsModel: state.hotelDetailsModel,hotelDescriptionModel: state.hotelDescriptionModel,hotelModel: state.hotelModel,isFav: state.isFav))

      );
    });
  }

  Future<void> getHotelRooms(Emitter<HotelDetailsState> emit, FetchRoomsEvent event) async {
    emit(state.copyWith(errorMessage: FireMessage(loading),hotelPhotoModel: state.hotelPhotoModel,hotelDetailsModel: state.hotelDetailsModel,hotelDescriptionModel: state.hotelDescriptionModel,hotelModel: state.hotelModel,isFav: state.isFav));
    final list = await dl<FetchHotelRoomsUseCase>().call(hotelId: event.hotelId,userCurrency: event.currency);

    list.fold((left) {
      emit(state.copyWith(errorMessage: left,hotelPhotoModel: state.hotelPhotoModel,hotelDetailsModel: state.hotelDetailsModel,hotelDescriptionModel: state.hotelDescriptionModel,hotelModel: state.hotelModel,isFav: state.isFav));
    }, (right) {
      emit(state.copyWith(hotelBlockModel: right,errorMessage: FireMessage("Hotel Rooms Loaded"),hotelPhotoModel: state.hotelPhotoModel,hotelDetailsModel: state.hotelDetailsModel,hotelDescriptionModel: state.hotelDescriptionModel,hotelModel: state.hotelModel,isFav: state.isFav));
    });
  }

  Future<void> getHotelPhotos(FetchHotelPhotosEvent event, Emitter<HotelDetailsState> emit) async {
    final list = await dl<FetchHotelPhotosUseCase>().call(hotelId: event.hotelModel.hotelId!);
    list.fold((left) {
      emit(state.copyWith(errorMessage: left,hotelDetailsModel: null,hotelDescriptionModel: null,hotelPhotoModel: null));
    }, (right) {
      emit(state.copyWith(hotelPhotoModel : right,errorMessage: FireMessage(""),hotelDetailsModel: event.hotelDetailsModel,hotelModel: event.hotelModel,hotelDescriptionModel: event.hotelDescriptionModel ));
    });
  }

  Future<void> getHotelDescription(FetchHotelDescriptionEvent event, Emitter<HotelDetailsState> emit) async {
    final list = await dl<FetchHotelDescriptionUseCase>().call(hotelId: event.hotelModel.hotelId!);
    list.fold((left) {
      emit(state.copyWith(errorMessage: left,hotelDetailsModel: null,hotelDescriptionModel: null,hotelPhotoModel: null));
    }, (right) {
      add(FetchHotelPhotosEvent(hotelModel: event.hotelModel,hotelDetailsModel: event.hotelDetailsModel,hotelDescriptionModel: right));
    });
  }

  Future<void> getHotelDetails(Emitter<HotelDetailsState> emit, FetchHotelDetailsEvent event) async {
    emit(state.copyWith(errorMessage: FireMessage(loading),hotelDetailsModel: null,hotelDescriptionModel: null,hotelPhotoModel: null));
    final list = await dl<FetchHotelDetailsUseCase>().call(hotelId: event.hotelModel.hotelId!);
    list.fold((left) {
      emit(state.copyWith(errorMessage: left,hotelDetailsModel: null,hotelDescriptionModel: null,hotelPhotoModel: null));
    }, (right) {
      add(FetchHotelDescriptionEvent(hotelModel: event.hotelModel,hotelDetailsModel: right));
    });
  }
}