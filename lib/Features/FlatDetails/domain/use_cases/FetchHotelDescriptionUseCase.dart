import 'package:either_dart/either.dart';
import 'package:realestate/Features/FlatDetails/data/remote/models/DescriptionModel.dart';

import '../../../../Core/SharedModel/FireMessage.dart';
import '../../../SearchForm/data/remote/data_sources/RemoteSearchFormDataSource.dart';
import '../../data/remote/data_sources/RemoteHotelDetailsDataSource.dart';

class FetchHotelDescriptionUseCase{
  RemoteHotelDetailsDataSource remoteHotelDetailsDataSource;
  FetchHotelDescriptionUseCase(this.remoteHotelDetailsDataSource);

  Future<Either<FireMessage, HotelDescriptionModel>>call({required int hotelId})async{
    return await remoteHotelDetailsDataSource.fetchHotelDescription(hotelId: hotelId);
  }
}