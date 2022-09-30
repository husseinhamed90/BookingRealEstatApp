import 'package:either_dart/either.dart';
import 'package:realestate/Features/FlatDetails/data/remote/models/HotelPhotoModel.dart';
import '../../../../Core/SharedModel/FireMessage.dart';
import '../../../SearchForm/data/remote/data_sources/RemoteSearchFormDataSource.dart';
import '../../data/remote/data_sources/RemoteHotelDetailsDataSource.dart';

class FetchHotelPhotosUseCase{
  RemoteHotelDetailsDataSource remoteHotelDetailsDataSource;
  FetchHotelPhotosUseCase(this.remoteHotelDetailsDataSource);

  Future<Either<FireMessage, List<HotelPhotoModel>>>call({required int hotelId})async{
    return await remoteHotelDetailsDataSource.fetchHotelPhotos(hotelId: hotelId);
  }
}