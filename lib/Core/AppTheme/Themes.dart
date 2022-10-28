import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'AppColors.dart';

Theme datePickerTheme(BuildContext context, Widget? child) {
  return Theme(
    data: Theme.of(context).copyWith(
      colorScheme: const ColorScheme.light(
        primary: primaryColor,
      ),
      dialogTheme: const DialogTheme(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)))),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: primaryColor, // button text color
        ),
      ),
    ),
    child: child!,
  );
}

ThemeData getAppTheme() {
  return ThemeData(
      fontFamily: 'Catamaran',
      scaffoldBackgroundColor: secondColor,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor: const MaterialStatePropertyAll<Color>(
                  primaryColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide.none)),
              textStyle: MaterialStatePropertyAll<TextStyle>(TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w800,
                  color: secondColor)))),
      appBarTheme: AppBarTheme(
        iconTheme:  IconThemeData(
            color: appBarIconAndTitleColor,size: 20.h
        ),
        titleSpacing: 15.w,
        backgroundColor: primaryColor,
        elevation: 0,
        titleTextStyle: TextStyle(
            color: appBarIconAndTitleColor,
            fontSize: 15.sp,
            fontWeight: FontWeight.w800),
      ),
      inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.red.withOpacity(0.2),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none),
          contentPadding: const EdgeInsets.only(top: 10),
          hintStyle: TextStyle(fontSize: 18.sp, color: secondColor)
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: secondColor,
        elevation: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedIconTheme: IconThemeData(
          size: 24.h,
        ),
        unselectedIconTheme: IconThemeData(
          size: 24.h,
        ),
      ));
}