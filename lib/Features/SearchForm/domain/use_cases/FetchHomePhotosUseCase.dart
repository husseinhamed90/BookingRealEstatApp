import 'package:either_dart/either.dart';
import 'package:realestate/Core/Models/HotelPhotoModel.dart';
import '../../../../Core/FireMessage.dart';
import '../../data/remote/data_sources/RemoteSearchFormDataSource.dart';

class FetchHotelPhotosUseCase{
  RemoteSearchFormDataSource remoteSearchFormDataSource;
  FetchHotelPhotosUseCase(this.remoteSearchFormDataSource);

  Future<Either<FireMessage, List<HotelPhotoModel>>>call({required int hotelId})async{
    return await remoteSearchFormDataSource.fetchHotelPhotos(hotelId: hotelId);
  }
}