import 'package:realestate/Features/FavouriteIcon/data/data_sources/RemoteDataSource/FirebaseDataSource.dart';
import 'package:realestate/Features/FavouriteIcon/domain/repositories/BaseRemoteDataSource.dart';
import 'package:realestate/Features/SearchForm/domain/entities/Hotel.dart';

class FirebaseDataSourceRepo extends BaseRemoteDataSource{
  FirebaseDataSource firebaseDataSource;
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