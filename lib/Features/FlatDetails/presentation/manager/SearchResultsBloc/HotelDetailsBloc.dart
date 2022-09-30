import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:realestate/Features/SearchForm/data/remote/models/DescriptionModel.dart';
import 'package:realestate/Features/SearchForm/data/remote/models/HotelDetailsModel.dart';
import 'package:realestate/Features/SearchForm/data/remote/models/HotelModel.dart';
import 'package:realestate/Features/SearchForm/domain/use_cases/FetchHotelDescriptionUseCase.dart';
import 'package:realestate/Features/SearchForm/domain/use_cases/FetchHotelDetailsUseCase.dart';

import '../../../../../Core/FireMessage.dart';
import '../../../../../DependencyInjection.dart';
import '../../../../SearchForm/domain/use_cases/FetchHomePhotosUseCase.dart';
import '../../../../SearchForm/domain/use_cases/FetchHotelRoomsUseCase.dart';
import 'HotelDetailsState.dart';

part 'HotelDetailsEvent.dart';

class HotelDetailsBloc extends Bloc<HotelDetailsEvent, HotelDetailsState> {

  HotelDetailsBloc() : super(const HotelDetailsState().copyWith(errorMessage: FireMessage("Initial"))) {
    on<FetchHotelDetailsEvent>((event, emit) async {
      emit(state.copyWith(errorMessage: FireMessage("Loading")));
      final list = await dl<FetchHotelDetailsUseCase>().call(hotelId: event.hotelModel.hotelId!);
      list.fold((left) {
        emit(state.copyWith(errorMessage: left));
      }, (right) {
        state.copyWith(hotelDetailsModel: right,hotelModel: event.hotelModel);
         add(FetchHotelDescriptionEvent(hotelModel: event.hotelModel,hotelDetailsModel: right));
      });
    });

    on<FetchHotelDescriptionEvent>((event, emit) async {
      emit(state.copyWith(errorMessage: FireMessage("Loading")));
      final list = await dl<FetchHotelDescriptionUseCase>().call(hotelId: event.hotelModel.hotelId!);
      list.fold((left) {
        emit(state.copyWith(errorMessage: left));
      }, (right) {
        emit(state.copyWith(hotelDescriptionModel : right,errorMessage: FireMessage("Hotel Details ef Loaded"),hotelDetailsModel: event.hotelDetailsModel,hotelModel: event.hotelModel ));
         add(FetchHotelPhotosEvent(hotelModel: event.hotelModel,hotelDetailsModel: event.hotelDetailsModel,hotelDescriptionModel: right));
      });
    });

    on<FetchHotelPhotosEvent>((event, emit) async {
      emit(state.copyWith(errorMessage: FireMessage("Loading")));
      final list = await dl<FetchHotelPhotosUseCase>().call(hotelId: event.hotelModel.hotelId!);
      list.fold((left) {
        emit(state.copyWith(errorMessage: left));
      }, (right) {
        emit(state.copyWith(hotelPhotoModel : right,errorMessage: FireMessage("Hotel Photos Loaded"),hotelDetailsModel: event.hotelDetailsModel,hotelModel: event.hotelModel ));
      });
    });




    on<FetchRoomsEvent>((event, emit) async {
      emit(state.copyWith(errorMessage: FireMessage("Loading")));
      final list = await dl<FetchHotelRoomsUseCase>().call(hotelId: event.hotelId,userCurrency: event.currency);
      list.fold((left) {
        emit(state.copyWith(errorMessage: left));
      }, (right) {
        emit(state.copyWith(hotelBlockModel: right,errorMessage: FireMessage("Hotel Rooms Loaded") ));
      });
    });
  }
}