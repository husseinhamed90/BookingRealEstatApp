part of 'HotelDetailsBloc.dart';

abstract class HotelDetailsEvent extends Equatable {
  const HotelDetailsEvent();
}

class FetchRoomsEvent extends HotelDetailsEvent {
  final String currency;
  final int hotelId;
  const FetchRoomsEvent({required this.hotelId,required this.currency});

  @override
  List<Object?> get props => [hotelId,currency];
}

class FetchHotelDetailsEvent extends HotelDetailsEvent{
  final HotelModel hotelModel;
  const FetchHotelDetailsEvent({required this.hotelModel});
  @override
  List<Object?> get props => [hotelModel];

}

class FetchHotelDescriptionEvent extends HotelDetailsEvent{
  final HotelModel hotelModel;
  final HotelDetailsModel hotelDetailsModel;
  const FetchHotelDescriptionEvent({required this.hotelModel,required this.hotelDetailsModel});
  @override
  List<Object?> get props => [hotelModel];

}

class FetchHotelPhotosEvent extends HotelDetailsEvent{
  final HotelModel hotelModel;
  final HotelDetailsModel hotelDetailsModel;
  final HotelDescriptionModel hotelDescriptionModel;
  const FetchHotelPhotosEvent({required this.hotelModel,required this.hotelDetailsModel,required this.hotelDescriptionModel});
  @override
  List<Object?> get props => [hotelModel,hotelDetailsModel];

}