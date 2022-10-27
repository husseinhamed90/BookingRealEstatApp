
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class NoConnectionImage extends StatelessWidget {
  final Function onTryAgain;
  const NoConnectionImage({
    Key? key,required this.onTryAgain
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 200.h,
          width: 200.h,
          child: SvgPicture.asset("Assets/Images/wifi.svg"),
        ),
        ElevatedButton(onPressed: () async{
          await onTryAgain();
        }, child: const Text("Try Again"))
      ],
    ));
  }
}