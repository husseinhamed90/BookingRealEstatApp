import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:realestate/Core/BottomNavBarBloc/bottom_nav_bar_bloc.dart';
import 'package:realestate/Features/HomePageLayout/HomePageLayoutPage.dart';
import '../AppTheme/AppColors.dart';
import '../AppTheme/Strings.dart';
import '../BottomNavBarBloc/bottom_nav_bar_state.dart';
import '../../DependencyInjection.dart';


class BottomNavBar extends StatelessWidget {
  final bool isInHomeScreen;
  const BottomNavBar({Key? key,required this.isInHomeScreen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBarBloc,BottomNavBarState>(
        builder: (context, state) {
          return BottomNavigationBar(
            onTap: (value) {
              if(!isInHomeScreen){
                dl<BottomNavBarBloc>().add(const ChangeNavBarIndexEvent(newIndex: 0));
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomePageLayoutPage(),));
              }
              dl<BottomNavBarBloc>().add(ChangeNavBarIndexEvent(newIndex: value));
            },
            currentIndex: state.navBarIndex!,
            items:  <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(width: 20.h,height: 20.h,searchIconAsset,color: state.navBarIndex==0?primaryColor:const Color(0xff9197A2)),
                  label: exploreLabel),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(width: 25.h,height: 25.h,bookedHotelsAsset,color: state.navBarIndex==1?primaryColor:const Color(0xff9197A2)),
                  label: bookedHotelsLabel),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(width: 20.h,height: 20.h,heartIconAsset,color: state.navBarIndex==2?primaryColor:const Color(0xff9197A2)),
                  label: favouriteLabel),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(height: 20.h,width: 20.h,profileIconAsset,color: state.navBarIndex==3?primaryColor:const Color(0xff9197A2)),
                  label: profileLabel),
            ],
          );
        }
    );
  }
}