part of 'hotels_by_coordinates_bloc.dart';

// abstract class HotelsByCoordinatesState extends Equatable {
//   final ErrorMessage errorMessage;
//   const HotelsByCoordinatesState(this.errorMessage);
// }

class HotelsByCoordinatesState extends Equatable{
  final FireMessage ?errorMessage;
  final List<HotelModel>?hotels;
  final List<LocationModel>?locations;
  final List<HotelBlocksModel>?hotelBlocksModel;
  final HotelModel? hotelModel;
  final HotelDetailsModel ?hotelDetailsModel;

  const HotelsByCoordinatesState({this.errorMessage, this.hotels, this.locations,this.hotelDetailsModel,this.hotelBlocksModel,this.hotelModel});

  HotelsByCoordinatesState copyWith({
    FireMessage ?message,
    List<HotelModel>?hotels,
    List<LocationModel>?locations,
    HotelDetailsModel?hotelDetailsModel,
    List<HotelBlocksModel>?hotelBlocksModel,
    HotelModel? hotelModel
  }) {
    return HotelsByCoordinatesState(
      locations: locations ?? this.locations,
      hotels: hotels ?? this.hotels,
      hotelModel: hotelModel ?? this.hotelModel,
      errorMessage: message ?? this.errorMessage,
      hotelDetailsModel: hotelDetailsModel ?? this.hotelDetailsModel,
      hotelBlocksModel: hotelBlocksModel ?? this.hotelBlocksModel,
    );
  }
  @override
  List<Object?> get props =>[locations,hotels,errorMessage,hotelBlocksModel,hotelDetailsModel];
}
