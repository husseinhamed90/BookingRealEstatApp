class HotelDetails {
  String? city;
  String? country;
  String? mainPhotoUrl;
  String? url;
  String? reviewScore;
  int? hotelId;
  String? name;
  String? address;
  String? currencyCode;
  List<DescriptionTranslations>? descriptionTranslations;
  Location? location;

  HotelDetails(
      {this.city,
        this.country,
        this.mainPhotoUrl,
        this.url,
        this.reviewScore,
        this.hotelId,
        this.name,
        this.address,
        this.currencyCode,
        this.descriptionTranslations,
        this.location});

}

class DescriptionTranslations {
  String? languagecode;
  String? description;
  int? descriptiontypeId;

  DescriptionTranslations(
      {this.languagecode, this.description, this.descriptiontypeId});

  DescriptionTranslations.fromJson(Map<String, dynamic> json) {
    languagecode = json['languagecode'];
    description = json['description'];
    descriptiontypeId = json['descriptiontype_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['languagecode'] = languagecode;
    data['description'] = description;
    data['descriptiontype_id'] = descriptiontypeId;
    return data;
  }
}

class Location {
  double? latitude;
  double? longitude;

  Location({this.latitude, this.longitude});

  Location.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }
}