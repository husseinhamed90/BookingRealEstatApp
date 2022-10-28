part of 'filters_bloc.dart';

class FilteringState extends Equatable{
  final FireMessage ?message;
  final FireMessage ?errorMessage;
  List<HotelModel>hotels=[];
  final List<LocationModel>?locations;

    FilteringState({this.errorMessage,this.message, required this.hotels, this.locations});

  FilteringState copyWith({
     FireMessage ?message,
    FireMessage ?errorMessage,
    List<HotelModel>?hotels,
     List<LocationModel>?locations
  }) {
    return FilteringState(
      locations: locations ?? this.locations,
      hotels: hotels ?? this.hotels,
      message: message,
      errorMessage: errorMessage
    );
  }
  @override
  List<Object?> get props =>[errorMessage,locations,hotels,message];
}


