
import 'package:either_dart/either.dart';
import 'package:realestate/Features/SearchForm/data/remote/models/HotelModel.dart';
import '../../../../Core/FireMessage.dart';
import '../../../../Core/Models/HotelPhotoModel.dart';
import '../../data/remote/models/HotelBlocksModel.dart';
import '../entities/HotelDetails.dart';

abstract class BaseSearchFormRepository{
  Future<Either<FireMessage, List<HotelModel>>>getNearestHotelsFromMyLocation({required double latitude,required double longitude});
  Future<Either<FireMessage, List<HotelBlocksModel>>>getHotelBlocks({required int hotelId,required String userCurrency});
  Future<Either<FireMessage, List<HotelPhotoModel>>>getHotelPhotos({required int hotelId});
  Future<Either<FireMessage, HotelDetails>> getHotelDetails({required int hotelId});
}