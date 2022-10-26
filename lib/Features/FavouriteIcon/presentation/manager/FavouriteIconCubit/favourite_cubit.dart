import 'dart:ui';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:realestate/Core/AppTheme/AppColors.dart';
import 'package:realestate/DependencyInjection.dart';
import 'package:realestate/Features/FavouriteIcon/data/repositories/FirebaseDataSourceRepo.dart';
import 'package:realestate/Features/SearchForm/domain/entities/Hotel.dart';

import '../../../../../PaymentDone.dart';
import '../../../data/repositories/HiveDataSourceRepo.dart';

part 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {

  late Box<Hotel> favouriteBox;

  FavouriteCubit() : super(const FavouriteState().copyWith(favouritesList: []));


  Future openFavouritesBox()async{
    return await dl.get<HiveDataSourceRepo>().openHiveBox().then((value) {
      favouriteBox=value;
      emit(state.copyWith(favouritesList: favouriteBox.values.toList()));

    });
  }

  Future<void> addHotel(Hotel hotel) async {
    dl.get<HiveDataSourceRepo>().addHotel(hotel);
    emit(state.copyWith(message: "Loading"));
    await dl.get<FirebaseDataSourceRepo>().addHotel(hotel);
    emit(state.copyWith(favouritesList: favouriteBox.values.toList(),message: ""));
  }

  void removeItem(Hotel hotel)async{
    dl.get<HiveDataSourceRepo>().removeHotel(hotel);
    emit(state.copyWith(message: "Loading"));
    await dl.get<FirebaseDataSourceRepo>().removeHotel(hotel);
    emit(state.copyWith(favouritesList: favouriteBox.values.toList(),message: ""));
  }

  void updateList(Hotel hotelModel){
    if(isItemExist(hotelModel)){
      removeItem(hotelModel);
    }
    else{
      addHotel(hotelModel);
    }
  }
  Color getCorrectIconColor(Hotel hotelModel) {
    return isItemExist(hotelModel)?primaryColor:const Color(0xff9197a2);
  }

  bool isItemExist(Hotel hotel) {
    return  dl.get<HiveDataSourceRepo>().isItemExist(hotel)?true:false;
  }

  void goToNexPage() {
    emit(state.copyWith(message: "PaymentDone"));
  }
}