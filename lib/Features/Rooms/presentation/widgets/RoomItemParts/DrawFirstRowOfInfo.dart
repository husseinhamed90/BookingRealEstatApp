import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../Core/AppTheme/Strings.dart';
import '../../../../../Core/Utils.dart';
import '../../../../FlatDetails/data/remote/models/HotelBlocksModel.dart';
import '../../../../FlatDetails/domain/entities/HotelRooms.dart';
import '../LabelWithNumber.dart';

class DrawFirstRowOfInfo extends StatelessWidget {
  const DrawFirstRowOfInfo({
    Key? key,
    required this.block,
  }) : super(key: key);

  final Block block;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        LabelWithNumber(text: perNight, number: "\$ ${block.productPriceBreakdown!.grossAmount!.value!.toStringAsFixed(2)}"),
        SizedBox(width: 30.w,),
        LabelWithNumber(text: "Discount", number: "\$ ${getDiscount(block)}"),
        SizedBox(width: 30.w,),
        LabelWithNumber(text: "Taxis", number: "\$ ${block.productPriceBreakdown!.includedTaxesAndChargesAmount!.value!.toStringAsFixed(2)}"),
        SizedBox(width: 30.w,),
        LabelWithNumber(text: adultsLabel, number: "${block.nrAdults}"),
        SizedBox(width: 10.w,),
      ],
    );
  }
}
