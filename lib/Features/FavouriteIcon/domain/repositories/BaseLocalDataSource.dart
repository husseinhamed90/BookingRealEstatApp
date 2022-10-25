
import 'package:hive/hive.dart';

import '../../../SearchForm/domain/entities/Hotel.dart';

abstract class BaseLocalDataSource{
  Future<Box<Hotel>> openHiveBox();
  Box<Hotel> addHotel(Hotel hotel);
  Box<Hotel> removeHotel(Hotel hotel);
  bool isItemExist(Hotel hotel);
}