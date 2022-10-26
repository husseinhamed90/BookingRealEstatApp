
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../Core/AppTheme/Strings.dart';
import '../../../../../Core/Utils.dart';
import '../../../../FlatDetails/data/remote/models/HotelBlocksModel.dart';
import 'DrawFirstRowOfInfo.dart';
import 'DrawSecondRowOfInfo.dart';
import '../PaymentTap.dart';
import '../LabelWithNumber.dart';

class BuildRoomInfo extends StatelessWidget {
  const BuildRoomInfo({
    Key? key,
    required this.hotelBlocksModel,
    required this.blockIndex,
  }) : super(key: key);

  final HotelBlocksModel hotelBlocksModel;
  final int? blockIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.w,right: 10.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 15.h,),
          Text(hotelBlocksModel.block![blockIndex!].roomName!,style: TextStyle(
              color: const Color(0xff312D2C),fontSize: 20.sp,fontWeight: FontWeight.w800,height: 35.h/22
          ),),
          Text(getDescription(hotelBlocksModel,blockIndex!),style: TextStyle(
              color: const Color(0xff9197A2),fontSize: 14.sp,fontWeight: FontWeight.w800,height: 35.h/22
          ),),
          DrawFirstRowOfInfo(hotelBlocksModel: hotelBlocksModel, blockIndex: blockIndex),
          SizedBox(height: 16.h,),
          DrawSecondRowOfInfo(hotelBlocksModel: hotelBlocksModel, blockIndex: blockIndex),
          SizedBox(height: 15.h,),
        ],
      ),
    );
  }
}





