import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:realestate/Features/Authentication/presentation/pages/SignIn/SignInWidgets/CustomTextField.dart';
import 'package:realestate/Features/Authentication/presentation/pages/SignUp/SignUpScreen.dart';
import 'package:realestate/Features/HomePageLayout/HomePageLayoutPage.dart';
import '../../../../../Core/AppColors.dart';
import '../../../../../Core/ReusableComponantes.dart';

class SignInScreen extends StatelessWidget {

  SignInScreen({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SvgPicture.asset(
                "Assets/Images/loginbackground.svg",
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 100.h,),
                SvgPicture.asset(
                    "Assets/Images/logo.svg",color: primaryColor,
                ),
                SizedBox(height: 56.h,),
                getColumn(firstString: "Sign in",secondString: "And explore 28 192+ offers"),
                SizedBox(height: 20.h,),
                CustomTextField(isClickable: false,controller:emailController ,iconName: "Assets/Icons/user.svg",hindText: "Enter Email",readOnly: false,haveBorder: false,textAlign: TextAlign.left),
                SizedBox(height: 20.h),
                CustomTextField(isClickable: false,controller: passwordController,iconName: "Assets/Icons/lock.svg",hindText: "Enter Password",readOnly: false,haveBorder: false,textAlign: TextAlign.left),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  height: 60.h,
                  child: ElevatedButton(onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  const HomePageLayoutPage(),));
                  }, child: const Text("SIGN IN")),
                ),
                SizedBox(height: 32.h),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen(),));
                    },
                    child: Text("Don’t have an account? - Sign up",style: TextStyle(
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

