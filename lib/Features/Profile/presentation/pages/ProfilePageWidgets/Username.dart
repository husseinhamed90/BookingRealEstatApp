import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Username extends StatelessWidget {
  const Username({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 29.h,
        child: FittedBox(
          child: Text("Neville Griffin",
              style: TextStyle(
                  color: const Color(0xff312D2C),
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,fontFamily: "Raleway"),maxLines: 1,overflow: TextOverflow.clip),
        ),
      ),
    );
  }
}