
import '../../../domain/entities/HotelDetails.dart';

class HotelDetailsModel extends HotelDetails{

  HotelDetailsModel.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    country = json['country'];
    mainPhotoUrl = json['main_photo_url'];
    url = json['url'];
    reviewScore = json['review_score'];
    hotelId = json['hotel_id'];
    name = json['name'];
    address = json['address'];
    currencyCode = json['currencycode'];
    if (json['description_translations'] != null) {
      descriptionTranslations = <DescriptionTranslations>[];
      json['description_translations'].forEach((v) {
        descriptionTranslations!.add(DescriptionTranslations.fromJson(v));
      });
    }
    location = json['location'] != null
        ? Location.fromJson(json['location'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['city'] = city;
    data['country'] = country;
    data['main_photo_url'] = mainPhotoUrl;
    data['url'] = url;
    data['review_score'] = reviewScore;
    data['hotel_id'] = hotelId;
    data['name'] = name;
    data['address'] = address;
    data['currencycode'] = currencyCode;
    if (descriptionTranslations != null) {
      data['description_translations'] =
          descriptionTranslations!.map((v) => v.toJson()).toList();
    }
    if (location != null) {
      data['location'] = location!.toJson();
    }
    return data;
  }

}