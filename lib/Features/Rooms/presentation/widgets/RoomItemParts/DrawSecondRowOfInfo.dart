import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:realestate/Features/FlatDetails/domain/entities/HotelRooms.dart';
import '../../../../../Core/Utils.dart';
import '../../../../FlatDetails/data/remote/models/HotelBlocksModel.dart';
import '../BookNowButton.dart';
import '../LabelWithNumber.dart';

class DrawSecondRowOfInfo extends StatelessWidget {
   final bool isBookedRooms;
   const DrawSecondRowOfInfo({
     required this.isBookedRooms,
    Key? key,
    required this.block,
  }) : super(key: key);

  final Block block;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        LabelWithNumber(text: "Total", number: "\$ ${getTotalPrice(context,block).toStringAsFixed(2)}"),
        Container(height: 55.h,color: const Color(0xff9197A2),width: 1),
        SizedBox(width: 10.w,),
        LabelWithNumber(text: "Nights", number: "${calcDifferenceBetweenTwoDay(context)}"),
        !isBookedRooms ? BookNowButton(block: block):Container(),
      ],
    );
  }
}

