import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 10.h,left: 10.w,
        child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child:Card(
              elevation: 0.5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
              child:  Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  height: 40.h,width: 40.h,
                  child: const Icon(Icons.arrow_back_outlined)
              ),
            )
        )
    );
  }
}
