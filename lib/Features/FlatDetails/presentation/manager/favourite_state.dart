part of 'favourite_cubit.dart';

class FavouriteState extends Equatable {
  final Color?color;
  FavouriteState({this.color});

  FavouriteState copyWith({
    List<HotelModel>?favs,
    Color?color
  }) {
    return FavouriteState(
      color: color ?? this.color,
    );
  }
  @override
  // TODO: implement props
  List<Object?> get props => [color];
}

