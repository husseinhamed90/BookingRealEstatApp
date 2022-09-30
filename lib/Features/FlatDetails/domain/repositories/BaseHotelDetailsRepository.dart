import 'package:either_dart/either.dart';

import '../../../../Core/SharedModel/FireMessage.dart';
import '../../data/remote/models/HotelBlocksModel.dart';
import '../../data/remote/models/HotelPhotoModel.dart';
import '../entities/HotelDetails.dart';

abstract class BaseHotelDetailsRepository{
  Future<Either<FireMessage, List<HotelBlocksModel>>>getHotelBlocks({required int hotelId,required String userCurrency});
  Future<Either<FireMessage, List<HotelPhotoModel>>>getHotelPhotos({required int hotelId});
  Future<Either<FireMessage, HotelDetails>> getHotelDetails({required int hotelId});
}