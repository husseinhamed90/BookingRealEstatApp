part of 'favourite_cubit.dart';

class FavouriteState extends Equatable {
  final Color?color;
  final List<Hotel>?favouritesList;
  const FavouriteState({this.color,this.favouritesList});

  FavouriteState copyWith({
    List<Hotel>?favouritesList,
    Color?color
  }) {
    return FavouriteState(
      color: color ?? this.color,
      favouritesList :favouritesList??this.favouritesList
    );
  }
  @override
  List<Object?> get props => [color,favouritesList,identityHashCode(this)];
}

class ItemAdded extends FavouriteState{
  @override
  final List<Hotel>?favouritesList;
  const ItemAdded(this.favouritesList);
}

class ItemRemoved extends FavouriteState{
  @override
  final List<Hotel>?favouritesList;
  const ItemRemoved(this.favouritesList);
}

