import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Features/FlatDetails/data/remote/models/HotelDetailsModel.dart';
import '../Features/SearchFilters/presentation/manager/DatePickerCubit.dart';
import '../Features/SearchFilters/presentation/manager/filters_bloc.dart';
import '../Features/SearchForm/domain/entities/Hotel.dart';
import 'AppTheme/AppColors.dart';
import 'AppTheme/Themes.dart';
import 'Utils.dart';

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

SizedBox buildDownloadIndicator(BuildContext context) {
  return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: const Center(child: CircularProgressIndicator(color: primaryColor,),)
  );
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

void choseStartDateFromDatePicker(BuildContext context) {
  buildShowDatePicker(context,"start").then((value) {
    if(value!=null){
      String start = getDateInFormat(value);
      context.read<DatePickerCubit>().setStartDate(value);
      context.read<FilteringBloc>().startDateController.text=start;
      if(context.read<DatePickerCubit>().endData==null){
        context.read<DatePickerCubit>().endData=context.read<DatePickerCubit>().startData!.add(const Duration(days: 1));
        context.read<FilteringBloc>().endDateController.text=getDateInFormat(context.read<DatePickerCubit>().startData!.add(const Duration(days: 1)));
      }
      else{
        if(context.read<DatePickerCubit>().startData!.isAfter(context.read<DatePickerCubit>().endData!)){
          context.read<FilteringBloc>().endDateController.text =getDateInFormat(context.read<DatePickerCubit>().startData!.add(Duration(days: 1)));
        }
        else{
          context.read<FilteringBloc>().endDateController.text =getDateInFormat(context.read<DatePickerCubit>().endData!);
        }
      }
    }
  });
}

void choseEndDateFromDatePicker(BuildContext context) {
  buildShowDatePicker(context,"end").then((value) {
    if(value!=null){
      String end = getDateInFormat(value);
      context.read<DatePickerCubit>().setEndDate(value);
      context.read<FilteringBloc>().endDateController.text=end;
    }
  });
}

Future<DateTime?> buildShowDatePicker(BuildContext context,String dateType) {
  return showDatePicker(
      builder: (context, child) => datePickerTheme(context, child),context: context,
      initialDate: dateType =="start"? context.read<DatePickerCubit>().startData==null?DateTime.now():context.read<DatePickerCubit>().startData!
          :context.read<DatePickerCubit>().startData!.add(const Duration(days: 1)),
      firstDate: dateType =="start"?DateTime.now(): context.read<DatePickerCubit>().startData!.add(const Duration(days: 1)),
      lastDate: DateTime(2100)
  );
}

void showSnackBar(String message, BuildContext context) {
  final snackBar = SnackBar(
    content: Text(message),
    action: SnackBarAction(
      label: 'Undo',
      onPressed: () {},
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
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