
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:realestate/Features/FlatDetails/domain/entities/HotelRooms.dart';
import 'DrawFirstRowOfInfo.dart';
import 'DrawSecondRowOfInfo.dart';
class BuildRoomInfo extends StatelessWidget {
  const BuildRoomInfo({
    Key? key,
    required this.block,
  }) : super(key: key);

  final Block block;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.w,right: 10.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 15.h,),
          Text(block.roomName!,style: TextStyle(
              color: const Color(0xff312D2C),fontSize: 20.sp,fontWeight: FontWeight.w800,height: 35.h/22
          ),),
          Text(block.blockRoom!.description!,style: TextStyle(
              color: const Color(0xff9197A2),fontSize: 14.sp,fontWeight: FontWeight.w800,height: 35.h/22
          ),),
          DrawFirstRowOfInfo(block:block ),
          SizedBox(height: 16.h,),
          DrawSecondRowOfInfo(block: block),
          SizedBox(height: 15.h,),
        ],
      ),
    );
  }
}





