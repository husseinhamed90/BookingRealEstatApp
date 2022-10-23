import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Core/AppTheme/Strings.dart';

class ChangePhoto extends StatelessWidget {
  const ChangePhoto({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 19.h,
        child: FittedBox(
          child: Text(changePhoto,
            style: TextStyle(
                color: const Color(0xff9197A2),
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,fontFamily: "Raleway"),),
        ),
      ),
    );
  }
}
