import 'package:either_dart/either.dart';
import 'package:realestate/Features/SearchForm/data/remote/models/HotelModel.dart';
import '../../../../Core/FireMessage.dart';
import '../../data/remote/data_sources/RemoteDataSource.dart';
import '../../data/remote/models/LocationModel.dart';

class FilterResultsUseCase {

  RemoteDataSource remoteDataSource;
  FilterResultsUseCase(this.remoteDataSource);

  Future<Either<FireMessage, List<HotelModel>>> call({required int numberOfRooms, required int numberOfAdults, required LocationModel locationModel}) async {

    return await remoteDataSource.filterResults(
        numberOfRooms: numberOfAdults,
        numberOfAdults: numberOfAdults,
        locationModel: locationModel);
  }
}
