import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:realestate/Core/BottomNavBarBloc/bottom_nav_bar_bloc.dart';
import 'package:realestate/Features/Authentication/presentation/manager/auth_bloc.dart';
import 'package:realestate/Features/SearchFilters/presentation/manager/DatePickerCubit.dart';
import 'package:realestate/Features/SearchFilters/presentation/manager/filters_bloc.dart';
import 'package:realestate/Features/SearchFilters/presentation/manager/sliders_cubit.dart';
import 'package:realestate/Features/SearchForm/presentation/manager/HotelsByCoordinatedBloc/hotels_by_coordinates_bloc.dart';
import 'package:realestate/Features/Rooms/presentation/pages/PaymentDone.dart';
import 'Core/AppTheme/AppColors.dart';
import 'Core/AppTheme/Themes.dart';
import 'Core/NavigationService/NavigationService.dart';
import 'DependencyInjection.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Features/FavouriteIcon/presentation/manager/FavouriteIconCubit/favourite_cubit.dart';
import 'package:realestate/Features/FlatDetails/presentation/manager/HotelDetailsBloc/HotelDetailsBloc.dart';
import 'Features/SplashScreen/SplachScreenPage.dart';
import 'firebase_options.dart';

void main()async {

  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: primaryColor
  ));

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  init();


  runApp( MyApp());
}
class MyApp extends StatelessWidget {

   MyApp({super.key});
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

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
              create: (BuildContext context) => dl<AuthBloc>()
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
            debugShowCheckedModeBanner: false,
            initialRoute: '/',
            theme: getAppTheme(),
            navigatorKey: dl<NavigationService>().navigatorKey,
            routes: {
              '/' :(context) => const SplashScreenPage(),
              '/PaymentDone': (context) => const PaymentProcessEnd(),
            },
          ),
        );
      },
    );
  }
}
