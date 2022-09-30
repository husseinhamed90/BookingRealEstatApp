import 'package:either_dart/either.dart';
import 'package:realestate/Features/FlatDetails/data/remote/data_sources/RemoteHotelDetailsDataSource.dart';
import '../../../../Core/SharedModel/FireMessage.dart';
import '../../data/remote/models/HotelBlocksModel.dart';

class FetchHotelRoomsUseCase{
  RemoteHotelDetailsDataSource remoteHotelDetailsDataSource;
  FetchHotelRoomsUseCase(this.remoteHotelDetailsDataSource);

  Future<Either<FireMessage, List<HotelBlocksModel>>>call({required int hotelId,required String userCurrency})async{
     return await remoteHotelDetailsDataSource.fetchRoomsOfHotel(hotelId: hotelId, userCurrency: userCurrency);
  }
}