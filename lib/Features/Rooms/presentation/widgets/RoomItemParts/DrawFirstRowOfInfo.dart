import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../Core/AppTheme/Strings.dart';
import '../../../../../Core/Utils.dart';
import '../../../../FlatDetails/data/remote/models/HotelBlocksModel.dart';
import '../LabelWithNumber.dart';

class DrawFirstRowOfInfo extends StatelessWidget {
  const DrawFirstRowOfInfo({
    Key? key,
    required this.hotelBlocksModel,
    required this.blockIndex,
  }) : super(key: key);

  final HotelBlocksModel hotelBlocksModel;
  final int? blockIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        LabelWithNumber(text: perNight, number: "\$ ${hotelBlocksModel.block![blockIndex!].productPriceBreakdown!.grossAmount!.value!.toStringAsFixed(2)}"),
        SizedBox(width: 30.w,),
        LabelWithNumber(text: "Discount", number: "\$ ${getDiscount(hotelBlocksModel,blockIndex!)}"),
        SizedBox(width: 30.w,),
        LabelWithNumber(text: "Taxis", number: "\$ ${hotelBlocksModel.block![blockIndex!].productPriceBreakdown!.includedTaxesAndChargesAmount!.value!.toStringAsFixed(2)}"),
        SizedBox(width: 30.w,),
        LabelWithNumber(text: adultsLabel, number: "${hotelBlocksModel.block![blockIndex!].nrAdults}"),
        SizedBox(width: 10.w,),
      ],
    );
  }
}
