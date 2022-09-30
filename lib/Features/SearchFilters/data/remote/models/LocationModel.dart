
import 'package:realestate/Features/SearchFilters/domain/entities/Location.dart';


class LocationModel extends Location{

  LocationModel.defult();
  LocationModel.fromJson(Map<String, dynamic> json) {
    destType = json['dest_type'];
    longitude = json['longitude'];
    name = json['name'];
    destId = json['dest_id'];
    label = json['label'];
    latitude = json['latitude'];
    hotels = json['hotels'];
    cityName = json['city_name'];
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dest_type'] = destType;
    data['longitude'] = longitude;
    data['name'] = name;
    data['dest_id'] = destId;
    data['label'] = label;
    data['latitude'] = latitude;
    data['hotels'] = hotels;
    data['city_name'] = cityName;
    return data;
  }

}