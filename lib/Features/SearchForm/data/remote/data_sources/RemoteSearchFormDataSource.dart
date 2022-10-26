import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:realestate/DependencyInjection.dart';
import 'package:realestate/Features/SearchFilters/presentation/manager/DatePickerCubit.dart';
import 'package:realestate/Features/SearchForm/data/remote/models/HotelModel.dart';
import '../../../../../Core/AppTheme/Strings.dart';
import '../../../../../Core/ReusableComponantes.dart';
import '../../../../../Core/SharedModel/FireMessage.dart';

class RemoteSearchFormDataSource{

  Future<Either<FireMessage, List<HotelModel>>> fetchNearestHotels({required double latitude,required double longitude}) async {
    String apiKey = await getApiKey();
    DateTime cheekIn = DateTime.now();
    DateTime checkOut = DateTime.now().add(const Duration(days: 1));


    String checkInDateTime = "${cheekIn.year.toString()}-${cheekIn.month.toString()}-${cheekIn.day.toString()}";
    String checkOutDateTime = "${checkOut.year.toString()}-${checkOut.month.toString()}-${checkOut.day.toString()}";
    var response = await Dio().get('$BASE_URL/search-by-coordinates',
        queryParameters: {
          "order_by": 'review_score',
          "adults_number": '2',
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
        "X-RapidAPI-Key":apiKey,
      },
    ));
    if (response.statusCode == 200) {
      List list = response.data["result"];
      return Right(list.map((location) => HotelModel.fromJson(location)).toList());
    } else {
      return Left(FireMessage("Error"));
    }
  }
}