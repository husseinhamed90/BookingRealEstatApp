import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'AppColors.dart';

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
            color: appBarIconAndTitleColor,size: 26.w
        ),
        titleSpacing: 20.w,
        backgroundColor: primaryColor,
        elevation: 0,
        titleTextStyle: TextStyle(
            color: appBarIconAndTitleColor,
            fontSize: 12.sp,
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
          size: 24.w,
        ),
        unselectedIconTheme: IconThemeData(
          size: 24.w,
        ),
      ));
}