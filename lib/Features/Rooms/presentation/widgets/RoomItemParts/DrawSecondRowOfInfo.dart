import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../Core/Utils.dart';
import '../../../../FlatDetails/data/remote/models/HotelBlocksModel.dart';
import '../BookNowButton.dart';
import '../LabelWithNumber.dart';

class DrawSecondRowOfInfo extends StatelessWidget {
  const DrawSecondRowOfInfo({
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
        LabelWithNumber(text: "Total", number: "\$ ${getTotalPrice(context,hotelBlocksModel,blockIndex!).toStringAsFixed(2)}"),
        Container(height: 55.h,color: const Color(0xff9197A2),width: 1),
        SizedBox(width: 10.w,),
        LabelWithNumber(text: "Nights", number: "${calcDifferenceBetweenTwoDay(context)}"),
        BookNowButton(hotelBlocksModel: hotelBlocksModel, blockIndex: blockIndex),
        SizedBox(width: 15.w,),
      ],
    );
  }
}

