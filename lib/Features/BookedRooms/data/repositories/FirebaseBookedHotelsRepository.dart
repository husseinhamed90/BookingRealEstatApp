import 'package:realestate/Features/BookedRooms/domain/repositories/BaseBookedHotelsRepository.dart';
import 'package:realestate/Features/FlatDetails/domain/entities/HotelRooms.dart';

import '../remote/data_sources/BookedHotelsFirebaseDataSource.dart';

class FirebaseBookedHotelsRepository extends BaseBookedHotelsRepository{
  BookedHotelsFirebaseDataSource bookedHotelsFirebaseDataSource;
  FirebaseBookedHotelsRepository(this.bookedHotelsFirebaseDataSource);
  @override
  Future bookHotel(Block block) async{
    bookedHotelsFirebaseDataSource.bookHotel(block);
  }

  @override
  Future getBookedHotels()async{
    return await bookedHotelsFirebaseDataSource.getBookedHotels();
  }

}