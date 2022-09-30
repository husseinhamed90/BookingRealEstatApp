import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:realestate/Features/SearchForm/data/remote/models/HotelModel.dart';

import '../Features/Authentication/presentation/pages/SignIn/SignInWidgets/CustomTextField.dart';
import '../Features/FlatDetails/data/remote/models/HotelDetailsModel.dart';
import 'AppTheme/AppColors.dart';

Widget getTextFieldWithLabel({required bool isClickable,required bool readOnly,required String label,required String hintText,required TextAlign textAlign,TextEditingController ?controller, bool haveIcon=true}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      drawLabelText(label),
      SizedBox(height: 6.h,),
      CustomTextField(isClickable: isClickable,iconName: "Assets/Icons/searchbar.svg",hindText: hintText,readOnly: readOnly,haveBorder: true,textAlign: textAlign,controller:controller,haveIcon: haveIcon),
    ],
  );
}

Widget buildCustomText({required String text,required double size,required FontWeight fontWeight}){
  return Text(
    text,
    style: TextStyle(
        fontSize: size.sp,
        fontWeight: fontWeight,fontFamily: "Raleway",
        color: Colors.white),
  );
}

Center buildTextFieldLabelText({required String text,required int fontSize,required Color color,required FontWeight fontWeight}) {
  return Center(
    child: Text(text,
        style: TextStyle(
            color: color,
            fontSize: fontSize.sp,fontWeight: fontWeight
        )),
  );
}
TextField buildTextField({bool haveBorder=false,double ?height, int maxLines=1,}) {
  return TextField(
      maxLines: maxLines,
      textAlign: TextAlign.left,
      style: const TextStyle(
      ),
      decoration:InputDecoration(
        contentPadding:EdgeInsets.only(left: 20.w,top: 26.h),
        border :  OutlineInputBorder(borderRadius: BorderRadius.all( Radius.circular(8.0.r),),
          borderSide: BorderSide(
            width: 1.w,
          ),
        ),
        fillColor: secondColor,
        //filled: haveBorder,
        hintText: 'Enter something',
        hintStyle: TextStyle(color: Colors.red)
      )
  );
}
SizedBox buildDownloadIndicator(BuildContext context) {
  return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: const Center(child: CircularProgressIndicator(color: primaryColor,),)
  );
}

Padding buildItemInfo({required Color color,required HotelDetailsModel hotelDetailsModel,required HotelModel hotelModel}) {
  return Padding(
    padding: EdgeInsets.only(left: 20.w),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(hotelDetailsModel.name!,style: TextStyle(
            color: const Color(0xff312D2C),fontSize: 22.sp,fontWeight: FontWeight.w800,height: 35.h/22
        ),),
        Text( "${hotelDetailsModel.city} , ${hotelDetailsModel.country}",style: TextStyle(
          color: const Color(0xff9197A2),fontSize: 16.sp,fontWeight: FontWeight.w400,height: 27.h/16,
        ),),
        SizedBox(height: 10.h,),
        Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${hotelModel.currencyCode} ${hotelModel.minTotalPrice!.toStringAsFixed(2)}",style: TextStyle(
                    color: color,fontSize: 22.sp,fontWeight: FontWeight.w700
                ),),
                Text("per night",style: TextStyle(
                    color: const Color(0xff9197A2),fontSize: 13.sp,fontWeight: FontWeight.w400, height: 1.2.h
                ),),
              ],
            ),
            SizedBox(width: 79.w,),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("10",style: TextStyle(
                  color: const Color(0xff312D2C),fontSize: 22.sp,fontWeight: FontWeight.w700,
                ),),
                Text("guests max",style: TextStyle(
                    color: const Color(0xff9197A2),fontSize: 13.sp,fontWeight: FontWeight.w400, height: 1.2.h
                ),),
              ],
            )
          ],
        ),
      ],
    ),
  );
}


Text drawLabelText(String label) {
  return Text(label,style: TextStyle(
        color: const Color(0xff312D2C),fontSize: 13.sp,fontWeight: FontWeight.w600
    ),);
}

Widget getColumn({required String firstString,required String secondString}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(firstString,style: TextStyle(
          fontSize: 30.sp,color: Colors.white,fontWeight: FontWeight.w600
      ),),
      SizedBox(height: 7.h,),
      Text(secondString,style: TextStyle(
          fontSize: 16.sp,color: Colors.white.withOpacity(0.8),fontWeight: FontWeight.w400
      ),),
    ],
  );
}