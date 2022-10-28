import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:realestate/Core/AppTheme/Strings.dart';
import 'package:realestate/DependencyInjection.dart';
import 'package:realestate/Features/Authentication/domain/entities/UserEntity.dart';
import 'package:realestate/Features/Authentication/presentation/manager/auth_bloc.dart';
import 'package:realestate/Features/Authentication/presentation/pages/SignIn/SignInWidgets/CustomTextField.dart';
import 'package:realestate/Features/HomePageLayout/HomePageLayoutPage.dart';
import '../../../../../Core/AppTheme/AppColors.dart';
import '../../../../../Core/ReusableComponantes.dart';
import '../../widgets/BackgroundImage.dart';

class SignUpScreen extends StatelessWidget {
   SignUpScreen({Key? key}) : super(key: key);

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
   TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          const BackgroundImage(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: ListView(

              children: [
                SizedBox(height: 100.h,),
                SvgPicture.asset(
                  alignment: Alignment.centerLeft,
                    logoImageAsset,color: primaryColor,
                ),
                SizedBox(height: 56.h,),
                getColumn(firstString: signUpLabel,secondString: exploreOffersSubtitle),
                SizedBox(height: 20.h,),
                CustomTextField(isSecure: false,isClickable: false,controller: usernameController,iconName: usernameFieldIcon,hindText: "Enter Username",readOnly: false,haveBorder: false,textAlign: TextAlign.left),
                SizedBox(height: 20.h),
                CustomTextField(isSecure: false,isClickable: false,controller: emailController,iconName: usernameFieldIcon,hindText: "Enter Email",readOnly: false,haveBorder: false,textAlign: TextAlign.left),
                SizedBox(height: 20.h),
                CustomTextField(isSecure: false,isClickable: false,controller: phoneNumberController,iconName: usernameFieldIcon,hindText: "Enter Phone Number",readOnly: false,haveBorder: false,textAlign: TextAlign.left),
                SizedBox(height: 20.h),
                CustomTextField(isSecure: true,isClickable: false,controller: passwordController,iconName:passwordFieldIcon,hindText: "Enter Password",readOnly: false,haveBorder: false,textAlign: TextAlign.left),
                SizedBox(height: 20.h),
                CustomTextField(isSecure: true,isClickable: false,controller: confirmPasswordController,iconName: passwordFieldIcon,hindText: "Enter Confirm Password",readOnly: false,haveBorder: false,textAlign: TextAlign.left),
                SizedBox(height: 60.h),
                BlocConsumer<AuthBloc,AuthState>(
                  listener: (context, state) {
                    if(state.message!.message=="Logged in"||state.message!.message=="Already Logged"){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  const HomePageLayoutPage(),));
                    }
                    else if(state.message!.message=="Error"){
                      showSnackBar(state.message!.message, context);
                    }
                  },
                  builder: (context, state) {
                    if(state.message!.message=="Loading"){
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return SizedBox(
                      width: double.infinity,
                      height: 60.h,
                      child: ElevatedButton(onPressed: () async{
                        if(passwordController.text==confirmPasswordController.text){
                          dl<AuthBloc>().add(SignUpEvent(userEntity: UserEntity(
                              password: passwordController.text,
                              email: emailController.text,
                              phoneNumber: phoneNumberController.text,
                              userName: usernameController.text
                          )));
                        }
                      }, child: Text(signUpLabel)),
                    );
                  },
                ),
                SizedBox(height: 32.h),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(alreadyHaveAnAccount,style: TextStyle(
                        fontSize: 16.sp,fontWeight: FontWeight.w400,color: Colors.white
                    )),
                  ),
                ),
                SizedBox(height: 40.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

