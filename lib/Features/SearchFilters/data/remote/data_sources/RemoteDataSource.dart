import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:realestate/Features/SearchForm/data/remote/models/HotelModel.dart';

import '../../../../../Core/Constants.dart';
import '../../../../../Core/FireMessage.dart';
import '../models/LocationModel.dart';

class RemoteDataSource{
  Future<Either<FireMessage, List<LocationModel>>> fetchLocations(String locationName) async {
      if(locationName==""){
        return Left(FireMessage("Required Field Not Found"));
      }
      else{
        var response = await Dio().get('$BASE_URL/locations',
            queryParameters: {
              "locale":"en-us",
              "name":locationName
            },
            options: Options(
              receiveDataWhenStatusError: false,
              validateStatus: (statusCode){
                return true;
              },
              headers: {
                "X-RapidAPI-Key":API_KEY,
              },
            ));
        if (response.statusCode == 200) {
          List list = response.data;
          return Right(list.map((location) => LocationModel.fromJson(location)).toList());
        } else {
          return Left(FireMessage("Error When Fetching Locations"));
        }
      }
    }


  Future<Either<FireMessage, List<HotelModel>>> filterResults(
      {required int numberOfRooms,
      required int numberOfAdults,
      required LocationModel locationModel}) async {
    DateTime cheekIn = DateTime.now();
    DateTime checkOut = DateTime.now().add(const Duration(days: 3));
    String checkInDateTime = "${cheekIn.year.toString()}-${cheekIn.month.toString()}-${cheekIn.day.toString()}";
    String checkOutDateTime = "${checkOut.year.toString()}-${checkOut.month.toString()}-${checkOut.day.toString()}";
    var response = await Dio().get('$BASE_URL/search',
        queryParameters: {
          "checkout_date": checkOutDateTime,
          'units': 'metric',
          "dest_id": locationModel.destId,
          "dest_type": locationModel.destType,
          "locale": 'en-gb',
          "adults_number": numberOfAdults,
          "order_by": 'popularity',
          "filter_by_currency": 'USD',
          "checkin_date": checkInDateTime,
          "room_number": numberOfRooms,
          "page_number": '0'
        },
        options: Options(
          receiveDataWhenStatusError: false,
          validateStatus: (statusCode){
            return true;
          },
          headers: {
            "X-RapidAPI-Key":API_KEY,
          },
        ));
    if (response.statusCode == 200) {
      List list = response.data["result"];
      return Right(list.map((hotel) => HotelModel.fromJson(hotel)).toList());
    } else {
      return Left(FireMessage("Required Field Not Found"));
    }
  }
}