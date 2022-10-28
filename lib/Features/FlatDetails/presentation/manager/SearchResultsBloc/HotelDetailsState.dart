

import 'package:equatable/equatable.dart';
import 'package:realestate/Features/FlatDetails/data/remote/models/DescriptionModel.dart';
import '../../../../../Core/SharedModel/FireMessage.dart';
import '../../../../SearchForm/domain/entities/Hotel.dart';
import '../../../data/remote/models/HotelBlocksModel.dart';
import '../../../data/remote/models/HotelDetailsModel.dart';
import '../../../data/remote/models/HotelPhotoModel.dart';
import '../../../../SearchForm/data/remote/models/HotelModel.dart';


class HotelDetailsState extends Equatable{
  final FireMessage ?message;
  final FireMessage ?errorMessage;
  final bool ?isFav;
  final List<HotelBlocksModel>?hotelBlockModel;
  final HotelDetailsModel? hotelDetailsModel;
  final Hotel? hotelModel;
  final HotelDescriptionModel? hotelDescriptionModel;
  final List<HotelPhotoModel>?hotelPhotoModel;
  const HotelDetailsState({this.errorMessage,this.message, this.hotelBlockModel, this.hotelDetailsModel,this.hotelModel,this.hotelDescriptionModel,this.hotelPhotoModel,this.isFav});

  HotelDetailsState copyWith({
    FireMessage ?message,
    FireMessage ?errorMessage,
    List<HotelBlocksModel>?hotelBlockModel,
    HotelDetailsModel? hotelDetailsModel,
    Hotel? hotelModel,
    bool ?isFav,
    HotelDescriptionModel? hotelDescriptionModel,
    List<HotelPhotoModel>?hotelPhotoModel,
  }) {

    return HotelDetailsState(
        hotelBlockModel: hotelBlockModel,
        errorMessage: errorMessage,
        hotelDetailsModel :hotelDetailsModel,
        message: message,
        isFav :isFav,
        hotelModel: hotelModel,
        hotelPhotoModel: hotelPhotoModel,
        hotelDescriptionModel: hotelDescriptionModel
    );
  }
  @override
  List<Object?> get props =>[errorMessage,identityHashCode(this),hotelBlockModel,hotelDetailsModel,message,hotelModel,hotelDescriptionModel,hotelPhotoModel,isFav];
}


