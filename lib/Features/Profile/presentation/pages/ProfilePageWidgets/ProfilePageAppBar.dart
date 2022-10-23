import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:realestate/Features/Authentication/presentation/manager/auth_bloc.dart';
import 'package:realestate/Features/Authentication/presentation/pages/SignIn/SignInScreen.dart';

import '../../../../../Core/AppTheme/AppColors.dart';
import '../../../../../Core/AppTheme/Strings.dart';
import '../../../../../Core/BottomNavBarBloc/bottom_nav_bar_bloc.dart';
import '../../../../../Core/ReusableComponantes.dart';
import '../../../../../DependencyInjection.dart';

class ProfilePageAppBar extends StatelessWidget {
  const ProfilePageAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(
            bottom: 42.h,
          ),
          color: primaryColor,
          height: 179.h,
          child: Row(
            children: [
              //SizedBox(width: 50,),
              const SizedBox(width: 60),
              Expanded(
                child: Container(
                    alignment: Alignment.center,
                    child: buildCustomText(text: profileAppbarTitle,fontWeight: FontWeight.w400,size: 22)
                ),
              ),
              BlocConsumer<AuthBloc,AuthState>(
                builder: (context, state) {
                  return GestureDetector(
                      onTap: () {
                        dl<AuthBloc>().add(SignOutEvent());
                        dl<BottomNavBarBloc>().add(const ChangeNavBarIndexEvent(newIndex: 0));
                      },
                      child: const SizedBox(width: 60,height: 30, child: Icon(Icons.logout,size: 30,color: Colors.white,)));
                },
                listener: (context, state) {
                  if(state.message!.message=="User Signed Out"){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SignInScreen(),));
                  }
                },
              ),
            ],
          ),
        ),
        Container(),
        Positioned(
          top: 110.0.h,
          bottom: 0,
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              height: 110.w,
              width: 110.w,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(defaultProfilePicture),
                    fit: BoxFit.fill),
              ),
            ),
          ),
        )
      ],
    );
  }
}
