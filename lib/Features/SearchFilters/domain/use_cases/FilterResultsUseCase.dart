import 'package:either_dart/either.dart';
import 'package:realestate/Features/SearchForm/data/remote/models/HotelModel.dart';
import '../../../../Core/SharedModel/FireMessage.dart';
import '../../data/remote/data_sources/RemoteDataSource.dart';
import '../../data/remote/models/LocationModel.dart';

class FilterResultsUseCase {

  RemoteDataSource remoteDataSource;
  FilterResultsUseCase(this.remoteDataSource);

  Future<Either<FireMessage, List<HotelModel>>> call({   required double minPrice,required int pageNumber,
    required double maxPrice,required int numberOfRooms, required int numberOfAdults, required LocationModel locationModel,required String checkIn,required String checkOut}) async {

    return await remoteDataSource.filterResults(
        maxPrice: maxPrice,
        minPrice: minPrice,
        pageNumber: pageNumber,
        cheekIn: checkIn,
        checkOut: checkOut,
        numberOfRooms: numberOfAdults,
        numberOfAdults: numberOfAdults,
        locationModel: locationModel);
  }
}
