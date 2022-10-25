import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:realestate/Features/SearchForm/domain/entities/Hotel.dart';

@HiveType(typeId: 5)
class HotelModel extends Hotel with EquatableMixin{

  HotelModel.fromJson(Map<String, dynamic> json) {
    hotelId = json['hotel_id'];
    weSiteUrl = json['url'];
    compositePriceBreakdown = json['composite_price_breakdown'] != null
        ? CompositePriceBreakdown.fromJson(
        json['composite_price_breakdown'])
        : null;
    hotelIncludeBreakfast = json['hotel_include_breakfast'];
    addressTrans = json['address_trans'];
    currencyCode = json['currency_code'];
    accommodationTypeName = json['accommodation_type_name'];
    soldOut = json['soldout'];
    countryTrans = json['country_trans'];
    minTotalPrice = json['min_total_price'].toDouble();
    district = json['district'];
    hotelName = json['hotel_name'];
    maxPhotoUrl = json['max_photo_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['hotel_id'] = hotelId;
    if (compositePriceBreakdown != null) {
      data['composite_price_breakdown'] =
          compositePriceBreakdown!.toJson();
    }
    data['hotel_include_breakfast'] = hotelIncludeBreakfast;
    data['address_trans'] = addressTrans;
    data['currency_code'] = currencyCode;
    data['accommodation_type_name'] = accommodationTypeName;
    data['soldout'] = soldOut;
    data['country_trans'] = countryTrans;
    data['min_total_price'] = minTotalPrice;
    data['district'] = district;
    data['hotel_name'] = hotelName;
    data['max_photo_url'] = maxPhotoUrl;
    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [hotelId];
}