import 'package:hive/hive.dart';
import 'package:realestate/Features/FavouriteIcon/domain/repositories/BaseLocalDataSource.dart';
import 'package:realestate/Features/SearchForm/domain/entities/Hotel.dart';
import '../data_sources/LocalDataSource/HiveDataSource.dart';

class HiveDataSourceRepo extends BaseLocalDataSource{
  HiveDataSource hiveDataSource;
  HiveDataSourceRepo(this.hiveDataSource);
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