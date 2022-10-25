part of 'favourite_cubit.dart';

class FavouriteState extends Equatable {
  final List<Hotel>?favouritesList;
  final String ?message;
  const FavouriteState({this.favouritesList,this.message});

  FavouriteState copyWith({
    List<Hotel>?favouritesList,
    String ?message,
    Color?color
  }) {
    return FavouriteState(
      favouritesList :favouritesList??this.favouritesList,
      message: message??this.message);
  }
  @override
  List<Object?> get props => [favouritesList,identityHashCode(this),message];
}