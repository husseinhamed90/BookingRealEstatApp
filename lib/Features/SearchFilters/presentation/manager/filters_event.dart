part of 'filters_bloc.dart';

abstract class FilteringEvent extends Equatable{

}
class FetchLocationsEvent extends FilteringEvent {
  final int pageNumber;
  FetchLocationsEvent({required this.pageNumber});

  @override
  // TODO: implement props
  List<Object?> get props => [pageNumber];
}

class StartFilterDataEvent extends FilteringEvent {
  final List<LocationModel>locations ;
  final int ?pageNumber;
  StartFilterDataEvent({required this.locations,required this.pageNumber});

  @override
  // TODO: implement props
  List<Object?> get props => [locations,pageNumber];
}
class FireErrorMessageEvent extends FilteringEvent {
  final FireMessage errorMessage;
  FireErrorMessageEvent({required this.errorMessage});

  @override
  // TODO: implement props
  List<Object?> get props => [errorMessage];
}

class FetchMore extends FilteringEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
