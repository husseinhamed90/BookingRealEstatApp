import 'package:realestate/Features/SearchForm/domain/entities/Hotel.dart';

import '../../domain/repositories/BaseRemoteDataSource.dart';
import '../data_sources/RemoteDataSource/FavouritesFirebaseDataSource.dart';

class FirebaseDataSourceRepo extends BaseRemoteDataSource{
  FavouritesFirebaseDataSource firebaseDataSource;
  FirebaseDataSourceRepo(this.firebaseDataSource);
  @override
  Future addHotel(Hotel hotel) {
    return firebaseDataSource.addHotel(hotel);
  }

  @override
  Future removeHotel(Hotel hotel) {
    return firebaseDataSource.removeHotel(hotel.hotelId!);
  }

}