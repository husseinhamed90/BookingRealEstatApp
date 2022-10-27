import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:realestate/Core/AppTheme/AppColors.dart';
import 'package:realestate/Features/HomePageLayout/HomePageLayoutPage.dart';

class PaymentProcessEnd extends StatelessWidget {
  const PaymentProcessEnd({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
          width: double.infinity,
          height: 80.h,
          padding: const EdgeInsets.only(left: 20,right: 20,bottom: 30),
          child: ElevatedButton(
            child: const Text("Go To Home Page"),
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePageLayoutPage(),));
            },
          )
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CustomSizedBox(160),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 90.w)
                  ,child: SvgPicture.asset("Assets/Images/EndProcess.svg",color: primaryColor,height: 150.h,)),
              CustomSizedBox(30),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 60.w),
                child: Text("Your room has been successfully booked",textAlign: TextAlign.center,style: TextStyle(
                    fontSize: 24.sp,fontWeight: FontWeight.w700
                ),),
              ),
              CustomSizedBox(20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40.w),
                child: AutoSizeText("By choosing this room we wish you a pleasant accommodation for you and your family",maxLines: 2,textAlign: TextAlign.center,style: TextStyle(
                    fontSize: 20.sp,fontWeight: FontWeight.w400
                ),),
              )
            ],
          ),
        )
    );
  }
}

// ignore: must_be_immutable
class CustomSizedBox extends StatelessWidget {
  double height;
  CustomSizedBox(this.height, {super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.h,
    );
  }
}