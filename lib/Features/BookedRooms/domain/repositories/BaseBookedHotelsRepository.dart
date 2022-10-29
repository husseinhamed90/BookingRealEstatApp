import 'package:realestate/Features/FlatDetails/domain/entities/HotelRooms.dart';

abstract class BaseBookedHotelsRepository{
  Future bookHotel(Block block);
  Future getBookedHotels();
}