import 'package:either_dart/src/either.dart';
import 'package:realestate/Core/FireMessage.dart';
import 'package:realestate/Core/Models/HotelPhotoModel.dart';
import 'package:realestate/Features/SearchForm/data/remote/models/HotelBlocksModel.dart';
import 'package:realestate/Features/SearchForm/data/remote/models/HotelModel.dart';
import 'package:realestate/Features/SearchForm/domain/entities/HotelDetails.dart';
import 'package:realestate/Features/SearchForm/domain/repositories/BaseSearchFormRepository.dart';

import '../remote/data_sources/RemoteSearchFormDataSource.dart';

class RemoteSearchFormRepository extends BaseSearchFormRepository{

  RemoteSearchFormDataSource  remoteSearchFormDataSource;
  RemoteSearchFormRepository(this.remoteSearchFormDataSource);
  @override
  Future<Either<FireMessage, List<HotelModel>>> getNearestHotelsFromMyLocation({required double latitude,required double longitude}) async {
      return await remoteSearchFormDataSource.fetchNearestHotels(latitude: latitude,longitude: longitude);
  }

  @override
  Future<Either<FireMessage, List<HotelPhotoModel>>> getHotelPhotos({required int hotelId}) async{
    return await remoteSearchFormDataSource.fetchHotelPhotos(hotelId: hotelId);

  }

  @override
  Future<Either<FireMessage, List<HotelBlocksModel>>> getHotelBlocks({required int hotelId, required String userCurrency}) async{
    return await remoteSearchFormDataSource.fetchRoomsOfHotel(hotelId: hotelId,userCurrency: userCurrency);
  }

  @override
  Future<Either<FireMessage, HotelDetails>> getHotelDetails({required int hotelId}) async{
    return await remoteSearchFormDataSource.fetchHotelDetails(hotelId: hotelId);
  }
}