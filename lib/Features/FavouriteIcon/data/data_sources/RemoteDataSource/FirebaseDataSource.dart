import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:realestate/DependencyInjection.dart';
import 'package:realestate/Features/Authentication/presentation/manager/auth_bloc.dart';
import 'package:realestate/Features/SearchForm/domain/entities/Hotel.dart';

class FirebaseDataSource{

  Future addHotel(Hotel hotel){
    Map<String, dynamic> data = convertToMap(hotel);
    return FirebaseFirestore.instance.collection("Users").doc(dl.get<AuthBloc>().userEntity!.id).collection("Favourites").add(data);
  }

  Map<String, dynamic> convertToMap(Hotel hotel) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['hotel_id'] = hotel.hotelId;
    if (hotel.compositePriceBreakdown != null) {
      data['composite_price_breakdown'] = hotel.compositePriceBreakdown!.toJson();
    }
    data['hotel_include_breakfast'] = hotel.hotelIncludeBreakfast;
    data['address_trans'] = hotel.addressTrans;
    data['currency_code'] = hotel.currencyCode;
    data['accommodation_type_name'] = hotel.accommodationTypeName;
    data['soldout'] = hotel.soldOut;
    data['country_trans'] = hotel.countryTrans;
    data['min_total_price'] = hotel.minTotalPrice;
    data['district'] = hotel.district;
    data['hotel_name'] = hotel.hotelName;
    data['max_photo_url'] = hotel.maxPhotoUrl;
    return data;
  }

  Future removeHotel(int hotelID)async{
    return await FirebaseFirestore.instance.collection("Users").doc(dl.get<AuthBloc>().userEntity!.id).collection('Favourites').where('hotel_id',isEqualTo: hotelID).get().then((value){
      for (var element in value.docs) {
        element.reference.delete();
      }
    });

  }
}