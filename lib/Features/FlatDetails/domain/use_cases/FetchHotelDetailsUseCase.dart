import 'package:either_dart/either.dart';

import '../../../../Core/SharedModel/FireMessage.dart';
import '../../../SearchForm/data/remote/data_sources/RemoteSearchFormDataSource.dart';
import '../../data/remote/data_sources/RemoteHotelDetailsDataSource.dart';
import '../../data/remote/models/HotelDetailsModel.dart';

class FetchHotelDetailsUseCase{
  RemoteHotelDetailsDataSource remoteHotelDetailsDataSource;
  FetchHotelDetailsUseCase(this.remoteHotelDetailsDataSource);

  Future<Either<FireMessage, HotelDetailsModel>>call({required int hotelId})async{
    return await remoteHotelDetailsDataSource.fetchHotelDetails(hotelId: hotelId);
  }
}
