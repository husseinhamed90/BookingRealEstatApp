import 'package:either_dart/either.dart';
import 'package:realestate/Features/SearchForm/data/remote/models/HotelDetailsModel.dart';

import '../../../../Core/FireMessage.dart';
import '../../data/remote/data_sources/RemoteSearchFormDataSource.dart';

class FetchHotelDetailsUseCase{
  RemoteSearchFormDataSource remoteSearchFormDataSource;
  FetchHotelDetailsUseCase(this.remoteSearchFormDataSource);

  Future<Either<FireMessage, HotelDetailsModel>>call({required int hotelId})async{
    return await remoteSearchFormDataSource.fetchHotelDetails(hotelId: hotelId);
  }
}
