part of 'filters_bloc.dart';

class LocationsEvent {}
class FetchLocationsEvent extends LocationsEvent {
  int pageNumber;
  FetchLocationsEvent({required this.pageNumber});
}

class StartFilterDataEvent extends LocationsEvent {
  final List<LocationModel>locations ;
  final int ?pageNumber;
  StartFilterDataEvent({required this.locations,required this.pageNumber});
}
class FireErrorMessageEvent extends LocationsEvent {
  final FireMessage errorMessage;
  FireErrorMessageEvent({required this.errorMessage});
}

class FetchMore extends LocationsEvent {

}
