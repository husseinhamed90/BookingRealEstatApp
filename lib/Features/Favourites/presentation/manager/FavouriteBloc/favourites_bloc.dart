import 'dart:ui';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:realestate/Core/AppTheme/AppColors.dart';
import 'package:realestate/Core/EventCommand.dart';
import 'package:realestate/Core/Utils.dart';
import 'package:realestate/DependencyInjection.dart';
import 'package:realestate/Features/SearchForm/domain/entities/Hotel.dart';

import '../../../../../Core/AppTheme/Strings.dart';
import '../../../../Favourites/data/repositories/FirebaseDataSourceRepo.dart';
import '../../../../Favourites/data/repositories/HiveDataSourceRepo.dart';
import 'favourites_event.dart';

part 'favourites_state.dart';

class FavouriteBloc extends Bloc<FavouriteBlocEvent,FavouriteState> implements EventCommand{

  late Box<Hotel> favouriteBox;

  FavouriteBlocEvent ? lastExecutedEvent;

  void setLastExecutedEvent(FavouriteBlocEvent filteringEvent){
    lastExecutedEvent = filteringEvent;
  }

  FavouriteBloc() : super(const FavouriteState(message: loading)) {
    on<AddHotel>((event, emit) async{
      setLastExecutedEvent(event);
      if(await getInternetConnectionState()){
        dl.get<FavouritesHiveDataSourceRepo>().addHotel(event.hotel);
        emit(state.copyWith(message: "Loading"));
        await dl.get<FirebaseDataSourceRepo>().addHotel(event.hotel);
        emit(state.copyWith(favouritesList: favouriteBox.values.toList(),message: ""));
      }
      else{
        emit(state.copyWith(message: "No Internet"));
      }
    });

    on<OpenBox>((event, emit) async{
      setLastExecutedEvent(event);
      emit(state.copyWith(message: "Loading"));
      await openFavouritesBox(emit);
    });

    on<RemoveHotel>((event, emit) async{
      setLastExecutedEvent(event);
      if(await getInternetConnectionState()){
        dl.get<FavouritesHiveDataSourceRepo>().removeHotel(event.hotel);
        emit(state.copyWith(message: "Loading"));
        await dl.get<FirebaseDataSourceRepo>().removeHotel(event.hotel);
        emit(state.copyWith(favouritesList: favouriteBox.values.toList(),message: ""));
      }
      else{
        emit(state.copyWith(message: "No Internet"));
      }
    });
  }

  @override
  void executeCommand() {
    add(lastExecutedEvent!);
  }

  Future openFavouritesBox(Emitter<FavouriteState> emit)async{
    return await dl.get<FavouritesHiveDataSourceRepo>().openHiveBox().then((value) {
      favouriteBox=value;
      emit(state.copyWith(favouritesList: favouriteBox.values.toList(),message: ""));
    });
  }

  void updateList(Hotel hotelModel){
    if(isItemExist(hotelModel)){
      add(RemoveHotel(hotel: hotelModel));
    }
    else{
      add(AddHotel(hotel: hotelModel));
    }
  }
  Color getCorrectIconColor(Hotel hotelModel) {
    return isItemExist(hotelModel)?primaryColor:const Color(0xff9197a2);
  }

  bool isItemExist(Hotel hotel) {
    return  dl.get<FavouritesHiveDataSourceRepo>().isItemExist(hotel)?true:false;
  }
}