part of 'hotels_by_coordinates_bloc.dart';

// abstract class HotelsByCoordinatesState extends Equatable {
//   final ErrorMessage errorMessage;
//   const HotelsByCoordinatesState(this.errorMessage);
// }

class HotelsByCoordinatesState extends Equatable{
  final FireMessage ?errorMessage;
  final FireMessage ?message;
  final List<HotelModel>?hotels;
  final List<LocationModel>?locations;
  final List<HotelBlocksModel>?hotelBlocksModel;
  final HotelModel? hotelModel;
  final HotelDetailsModel ?hotelDetailsModel;

  const HotelsByCoordinatesState({this.message,this.errorMessage, this.hotels, this.locations,this.hotelDetailsModel,this.hotelBlocksModel,this.hotelModel});

  HotelsByCoordinatesState copyWith({
    FireMessage ?message,
    FireMessage ?errorMessage,
    List<HotelModel>?hotels,
    List<LocationModel>?locations,
    HotelDetailsModel?hotelDetailsModel,
    List<HotelBlocksModel>?hotelBlocksModel,
    HotelModel? hotelModel
  }) {
    return HotelsByCoordinatesState(
      locations: locations ?? this.locations,
      message: message,
      hotels: hotels ?? this.hotels,
      hotelModel: hotelModel ?? this.hotelModel,
      errorMessage: errorMessage,
      hotelDetailsModel: hotelDetailsModel ?? this.hotelDetailsModel,
      hotelBlocksModel: hotelBlocksModel ?? this.hotelBlocksModel,
    );
  }
  @override
  List<Object?> get props =>[message,locations,hotels,errorMessage,hotelBlocksModel,hotelDetailsModel];
}
