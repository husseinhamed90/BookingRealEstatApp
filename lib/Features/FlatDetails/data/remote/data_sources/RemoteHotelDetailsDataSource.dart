import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import '../../../../../Core/AppTheme/Strings.dart';
import '../../../../../Core/SharedModel/FireMessage.dart';
import '../models/DescriptionModel.dart';
import '../models/HotelBlocksModel.dart';
import '../models/HotelDetailsModel.dart';
import '../models/HotelPhotoModel.dart';

class RemoteHotelDetailsDataSource {
  Future<Either<FireMessage, List<HotelBlocksModel>>> fetchRoomsOfHotel({required int hotelId,required String userCurrency}) async {

    DateTime cheekIn = DateTime.now();
    DateTime checkOut = DateTime.now().add(const Duration(days: 3));
    String checkInDateTime = "${cheekIn.year.toString()}-${cheekIn.month.toString()}-${cheekIn.day.toString()}";
    String checkOutDateTime = "${checkOut.year.toString()}-${checkOut.month.toString()}-${checkOut.day.toString()}";
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