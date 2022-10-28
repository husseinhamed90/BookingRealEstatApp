import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Features/FlatDetails/data/remote/models/HotelDetailsModel.dart';
import '../Features/SearchForm/domain/entities/Hotel.dart';
import 'AppTheme/AppColors.dart';

Widget getTextFieldWithLabel({required bool isClickable,required bool readOnly,required String label,required String hintText,required TextAlign textAlign,TextEditingController ?controller, bool haveIcon=true}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      drawLabelText(label),
      SizedBox(height: 6.h,),
    ],
  );
}

Widget buildCustomText({required String text,required double size,required FontWeight fontWeight}){
  return Text(
    text,
    style: TextStyle(
        color: appBarIconAndTitleColor,
        fontSize: 15.sp,
        fontWeight: FontWeight.w800),
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
        border : OutlineInputBorder(borderRadius: BorderRadius.all( Radius.circular(8.0.r),),
          borderSide: BorderSide(
            width: 1.w,
          ),
        ),
        fillColor: secondColor,
        //filled: haveBorder,
        hintText: 'Enter something',
        hintStyle: const TextStyle(color: Colors.red)
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

Future<String> getApiKey() async {
  String apiKey ="";
  await FirebaseFirestore.instance.collection("ApiKey").doc("ApiKey").get().then((value) {
    apiKey = value.data()!['key'];
  });
  return apiKey;
}
Padding buildItemInfo({required Color color,required HotelDetailsModel hotelDetailsModel,required Hotel hotelModel}) {
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
                Text("2",style: TextStyle(
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