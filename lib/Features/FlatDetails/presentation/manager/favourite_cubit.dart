import 'dart:convert';
import 'dart:ui';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:realestate/Core/AppTheme/AppColors.dart';
import 'package:realestate/Features/SearchForm/domain/entities/Hotel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../SearchForm/data/remote/models/HotelModel.dart';

part 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  List<Hotel>favourites=[];
   late Box<Hotel> box;
  void setFavourites()async{
    box = Hive.box<Hotel>('favourites');
    for (Hotel element in box.values) {
      favourites.add(element);
    }
    emit(state.copyWith(favouritesList: favourites));
  }
  FavouriteCubit() : super(const FavouriteState().copyWith(favouritesList: []));
  Future<void> addHotel(Hotel hotelModel) async {
    favourites.add(hotelModel);
    box.put(hotelModel.hotelId.toString(), hotelModel);
    emit(ItemAdded(favourites));
  }
  void removeItem(Hotel hotelModel){
    favourites.removeWhere((element) => element.hotelId == hotelModel.hotelId);
    box.delete(hotelModel.hotelId.toString());
    emit(ItemRemoved(favourites));
  }

  void updateList(Hotel hotelModel){
    if(isItemExist(hotelModel)){
      removeItem(hotelModel);
    }
    else{
      addHotel(hotelModel);
    }
  }
  Color getIconColor(Hotel hotelModel) {
    return isItemExist(hotelModel)?primaryColor:const Color(0xff9197a2);
  }

  bool isItemExist(Hotel hotelModel) {
    return box.get(hotelModel.hotelId.toString())!=null?true:false;

  }
}