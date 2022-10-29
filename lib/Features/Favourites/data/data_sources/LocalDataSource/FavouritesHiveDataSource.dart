
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';
import 'package:realestate/DependencyInjection.dart';
import 'package:realestate/Features/Authentication/presentation/manager/auth_bloc.dart';
import 'package:realestate/Features/SearchForm/data/remote/models/HotelModel.dart';

import '../../../../SearchForm/domain/entities/Hotel.dart';

class FavouritesHiveDataSource{
  Box<Hotel>?favouritesBox;

  Future<Box<Hotel>> openHiveBox()async {
    await Hive.openBox<Hotel>(dl.get<AuthBloc>().userEntity!.id.toString());
    favouritesBox = Hive.box<Hotel>(dl.get<AuthBloc>().userEntity!.id.toString());
    await favouritesBox!.clear();
    await FirebaseFirestore.instance.collection("Users").doc(dl.get<AuthBloc>().userEntity!.id).collection("Favourites").get().then((value) {

      for (var element in value.docs) {
        favouritesBox!.put(element.data()["hotel_id"].toString(),HotelModel.fromJson(element.data()));
      }
    });
    return favouritesBox!;
  }
  bool isItemExist(Hotel hotel){
    return favouritesBox!.get(hotel.hotelId.toString())!=null;
  }

  Box<Hotel> addHotel(Hotel hotel){
    favouritesBox!.put(hotel.hotelId.toString(), hotel);
    return favouritesBox!;
  }

  Box<Hotel> removeHotel(Hotel hotel){
    favouritesBox!.delete(hotel.hotelId.toString());
    return favouritesBox!;
  }
}