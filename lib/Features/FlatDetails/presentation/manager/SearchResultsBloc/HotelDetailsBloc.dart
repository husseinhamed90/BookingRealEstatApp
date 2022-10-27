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
      if (await getInternetConnectionState()) {
        emit(state.copyWith(errorMessage: FireMessage(loading),hotelDetailsModel: null,hotelDescriptionModel: null,hotelPhotoModel: null));
        final list = await dl<FetchHotelDetailsUseCase>().call(hotelId: event.hotelModel.hotelId!);
        list.fold((left) {
          emit(state.copyWith(errorMessage: left,hotelDetailsModel: null,hotelDescriptionModel: null,hotelPhotoModel: null));
        }, (right) {
          add(FetchHotelDescriptionEvent(hotelModel: event.hotelModel,hotelDetailsModel: right));
        });
      }
      else {
        emit(state.copyWith(errorMessage: FireMessage("No Internet")));
      }
    });

    on<FetchHotelDescriptionEvent>((event, emit) async {

      final list = await dl<FetchHotelDescriptionUseCase>().call(hotelId: event.hotelModel.hotelId!);
      list.fold((left) {
        emit(state.copyWith(errorMessage: left,hotelDetailsModel: null,hotelDescriptionModel: null,hotelPhotoModel: null));
      }, (right) {
        add(FetchHotelPhotosEvent(hotelModel: event.hotelModel,hotelDetailsModel: event.hotelDetailsModel,hotelDescriptionModel: right));
      });
    });

    on<FetchHotelPhotosEvent>((event, emit) async {
      final list = await dl<FetchHotelPhotosUseCase>().call(hotelId: event.hotelModel.hotelId!);
      list.fold((left) {
        emit(state.copyWith(errorMessage: left,hotelDetailsModel: null,hotelDescriptionModel: null,hotelPhotoModel: null));
      }, (right) {
        emit(state.copyWith(hotelPhotoModel : right,errorMessage: FireMessage(""),hotelDetailsModel: event.hotelDetailsModel,hotelModel: event.hotelModel,hotelDescriptionModel: event.hotelDescriptionModel ));
      });
    });

    on<FetchRoomsEvent>((event, emit) async {
      if (await getInternetConnectionState()) {
        emit(state.copyWith(errorMessage: FireMessage(loading)));
        final list = await dl<FetchHotelRoomsUseCase>().call(hotelId: event.hotelId,userCurrency: event.currency);
        list.fold((left) {
          emit(state.copyWith(errorMessage: left,hotelDetailsModel: null,hotelDescriptionModel: null,hotelPhotoModel: null));
        }, (right) {
          emit(state.copyWith(hotelBlockModel: right,errorMessage: FireMessage("Hotel Rooms Loaded") ));
        });
      }
      else {
        emit(state.copyWith(errorMessage: FireMessage("No Internet")));
      }
    });
  }
}