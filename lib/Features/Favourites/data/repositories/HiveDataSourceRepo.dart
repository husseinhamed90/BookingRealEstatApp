import 'package:hive/hive.dart';
import 'package:realestate/Features/SearchForm/domain/entities/Hotel.dart';
import '../../domain/repositories/BaseLocalDataSource.dart';
import '../data_sources/LocalDataSource/FavouritesHiveDataSource.dart';

class FavouritesHiveDataSourceRepo extends BaseLocalDataSource{
  FavouritesHiveDataSource hiveDataSource;
  FavouritesHiveDataSourceRepo(this.hiveDataSource);
  @override
  Box<Hotel> addHotel(Hotel hotel) {
    return hiveDataSource.addHotel(hotel);
  }

  @override
  Future<Box<Hotel>> openHiveBox() async {

    return await hiveDataSource.openHiveBox();
  }

  @override
  Box<Hotel> removeHotel(Hotel hotel) {
    return hiveDataSource.removeHotel(hotel);
  }

  @override
  bool isItemExist(Hotel hotel) {
    return hiveDataSource.isItemExist(hotel);
  }
}