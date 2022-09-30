
import 'package:either_dart/either.dart';
import 'package:realestate/Features/SearchForm/data/remote/models/HotelModel.dart';
import '../../../../Core/SharedModel/FireMessage.dart';
import '../../../FlatDetails/data/remote/models/HotelPhotoModel.dart';
abstract class BaseSearchFormRepository{
  Future<Either<FireMessage, List<HotelModel>>>getNearestHotelsFromMyLocation({required double latitude,required double longitude});

}