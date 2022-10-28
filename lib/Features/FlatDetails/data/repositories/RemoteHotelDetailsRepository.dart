import 'package:either_dart/either.dart';
import 'package:realestate/Features/FlatDetails/data/remote/data_sources/RemoteHotelDetailsDataSource.dart';
import 'package:realestate/Features/FlatDetails/domain/repositories/BaseHotelDetailsRepository.dart';
import '../../../../Core/SharedModel/FireMessage.dart';
import '../../domain/entities/HotelDetails.dart';
import '../remote/models/HotelBlocksModel.dart';
import '../remote/models/HotelPhotoModel.dart';

class RemoteHotelDetailsRepository extends BaseHotelDetailsRepository{

  RemoteHotelDetailsDataSource  remoteHotelDetailsDataSource;
  RemoteHotelDetailsRepository(this.remoteHotelDetailsDataSource);

  @override
  Future<Either<FireMessage, List<HotelPhotoModel>>> getHotelPhotos({required int hotelId}) async{
    return await remoteHotelDetailsDataSource.fetchHotelPhotos(hotelId: hotelId);
  }

  @override
  Future<Either<FireMessage, List<HotelBlocksModel>>> getHotelBlocks({required DateTime startDate,required DateTime endDate,required int hotelId, required String userCurrency}) async{
    return await remoteHotelDetailsDataSource.fetchRoomsOfHotel(startDate: startDate,endDate: endDate,hotelId: hotelId,userCurrency: userCurrency);
  }

  @override
  Future<Either<FireMessage, HotelDetails>> getHotelDetails({required int hotelId}) async{
    return await remoteHotelDetailsDataSource.fetchHotelDetails(hotelId: hotelId);
  }
}