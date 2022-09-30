part of 'hotels_by_coordinates_bloc.dart';

class HotelsByCoordinatesEvent extends Equatable {
  const HotelsByCoordinatesEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class FetchHotelsByCoordinatesEvent extends HotelsByCoordinatesEvent {

  @override
  List<Object?> get props => [];
}

class FetchRoomsEvent extends FetchHotelsByCoordinatesEvent {
  FetchRoomsEvent(this.hotelId, this.currency);
  final int hotelId;
  final String currency;
  @override
  List<Object?> get props => [hotelId,currency];
}