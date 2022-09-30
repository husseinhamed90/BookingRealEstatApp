import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Core/AppTheme/AppColors.dart';
import '../../../../../Core/ReusableComponantes.dart';

class ProfilePageAppBar extends StatelessWidget {
  const ProfilePageAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(
            bottom: 42.h,
          ),
          color: primaryColor,
          height: 179.h,
          child: Row(
            children: [
              Expanded(
                child: Container(
                    alignment: Alignment.center,
                    child: buildCustomText(text: "PROFILE",fontWeight: FontWeight.w400,size: 22)
                ),
              ),
            ],
          ),
        ),
        Container(), // Required some widget in between to float AppBar
        Positioned(
          top: 110.0.h,
          bottom: 0,
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              height: 110.w,
              width: 110.w,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage('https://googleflutter.com/sample_image.jpg'),
                    fit: BoxFit.fill),
                //color: Colors.teal,
              ),
            ),
          ),
        )
      ],
    );
  }
}
