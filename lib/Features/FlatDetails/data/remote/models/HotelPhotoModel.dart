import 'package:realestate/Features/FlatDetails/domain/entities/HotelPhoto.dart';

class HotelPhotoModel extends HotelPhoto{

  HotelPhotoModel.fromJson(Map<String, dynamic> json) {
    if (json['tags'] != null) {
      tags = <Tags>[];
      json['tags'].forEach((v) {
        tags!.add(Tags.fromJson(v));
      });
    }
    urlSquare60 = json['url_square60'];
    urlMax = json['url_max'];
    url1440 = json['url_1440'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (tags != null) {
      data['tags'] = tags!.map((v) => v.toJson()).toList();
    }
    data['url_square60'] = urlSquare60;
    data['url_max'] = urlMax;
    data['url_1440'] = url1440;
    return data;
  }
}