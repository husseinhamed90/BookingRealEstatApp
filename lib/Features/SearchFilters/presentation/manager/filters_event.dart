part of 'filters_bloc.dart';

class LocationsEvent {}
class FetchLocationsEvent extends LocationsEvent {
  FetchLocationsEvent();
}

class StartFilterDataEvent extends LocationsEvent {
  final List<LocationModel>locations ;
  StartFilterDataEvent({required this.locations});
}
class FireErrorMessageEvent extends LocationsEvent {
  final FireMessage errorMessage;
  FireErrorMessageEvent({required this.errorMessage});
}
