import 'package:either_dart/either.dart';
import 'package:realestate/Features/SearchForm/data/remote/data_sources/RemoteSearchFormDataSource.dart';

import '../../../../Core/FireMessage.dart';
import '../../data/remote/models/HotelBlocksModel.dart';

class FetchHotelRoomsUseCase{
  RemoteSearchFormDataSource remoteSearchFormDataSource;
  FetchHotelRoomsUseCase(this.remoteSearchFormDataSource);

  Future<Either<FireMessage, List<HotelBlocksModel>>>call({required int hotelId,required String userCurrency})async{
     return await remoteSearchFormDataSource.fetchRoomsOfHotel(hotelId: hotelId, userCurrency: userCurrency);
  }
}