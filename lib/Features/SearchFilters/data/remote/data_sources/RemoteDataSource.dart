import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:realestate/Features/SearchForm/data/remote/models/HotelModel.dart';
import '../../../../../Core/AppTheme/Strings.dart';
import '../../../../../Core/SharedModel/FireMessage.dart';
import '../../../../../Core/Utils.dart';
import '../../../../../DependencyInjection.dart';
import '../../../presentation/manager/filters_bloc.dart';
import '../../../presentation/manager/sliders_cubit.dart';
import '../models/LocationModel.dart';

class RemoteDataSource{

  Future<Either<FireMessage, List<LocationModel>>> fetchLocations(String locationName) async {
    String apiKey = await getApiKey();
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
                "X-RapidAPI-Key":apiKey,
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
        required int pageNumber,
        required String cheekIn,required String checkOut,
        required int numberOfAdults,
        required double minPrice,
        required double maxPrice,
        required LocationModel locationModel}) async {

        String apiKey = await getApiKey();

        var response = await Dio().get('$BASE_URL/search',
        queryParameters: {
          "checkout_date": checkOut,
          'units': 'metric',
          "dest_id": locationModel.destId,
          "dest_type": locationModel.destType,
          "locale": 'en-gb',
          "adults_number": numberOfAdults,
          "order_by": 'popularity',
          "filter_by_currency": 'USD',
          "checkin_date": cheekIn,
          "room_number": numberOfRooms,
          "page_number": pageNumber
        },
        options: Options(
          receiveDataWhenStatusError: false,
          validateStatus: (statusCode){
            return true;
          },
          headers: {
            "X-RapidAPI-Key":apiKey,
          },
        ));
    if (response.statusCode == 200) {
      List list = response.data["result"];
      return Right(list.map((hotel) => HotelModel.fromJson(hotel)).where((element) => maxPrice==100000? element.minTotalPrice!<=maxPrice&&element.minTotalPrice!>=minPrice:element.minTotalPrice!>=minPrice||element.minTotalPrice!>=10000).toList());
    } else {
      return Left(FireMessage("Error When Trying To Filtering Data"));
    }
  }
}