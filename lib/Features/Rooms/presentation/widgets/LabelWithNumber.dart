import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LabelWithNumber extends StatelessWidget {
  const LabelWithNumber({
    Key? key,
    required this.text,
    required this.number,
  }) : super(key: key);
  final String text;
  final String number;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(number,style: TextStyle(
              color: const Color(0xff312D2C),fontSize: 24.sp,fontWeight: FontWeight.w700
          ),maxLines: 1,overflow: TextOverflow.ellipsis),
          AutoSizeText(text,style: TextStyle(
              color: const Color(0xff9197A2),fontSize: 14.sp,fontWeight: FontWeight.w400, height: 1.2.h
          ),maxLines: 1,overflow: TextOverflow.ellipsis),
        ],
      ),
    );
  }
}