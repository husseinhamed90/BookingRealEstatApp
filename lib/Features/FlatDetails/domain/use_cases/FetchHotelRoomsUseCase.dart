import 'package:either_dart/either.dart';
import 'package:realestate/Features/FlatDetails/data/remote/data_sources/RemoteHotelDetailsDataSource.dart';
import '../../../../Core/SharedModel/FireMessage.dart';
import '../../data/remote/models/HotelBlocksModel.dart';

class FetchHotelRoomsUseCase{
  RemoteHotelDetailsDataSource remoteHotelDetailsDataSource;
  FetchHotelRoomsUseCase(this.remoteHotelDetailsDataSource);

  Future<Either<FireMessage, List<HotelBlocksModel>>>call({required DateTime startDate,required DateTime endDate,required int hotelId,required String userCurrency})async{
     return await remoteHotelDetailsDataSource.fetchRoomsOfHotel(startDate: startDate,endDate: endDate,hotelId: hotelId, userCurrency: userCurrency);
  }
}