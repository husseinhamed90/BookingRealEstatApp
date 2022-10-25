// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Hotel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HotelAdapter extends TypeAdapter<Hotel> {
  @override
  final int typeId = 1;

  @override
  Hotel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Hotel(
      hotelId: fields[1] as int?,
      compositePriceBreakdown: fields[2] as CompositePriceBreakdown?,
      hotelIncludeBreakfast: fields[3] as int?,
      addressTrans: fields[4] as String?,
      currencyCode: fields[5] as String?,
      accommodationTypeName: fields[6] as String?,
      soldOut: fields[7] as int?,
      countryTrans: fields[8] as String?,
      minTotalPrice: fields[9] as double?,
      district: fields[10] as String?,
      weSiteUrl: fields[13] as String?,
      hotelName: fields[11] as String?,
      maxPhotoUrl: fields[12] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Hotel obj) {
    writer
      ..writeByte(13)
      ..writeByte(1)
      ..write(obj.hotelId)
      ..writeByte(2)
      ..write(obj.compositePriceBreakdown)
      ..writeByte(3)
      ..write(obj.hotelIncludeBreakfast)
      ..writeByte(4)
      ..write(obj.addressTrans)
      ..writeByte(5)
      ..write(obj.currencyCode)
      ..writeByte(6)
      ..write(obj.accommodationTypeName)
      ..writeByte(7)
      ..write(obj.soldOut)
      ..writeByte(8)
      ..write(obj.countryTrans)
      ..writeByte(9)
      ..write(obj.minTotalPrice)
      ..writeByte(10)
      ..write(obj.district)
      ..writeByte(11)
      ..write(obj.hotelName)
      ..writeByte(12)
      ..write(obj.maxPhotoUrl)
      ..writeByte(13)
      ..write(obj.weSiteUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HotelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CompositePriceBreakdownAdapter
    extends TypeAdapter<CompositePriceBreakdown> {
  @override
  final int typeId = 2;

  @override
  CompositePriceBreakdown read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CompositePriceBreakdown(
      productPriceBreakdowns:
          (fields[1] as List?)?.cast<ProductPriceBreakdowns>(),
    );
  }

  @override
  void write(BinaryWriter writer, CompositePriceBreakdown obj) {
    writer
      ..writeByte(1)
      ..writeByte(1)
      ..write(obj.productPriceBreakdowns);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CompositePriceBreakdownAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ProductPriceBreakdownsAdapter
    extends TypeAdapter<ProductPriceBreakdowns> {
  @override
  final int typeId = 3;

  @override
  ProductPriceBreakdowns read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductPriceBreakdowns(
      grossAmount: fields[1] as GrossAmount?,
      includedTaxesAndChargesAmount: fields[2] as GrossAmount?,
    );
  }

  @override
  void write(BinaryWriter writer, ProductPriceBreakdowns obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.grossAmount)
      ..writeByte(2)
      ..write(obj.includedTaxesAndChargesAmount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductPriceBreakdownsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class GrossAmountAdapter extends TypeAdapter<GrossAmount> {
  @override
  final int typeId = 4;

  @override
  GrossAmount read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GrossAmount(
      value: fields[1] as double?,
      currency: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, GrossAmount obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.value)
      ..writeByte(2)
      ..write(obj.currency);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GrossAmountAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
