import 'package:either_dart/either.dart';
import 'package:realestate/Features/SearchForm/data/remote/models/DescriptionModel.dart';

import '../../../../Core/FireMessage.dart';
import '../../data/remote/data_sources/RemoteSearchFormDataSource.dart';

class FetchHotelDescriptionUseCase{
  RemoteSearchFormDataSource remoteSearchFormDataSource;
  FetchHotelDescriptionUseCase(this.remoteSearchFormDataSource);

  Future<Either<FireMessage, HotelDescriptionModel>>call({required int hotelId})async{
    return await remoteSearchFormDataSource.fetchHotelDescription(hotelId: hotelId);
  }
}