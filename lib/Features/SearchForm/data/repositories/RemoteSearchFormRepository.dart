import 'package:either_dart/src/either.dart';
import 'package:realestate/Core/SharedModel/FireMessage.dart';
import 'package:realestate/Features/FlatDetails/data/remote/models/HotelPhotoModel.dart';
import 'package:realestate/Features/SearchForm/data/remote/models/HotelModel.dart';
import 'package:realestate/Features/SearchForm/domain/repositories/BaseSearchFormRepository.dart';

import '../remote/data_sources/RemoteSearchFormDataSource.dart';

class RemoteSearchFormRepository extends BaseSearchFormRepository{

  RemoteSearchFormDataSource  remoteSearchFormDataSource;
  RemoteSearchFormRepository(this.remoteSearchFormDataSource);
  @override
  Future<Either<FireMessage, List<HotelModel>>> getNearestHotelsFromMyLocation({required double latitude,required double longitude}) async {
      return await remoteSearchFormDataSource.fetchNearestHotels(latitude: latitude,longitude: longitude);
  }
}