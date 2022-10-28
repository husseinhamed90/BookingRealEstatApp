part of 'filters_bloc.dart';

class FilteringEvent {}
class FetchLocationsEvent extends FilteringEvent {
  int pageNumber;
  FetchLocationsEvent({required this.pageNumber});
}

class StartFilterDataEvent extends FilteringEvent {
  final List<LocationModel>locations ;
  final int ?pageNumber;
  StartFilterDataEvent({required this.locations,required this.pageNumber});
}
class FireErrorMessageEvent extends FilteringEvent {
  final FireMessage errorMessage;
  FireErrorMessageEvent({required this.errorMessage});
}

class FetchMore extends FilteringEvent {

}
