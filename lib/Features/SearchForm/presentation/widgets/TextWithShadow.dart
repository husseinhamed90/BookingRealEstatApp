
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextWithShadow extends StatelessWidget {
  const TextWithShadow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Text("NEAREST",style: TextStyle(
            letterSpacing: 5,
            fontSize: 50.sp,fontWeight: FontWeight.w800,color: const Color(0xff9197A2).withOpacity(0.1)
        ),),
        Positioned(
          bottom: 16.h,
          child: Text("NEAREST HOTEL",style: TextStyle(
              letterSpacing: 1.4,
              fontSize: 14.sp,fontWeight: FontWeight.w800,color: const Color(0xff312D2C)
          ),),
        )
      ],
    );
  }
}