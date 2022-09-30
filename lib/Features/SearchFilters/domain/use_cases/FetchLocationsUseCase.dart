import 'package:either_dart/either.dart';
import 'package:realestate/Features/SearchFilters/data/remote/data_sources/RemoteDataSource.dart';
import 'package:realestate/Features/SearchFilters/data/remote/models/LocationModel.dart';

import '../../../../Core/FireMessage.dart';

class FetchLocationsUseCase {
  RemoteDataSource remoteDataSource;
  FetchLocationsUseCase(this.remoteDataSource);
  Future<Either<FireMessage, List<LocationModel>>>call({required String locationString})async{
    return await remoteDataSource.fetchLocations(locationString);
  }
}