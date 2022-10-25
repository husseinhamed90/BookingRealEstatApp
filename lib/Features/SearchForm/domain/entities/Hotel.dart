import 'package:hive/hive.dart';
part 'Hotel.g.dart';
@HiveType(typeId: 1)
class Hotel {
  @HiveField(1)
  int? hotelId;
  @HiveField(2)
  CompositePriceBreakdown? compositePriceBreakdown;
  @HiveField(3)
  int? hotelIncludeBreakfast;
  @HiveField(4)
  String? addressTrans;
  @HiveField(5)
  String? currencyCode;
  @HiveField(6)
  String? accommodationTypeName;
  @HiveField(7)
  int? soldOut;
  @HiveField(8)
  String? countryTrans;
  @HiveField(9)
  double? minTotalPrice;
  @HiveField(10)
  String? district;
  @HiveField(11)
  String? hotelName;
  @HiveField(12)
  String? maxPhotoUrl;
  @HiveField(13)
  String ?weSiteUrl;

  Hotel(
      {this.hotelId,
        this.compositePriceBreakdown,
        this.hotelIncludeBreakfast,
        this.addressTrans,
        this.currencyCode,
        this.accommodationTypeName,
        this.soldOut,
        this.countryTrans,
        this.minTotalPrice,
        this.district,
        this.weSiteUrl,
        this.hotelName,
        this.maxPhotoUrl});
}
@HiveType(typeId: 2)
class CompositePriceBreakdown {
  @HiveField(1)
  List<ProductPriceBreakdowns>? productPriceBreakdowns;

  CompositePriceBreakdown({this.productPriceBreakdowns});

  CompositePriceBreakdown.fromJson(Map<String, dynamic> json) {
    if (json['product_price_breakdowns'] != null) {
      productPriceBreakdowns = <ProductPriceBreakdowns>[];
      json['product_price_breakdowns'].forEach((v) {
        productPriceBreakdowns!.add(ProductPriceBreakdowns.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (productPriceBreakdowns != null) {
      data['product_price_breakdowns'] =
          productPriceBreakdowns!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
@HiveType(typeId: 3)
class ProductPriceBreakdowns {
  @HiveField(1)
  GrossAmount? grossAmount;
  @HiveField(2)
  GrossAmount? includedTaxesAndChargesAmount;

  ProductPriceBreakdowns(
      {this.grossAmount, this.includedTaxesAndChargesAmount});

  ProductPriceBreakdowns.fromJson(Map<String, dynamic> json) {
    grossAmount = json['gross_amount'] != null
        ? GrossAmount.fromJson(json['gross_amount'])
        : null;
    includedTaxesAndChargesAmount = json['included_taxes_and_charges_amount'] !=
        null
        ? GrossAmount.fromJson(json['included_taxes_and_charges_amount'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (grossAmount != null) {
      data['gross_amount'] = grossAmount!.toJson();
    }
    if (includedTaxesAndChargesAmount != null) {
      data['included_taxes_and_charges_amount'] =
          includedTaxesAndChargesAmount!.toJson();
    }
    return data;
  }
}
@HiveType(typeId: 4)
class GrossAmount {
  @HiveField(1)
  double? value;
  @HiveField(2)
  String? currency;

  GrossAmount({this.value, this.currency});
  GrossAmount.fromJson(Map<String, dynamic> json) {
    value = json['value'].toDouble();
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['value'] = value;
    data['currency'] = currency;
    return data;
  }
}