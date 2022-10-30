part of 'favourites_bloc.dart';

class FavouriteState extends Equatable {
  final List<Hotel>?favouritesList;
  final String ?message;
  const FavouriteState({this.favouritesList,this.message});

  FavouriteState copyWith({
    List<Hotel>?favouritesList,
    String ?message,
  }) {
    return FavouriteState(
      favouritesList :favouritesList??this.favouritesList,
      message: message??this.message);
  }
  @override
  List<Object?> get props => [favouritesList,message];
}