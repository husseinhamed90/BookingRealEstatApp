import '../../../FlatDetails/domain/entities/HotelRooms.dart';

class BookedRoomsEvent {}

class GetBookedHotels extends BookedRoomsEvent {

}

class BookHotel extends BookedRoomsEvent {
  final Block ?block;
  BookHotel({this.block});
}
