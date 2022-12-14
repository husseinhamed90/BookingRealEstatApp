import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:realestate/Core/AppTheme/AppColors.dart';
import 'package:realestate/Core/AppTheme/Strings.dart';
import 'package:realestate/Features/SearchFilters/presentation/manager/DatePickerCubit.dart';
import 'package:realestate/Features/SearchFilters/presentation/manager/filters_bloc.dart';
import 'package:realestate/Features/SearchFilters/presentation/pages/SearchFilters/SearchFiltersPage.dart';

import '../../../../../../Core/AppTheme/Themes.dart';
import '../../../../../../Core/ReusableComponantes.dart';
import '../../../../../../Core/Utils.dart';

class CustomTextField extends StatelessWidget {
  final TextAlign textAlign;
  final String? iconName;
  final String hindText;
  final bool isClickable;
  final bool isSecure;
  final bool haveIcon;
  final bool readOnly,haveBorder;
  final String start="",end="";

  final TextEditingController ?controller;
  const CustomTextField({
    Key? key,required this.isSecure,required this.isClickable,this.iconName,required this.hindText,required this.readOnly,required this.haveBorder,required this.textAlign,required this.controller,this.haveIcon=true
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DatePickerCubit,DatePickerState>(
      listener: (context, state) {},
      builder: (context, state) {
        return TextFormField(
          obscureText: isSecure,
          controller: controller,
          textAlign: textAlign,
          readOnly: readOnly,
          onFieldSubmitted: (value) {},
          onTap: () {
            if(isClickable){
              if(hindText==chooseStartDate){
                choseStartDateFromDatePicker(context);
              }
              else if(hindText==chooseEndDate){
                choseEndDateFromDatePicker(context);
              }
              else{
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchFiltersPage(),));
              }
            }
          },
          style: TextStyle(
            fontSize: 18.sp, color:haveBorder?const Color(0xff9197A2):Colors.white,
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(15.w,15.h,15.w, 15.h),
            fillColor: !haveBorder?Colors.white.withOpacity(0.2):Colors.white,
            border: haveBorder?OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                    color: const Color(0xffF2F2F2),width: 2.w
                )):null,
            focusedBorder: haveBorder?OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                    color: const Color(0xffF2F2F2),width: 2.w
                )):null,
            enabledBorder: haveBorder?OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                    color: const Color(0xffF2F2F2),width: 2.w
                )
            ):null,
            prefixIconConstraints: const BoxConstraints(
              minWidth: 1,
              minHeight: 1,
            ),
            prefixIcon :haveIcon? Padding(
              padding: EdgeInsets.only(left: 20.w,right: 20.w,bottom: 20.h,top: 20.h),
              child: InkWell(
                  child: SvgPicture.asset(iconName!,color: primaryColor,width: 20.h,height: 20.h), onTap: () {}
              ),
            ):null,
            hintText: hindText,
            hintStyle: TextStyle(
                fontSize: 18.sp, color:haveBorder?const Color(0xff9197A2):Colors.white
            ),
          ),
        );
      },
    );
  }
}