import 'Room.dart';

class HotelBlocks {
  List<Block>? block;
  int? hotelId;
  HotelBlocks({this.block, this.hotelId,this.rooms});
  Map<String,Room>? rooms;
}

class Block {
  ProductPriceBreakdown? productPriceBreakdown;
  int? numberOfBathrooms;
  String? nameWithoutPolicy;
  double? roomSurfaceInFeet2;
  String? blockId;
  int? roomId;
  int? dinnerIncluded;
  int? breakfastIncluded;
  int? lunchIncluded;
  int? isDormitory;
  int? maxOccupancy;
  String? name;
  String? roomName;
  String? mealplan;
  int? maxChildrenFree;
  int? nrAdults;
  int? nrChildren;
  int? maxChildrenFreeAge;

  Block(
      {this.productPriceBreakdown,
        this.numberOfBathrooms,
        this.nameWithoutPolicy,
        this.roomSurfaceInFeet2,
        this.blockId,
        this.roomId,
        this.dinnerIncluded,
        this.breakfastIncluded,
        this.lunchIncluded,
        this.isDormitory,
        this.maxOccupancy,
        this.name,
        this.roomName,
        this.mealplan,
        this.maxChildrenFree,
        this.nrAdults,
        this.nrChildren,
        this.maxChildrenFreeAge});

  Block.fromJson(Map<String, dynamic> json) {
    productPriceBreakdown = json['product_price_breakdown'] != null
        ? ProductPriceBreakdown.fromJson(json['product_price_breakdown'])
        : null;
    numberOfBathrooms = json['number_of_bathrooms'];
    nameWithoutPolicy = json['name_without_policy'];
    roomSurfaceInFeet2 = json['room_surface_in_feet2'];
    blockId = json['block_id'];
    roomId = json['room_id'];
    dinnerIncluded = json['dinner_included'];
    breakfastIncluded = json['breakfast_included'];
    lunchIncluded = json['lunch_included'];
    isDormitory = json['is_dormitory'];
    maxOccupancy = json['max_occupancy'];
    name = json['name'];
    roomName = json['room_name'];
    mealplan = json['mealplan'];
    maxChildrenFree = json['max_children_free'];
    nrAdults = json['nr_adults'];
    nrChildren = json['nr_children'];
    maxChildrenFreeAge = json['max_children_free_age'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (productPriceBreakdown != null) {
      data['product_price_breakdown'] = productPriceBreakdown!.toJson();
    }
    data['number_of_bathrooms'] = numberOfBathrooms;
    data['name_without_policy'] = nameWithoutPolicy;
    data['room_surface_in_feet2'] = roomSurfaceInFeet2;
    data['block_id'] = blockId;
    data['room_id'] = roomId;
    data['dinner_included'] = dinnerIncluded;
    data['breakfast_included'] = breakfastIncluded;
    data['lunch_included'] = lunchIncluded;
    data['is_dormitory'] = isDormitory;
    data['max_occupancy'] = maxOccupancy;
    data['name'] = name;
    data['room_name'] = roomName;
    data['mealplan'] = mealplan;
    data['max_children_free'] = maxChildrenFree;
    data['nr_adults'] = nrAdults;
    data['nr_children'] = nrChildren;
    data['max_children_free_age'] = maxChildrenFreeAge;
    return data;
  }
}

class ProductPriceBreakdown {
  IncludedTaxesAndChargesAmount? includedTaxesAndChargesAmount;
  IncludedTaxesAndChargesAmount? grossAmount;
  IncludedTaxesAndChargesAmount? discountedAmount;

  ProductPriceBreakdown(
      {this.includedTaxesAndChargesAmount,
        this.grossAmount,
        this.discountedAmount});

  ProductPriceBreakdown.fromJson(Map<String, dynamic> json) {
    includedTaxesAndChargesAmount =
    json['included_taxes_and_charges_amount'] != null
        ? IncludedTaxesAndChargesAmount.fromJson(
        json['included_taxes_and_charges_amount'])
        : null;
    grossAmount = json['gross_amount'] != null
        ? IncludedTaxesAndChargesAmount.fromJson(json['gross_amount'])
        : null;
    discountedAmount = json['discounted_amount'] != null
        ? IncludedTaxesAndChargesAmount.fromJson(json['discounted_amount'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (includedTaxesAndChargesAmount != null) {
      data['included_taxes_and_charges_amount'] =
          includedTaxesAndChargesAmount!.toJson();
    }
    if (grossAmount != null) {
      data['gross_amount'] = grossAmount!.toJson();
    }
    if (discountedAmount != null) {
      data['discounted_amount'] = discountedAmount!.toJson();
    }
    return data;
  }
}

class IncludedTaxesAndChargesAmount {
  String? currency;
  double? value;

  IncludedTaxesAndChargesAmount({this.currency, this.value});

  IncludedTaxesAndChargesAmount.fromJson(Map<String, dynamic> json) {
    currency = json['currency'];
    value = json['value'].toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['currency'] = currency;
    data['value'] = value;
    return data;
  }
}