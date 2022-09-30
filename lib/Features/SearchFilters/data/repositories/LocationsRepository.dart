import 'package:either_dart/either.dart';
import 'package:realestate/Features/SearchFilters/data/remote/data_sources/RemoteDataSource.dart';
import 'package:realestate/Features/SearchFilters/data/remote/models/LocationModel.dart';
import 'package:realestate/Features/SearchFilters/domain/repositories/BaseLocationsRepository.dart';

import '../../../../Core/SharedModel/FireMessage.dart';

class LocationsRepository extends BaseLocationsRepository{
  RemoteDataSource remoteDataSource;
  LocationsRepository(this.remoteDataSource);

  @override
  Future<Either<FireMessage, List<LocationModel>>> getLocations({required String locationString}) {
    return remoteDataSource.fetchLocations(locationString);
  }

}