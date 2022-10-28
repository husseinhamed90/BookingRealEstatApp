import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/remote/models/DescriptionModel.dart';

class BuildHotelDescription extends StatelessWidget {
  final HotelDescriptionModel hotelDescriptionModel;
  const BuildHotelDescription({Key? key,required this.hotelDescriptionModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w),
      child: Text(hotelDescriptionModel.description.toString(),style: TextStyle(
        color: const Color(0xff9197A2),fontSize: 16.sp,fontWeight: FontWeight.w400,height: 27.h/16,
      ),),
    );
  }
}

