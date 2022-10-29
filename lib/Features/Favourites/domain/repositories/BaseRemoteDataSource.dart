
import '../../../SearchForm/domain/entities/Hotel.dart';

abstract class BaseRemoteDataSource{
  Future addHotel(Hotel hotel);
  Future removeHotel(Hotel hotel);
}