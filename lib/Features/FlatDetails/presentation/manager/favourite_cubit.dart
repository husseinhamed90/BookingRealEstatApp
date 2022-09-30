import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:realestate/Core/AppTheme/AppColors.dart';

import '../../../SearchForm/data/remote/models/HotelModel.dart';

part 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  List<HotelModel>favourites=[];
  FavouriteCubit() : super(FavouriteState().copyWith(favs: []));
  void addHotel(HotelModel hotelModel){
    favourites.add(hotelModel);
  }

  void removeItem(HotelModel hotelModel){
    favourites.removeWhere((element) => element.hotelId ==hotelModel.hotelId);

  }

  void updateList(HotelModel hotelModel){

    if(favourites.contains(hotelModel)){
      removeItem(hotelModel);
    }
    else{
      addHotel(hotelModel);
    }
    changeColor(hotelModel);
  }
  Color changeColor(HotelModel hotelModel){
    if(favourites.contains(hotelModel)){
      emit(state.copyWith(color: primaryColor));

      return primaryColor;
    }
    else{
      emit(state.copyWith(color: const Color(0xff9197a2)));
      return const Color(0xff9197a2);
    }
  }
}
