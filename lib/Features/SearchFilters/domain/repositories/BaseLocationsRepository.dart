import 'package:either_dart/either.dart';
import 'package:realestate/Features/SearchFilters/data/remote/models/LocationModel.dart';
import '../../../../Core/FireMessage.dart';

abstract class  BaseLocationsRepository{
  Future<Either<FireMessage, List<LocationModel>>>getLocations({required String locationString});
}