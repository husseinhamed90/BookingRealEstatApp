import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:realestate/Core/Models/HotelPhotoModel.dart';
import 'package:realestate/Features/SearchForm/data/remote/models/DescriptionModel.dart';
import 'package:realestate/Features/SearchForm/data/remote/models/HotelBlocksModel.dart';
import 'package:realestate/Features/SearchForm/data/remote/models/HotelDetailsModel.dart';
import 'package:realestate/Features/SearchForm/data/remote/models/HotelModel.dart';
import '../../../../../Core/Constants.dart';
import '../../../../../Core/FireMessage.dart';

class RemoteSearchFormDataSource{

  Future<Either<FireMessage, List<HotelModel>>> fetchNearestHotels({required double latitude,required double longitude}) async {

    DateTime cheekIn = DateTime.now();
    DateTime checkOut = DateTime.now().add(const Duration(days: 3));
    String checkInDateTime = "${cheekIn.year.toString()}-${cheekIn.month.toString()}-${cheekIn.day.toString()}";
    String checkOutDateTime = "${checkOut.year.toString()}-${checkOut.month.toString()}-${checkOut.day.toString()}";
    var response = await Dio().get('$BASE_URL/search-by-coordinates',
        queryParameters: {
          "order_by": 'review_score',
          "adults_number": '1',
          "units": 'metric',
          "room_number": '1',
          "checkout_date": checkOutDateTime,
          "filter_by_currency": 'USD',
          "locale": 'en-gb',
          "checkin_date": checkInDateTime,
          "latitude": latitude,
          "longitude": longitude
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
      return Right(list.map((location) => HotelModel.fromJson(location)).toList());
    } else {
      return Left(FireMessage("Error"));
    }
  }

  Future<Either<FireMessage, List<HotelBlocksModel>>> fetchRoomsOfHotel({required int hotelId,required String userCurrency}) async {

    DateTime cheekIn = DateTime.now();
    DateTime checkOut = DateTime.now().add(const Duration(days: 3));
    String checkInDateTime = "${cheekIn.year.toString()}-${cheekIn.month.toString()}-${cheekIn.day.toString()}";
    String checkOutDateTime = "${checkOut.year.toString()}-${checkOut.month.toString()}-${checkOut.day.toString()}";
    print(checkInDateTime);
    print(checkOutDateTime);
    print(userCurrency);
    var response = await Dio().get('$BASE_URL/room-list',
        queryParameters: {
          "checkin_date": checkInDateTime,
          "units": 'metric',
          "checkout_date": checkOutDateTime,
          "currency": userCurrency,
          "locale": 'en-gb',
          "adults_number_by_rooms": '0',
          "hotel_id": hotelId
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
      return Right(list.map((block) => HotelBlocksModel.fromJson(block)).toList());
    } else {
      return Left(FireMessage("Error When Fetching Hotels Rooms"));
    }
  }

  Future<Either<FireMessage, List<HotelPhotoModel>>> fetchHotelPhotos({required int hotelId}) async {
    var response = await Dio().get('$BASE_URL/photos',
        queryParameters: {
          "locale": 'en-gb',
          "hotel_id": hotelId
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
      return Right(list.map((photo) => HotelPhotoModel.fromJson(photo)).toList());
    } else {
      return Left(FireMessage("Error When Fetching Photos Room"));
    }
  }


  Future<Either<FireMessage, HotelDetailsModel>> fetchHotelDetails({required int hotelId}) async {
    var response = await Dio().get('$BASE_URL/data',
        queryParameters: {
          "locale": 'en-gb',
          "hotel_id": hotelId
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
      return Right(HotelDetailsModel.fromJson(response.data));
    } else {
      return Left(FireMessage("Error When Fetching Hotels Details"));
    }
  }

  Future<Either<FireMessage, HotelDescriptionModel>> fetchHotelDescription({required int hotelId}) async {
    var response = await Dio().get('$BASE_URL/description',
        queryParameters: {
          "locale": 'en-gb',
          "hotel_id": hotelId
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
      return Right(HotelDescriptionModel.fromJson(response.data));
    } else {
      return Left(FireMessage("Error When Fetching Hotels Details"));
    }
  }

}