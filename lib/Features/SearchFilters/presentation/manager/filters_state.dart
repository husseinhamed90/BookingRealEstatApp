part of 'filters_bloc.dart';

class FilteringState extends Equatable{
  final FireMessage ?errorMessage;
  final List<HotelModel>?hotels;
  final List<LocationModel>?locations;

  const FilteringState({this.errorMessage, this.hotels, this.locations});

  FilteringState copyWith({
     FireMessage ?errorMessage,
     List<HotelModel>?hotels,
     List<LocationModel>?locations
  }) {
    return FilteringState(
      locations: locations ?? this.locations,
      hotels: hotels ?? this.hotels,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
  @override
  List<Object?> get props =>[locations,hotels,errorMessage];
}


