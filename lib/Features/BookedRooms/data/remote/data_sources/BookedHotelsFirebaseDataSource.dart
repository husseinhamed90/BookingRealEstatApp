import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:realestate/Features/FlatDetails/domain/entities/HotelRooms.dart';

import '../../../../../DependencyInjection.dart';
import '../../../../Authentication/presentation/manager/auth_bloc.dart';

class BookedHotelsFirebaseDataSource{
  Future bookHotel(Block block)async{
    await FirebaseFirestore.instance.collection("Users").doc(dl.get<AuthBloc>().userEntity!.id).
    collection("BookedRooms").add(block.toJson());
  }
  Future<List<Block>> getBookedHotels()async{
    List<Block> blocks=[];
    await FirebaseFirestore.instance.collection("Users").doc(dl.get<AuthBloc>().userEntity!.id).
    collection("BookedRooms").get().then((value) {
      value.docs.forEach((element) {
        blocks.add(Block.fromJson(element.data()));
      });
    });
    return blocks;
  }
}