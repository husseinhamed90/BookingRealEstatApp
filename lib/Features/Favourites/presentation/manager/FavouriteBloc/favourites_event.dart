import 'package:realestate/Features/SearchForm/domain/entities/Hotel.dart';

import '../../../../Authentication/domain/entities/UserEntity.dart';

class FavouriteBlocEvent {}

class AddHotel extends FavouriteBlocEvent {
  Hotel hotel;
  AddHotel({required this.hotel});
}
class RemoveHotel extends FavouriteBlocEvent {
  Hotel hotel;
  RemoveHotel({required this.hotel});
}

class OpenBox extends FavouriteBlocEvent{
  UserEntity ?userData;
  OpenBox({this.userData});
}