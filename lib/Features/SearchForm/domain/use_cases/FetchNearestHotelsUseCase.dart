import 'package:either_dart/either.dart';
import 'package:realestate/Features/SearchForm/data/remote/data_sources/RemoteSearchFormDataSource.dart';

import '../../../../Core/FireMessage.dart';
import '../../data/remote/models/HotelModel.dart';

class FetchNearestHotelsUseCase {
  RemoteSearchFormDataSource remoteSearchFormDataSource;

  FetchNearestHotelsUseCase(this.remoteSearchFormDataSource);

  Future<Either<FireMessage, List<HotelModel>>> call({required double latitude,required double longitude}) async {
    return await remoteSearchFormDataSource.fetchNearestHotels(latitude: latitude,longitude: longitude);
  }
}