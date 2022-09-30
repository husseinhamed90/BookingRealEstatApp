

import 'package:equatable/equatable.dart';
import 'package:realestate/Features/SearchForm/data/remote/models/DescriptionModel.dart';
import 'package:realestate/Features/SearchForm/data/remote/models/HotelDetailsModel.dart';

import '../../../../../Core/FireMessage.dart';
import '../../../../../Core/Models/HotelPhotoModel.dart';
import '../../../../SearchForm/data/remote/models/HotelBlocksModel.dart';
import '../../../../SearchForm/data/remote/models/HotelModel.dart';


class HotelDetailsState extends Equatable{
  final FireMessage ?errorMessage;
  final bool ?isFav;
  final List<HotelBlocksModel>?hotelBlockModel;
  final HotelDetailsModel? hotelDetailsModel;
  final HotelModel? hotelModel;
  final HotelDescriptionModel? hotelDescriptionModel;
  final List<HotelPhotoModel>?hotelPhotoModel;
  const HotelDetailsState({this.errorMessage, this.hotelBlockModel, this.hotelDetailsModel,this.hotelModel,this.hotelDescriptionModel,this.hotelPhotoModel,this.isFav});

  HotelDetailsState copyWith({
    FireMessage ?errorMessage,
    List<HotelBlocksModel>?hotelBlockModel,
    HotelDetailsModel? hotelDetailsModel,
    HotelModel? hotelModel,
    bool ?isFav,
    HotelDescriptionModel? hotelDescriptionModel,
    List<HotelPhotoModel>?hotelPhotoModel,
  }) {
    return HotelDetailsState(
        hotelBlockModel: hotelBlockModel ?? this.hotelBlockModel,
        hotelDetailsModel :hotelDetailsModel??this.hotelDetailsModel,
        errorMessage: errorMessage ?? this.errorMessage,
        isFav :isFav??this.isFav,
        hotelModel: hotelModel??this.hotelModel,
        hotelPhotoModel: hotelPhotoModel??this.hotelPhotoModel,
        hotelDescriptionModel: hotelDescriptionModel??this.hotelDescriptionModel
    );
  }
  @override
  List<Object?> get props =>[hotelBlockModel,hotelDetailsModel,errorMessage,hotelModel,hotelDescriptionModel,hotelPhotoModel,isFav];
}


