// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:realestate/Features/SearchFilters/presentation/pages/SearchFilters/SearchFiltersPage.dart';
//
// import '../../../../../../DependencyInjection.dart';
// import '../../../../../SearchFilters/presentation/manager/filters_bloc.dart';
//
// class CustomTextField extends StatelessWidget {
//   TextAlign textAlign;
//   String iconName,hindText;
//   bool readOnly,haveBorder;
//   TextEditingController ?controller;
//   CustomTextField({
//     Key? key,this.iconName,required this.hindText,required this.readOnly,required this.haveBorder,required this.textAlign, this.controller
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 60.h,
//       child: TextFormField(
//         controller: controller,
//         textAlign: textAlign,
//         readOnly: readOnly,
//         onFieldSubmitted: (value) {
//           dl<FilteringBloc>().add(FetchLocationsEvent(locationString: value));
//         },
//         onTap: () {
//           if(readOnly){
//             Navigator.push(context, MaterialPageRoute(builder: (context) => SearchFiltersPage(),));
//           }
//         },
//         style: TextStyle(
//           fontSize: 18.sp, color:haveBorder?const Color(0xff9197A2):Colors.white
//         ),
//         decoration: InputDecoration(
//
//               fillColor: !haveBorder?Colors.white.withOpacity(0.2):Colors.white,
//               border: haveBorder?OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(15),
//                   borderSide: BorderSide(
//                       color: const Color(0xffF2F2F2),width: 2.w
//                   )):null,
//               focusedBorder: haveBorder?OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(15),
//                   borderSide: BorderSide(
//                       color: const Color(0xffF2F2F2),width: 2.w
//                   )):null,
//               enabledBorder: haveBorder?OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(15),
//                   borderSide: BorderSide(
//                       color: const Color(0xffF2F2F2),width: 2.w
//                   )
//               ):null,
//               prefixIconConstraints: const BoxConstraints(
//                 minWidth: 1,
//                 minHeight: 1,
//               ),
//               prefixIcon : InkWell(
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(vertical: 20,horizontal: !haveBorder?20:0),
//                     child: SvgPicture.asset(iconName,height: 20.w,width: 20.w),
//                   ), onTap: () {}
//               ),
//               contentPadding: EdgeInsets.only(left: 15.w),
//               hintText: hindText,
//               hintStyle: TextStyle(
//                   fontSize: 18.sp, color:haveBorder?const Color(0xff9197A2):Colors.white
//               ),
//         ),
//       ),
//     );
//   }
// }

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

class CustomTextField extends StatelessWidget {
  TextAlign textAlign;
  String? iconName;
  String hindText;
  bool isClickable;
  bool isSecure;
  bool haveIcon=true;
  bool readOnly,haveBorder;
  String start="",end="";

  TextEditingController ?controller;
  CustomTextField({
    Key? key,required this.isSecure,required this.isClickable,this.iconName,required this.hindText,required this.readOnly,required this.haveBorder,required this.textAlign,required this.controller,this.haveIcon=true
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DatePickerCubit,DatePickerState>(
      listener: (context, state) {

      },
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
                choseStartDate(context);
              }
              else if(hindText==chooseEndDate){
                choseEndDate(context);
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


  void choseStartDate(BuildContext context) {
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
  
  void choseEndDate(BuildContext context) {
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

  String getDateInFormat(DateTime  dateTime){
    return "${dateTime.year}-${dateTime.month}-${dateTime.day}";
  }

}