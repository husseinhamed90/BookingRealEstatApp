
class Hotel {
  int? hotelId;
  CompositePriceBreakdown? compositePriceBreakdown;
  int? hotelIncludeBreakfast;
  String? addressTrans;
  String? currencyCode;
  String? accommodationTypeName;
  int? soldOut;
  String? countryTrans;
  double? minTotalPrice;
  String? district;
  String? hotelName;
  String? maxPhotoUrl;
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

class CompositePriceBreakdown {
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

class ProductPriceBreakdowns {
  GrossAmount? grossAmount;
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

class GrossAmount {
  double? value;
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