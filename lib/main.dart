import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:realestate/Core/BottomNavBarBloc/bottom_nav_bar_bloc.dart';
import 'package:realestate/Features/Authentication/presentation/manager/auth_bloc.dart';
import 'package:realestate/Features/Authentication/presentation/pages/SignIn/SignInScreen.dart';
import 'package:realestate/Features/FlatDetails/presentation/manager/favourite_cubit.dart';
import 'package:realestate/Features/HomePageLayout/HomePageLayoutPage.dart';
import 'package:realestate/Features/SearchFilters/presentation/manager/DatePickerCubit.dart';
import 'package:realestate/Features/SearchFilters/presentation/manager/filters_bloc.dart';
import 'package:realestate/Features/SearchFilters/presentation/manager/sliders_cubit.dart';
import 'package:realestate/Features/SearchForm/presentation/manager/HotelsByCoordinatedBloc/hotels_by_coordinates_bloc.dart';
import 'Core/AppTheme/AppColors.dart';
import 'Core/AppTheme/Themes.dart';
import 'DependencyInjection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Features/FlatDetails/presentation/manager/SearchResultsBloc/HotelDetailsBloc.dart';
import 'SplachScreenPage.dart';
import 'firebase_options.dart';
import 'package:device_preview/device_preview.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: primaryColor // status bar color
  ));
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  init();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 811),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<BottomNavBarBloc>(
              create: (BuildContext context) => dl<BottomNavBarBloc>(),
            ),
            BlocProvider<FilteringBloc>(
              create: (BuildContext context) => dl<FilteringBloc>(),
            ),
            BlocProvider<HotelsByCoordinatesBloc>(
              create: (BuildContext context) => dl<HotelsByCoordinatesBloc>()..add(FetchHotelsByCoordinatesEvent()),
            ),
            BlocProvider<HotelDetailsBloc>(
              create: (BuildContext context) => dl<HotelDetailsBloc>(),
            ),
            BlocProvider<AuthBloc>(
              create: (BuildContext context) => dl<AuthBloc>()..add(CheckIfUserLoggedIn())
            ),
            BlocProvider<FavouriteCubit>(
                create: (BuildContext context) => dl<FavouriteCubit>()
            ),
            BlocProvider<DatePickerCubit>(
                create: (BuildContext context) => dl<DatePickerCubit>()
            ),
            BlocProvider<SlidersCubit>(
                create: (BuildContext context) => dl<SlidersCubit>()
            ),
          ],
          child: MaterialApp(
            useInheritedMediaQuery: true,
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
            debugShowCheckedModeBanner: false,
            theme: getAppTheme(),
            home: child,
          ),
        );
      },
      child: const SplashScreenPage(),
    );
  }
}
