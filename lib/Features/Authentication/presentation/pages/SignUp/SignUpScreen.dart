import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:realestate/Features/Authentication/presentation/pages/SignIn/SignInWidgets/CustomTextField.dart';
import 'package:realestate/Features/HomePageLayout/HomePageLayoutPage.dart';
import '../../../../../Core/AppTheme/AppColors.dart';
import '../../../../../Core/ReusableComponantes.dart';

class SignUpScreen extends StatelessWidget {
   SignUpScreen({Key? key}) : super(key: key);

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

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
            child: ListView(

              children: [
                SizedBox(height: 100.h,),
                SvgPicture.asset(
                  alignment: Alignment.centerLeft,
                  "Assets/Images/logo.svg",color: primaryColor,
                ),
                SizedBox(height: 56.h,),
                getColumn(firstString: "Sign Up",secondString: "And explore 28 192+ offers"),
                SizedBox(height: 20.h,),
                CustomTextField(isClickable: false,controller: usernameController,iconName: "Assets/Icons/user.svg",hindText: "Enter Username",readOnly: false,haveBorder: false,textAlign: TextAlign.left),
                SizedBox(height: 20.h),
                CustomTextField(isClickable: false,controller: emailController,iconName: "Assets/Icons/lock.svg",hindText: "Enter Email",readOnly: false,haveBorder: false,textAlign: TextAlign.left),
                SizedBox(height: 20.h),
                CustomTextField(isClickable: false,controller: passwordController,iconName: "Assets/Icons/lock.svg",hindText: "Enter Password",readOnly: false,haveBorder: false,textAlign: TextAlign.left),
                SizedBox(height: 20.h),
                CustomTextField(isClickable: false,controller: confirmPasswordController,iconName: "Assets/Icons/lock.svg",hindText: "Enter Confirm Password",readOnly: false,haveBorder: false,textAlign: TextAlign.left),
                SizedBox(height: 60.h),
                SizedBox(
                  width: double.infinity,
                  height: 60.h,
                  child: ElevatedButton(onPressed: () async{

                    // await FirebaseAuth.instance.signOut();

                    // FirebaseAuth.instance
                    //     .authStateChanges()
                    //     .listen((User? user) {
                    //   if (user == null) {
                    //     print('User is currently signed out!');
                    //   } else {
                    //     print('User is signed in!');
                    //   }
                    // });


                    await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text).then((value) {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePageLayoutPage(),));
                    }).onError((error, stackTrace) {
                      print(error);
                    });

                    // await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text).then((value) {
                    //   print(value.user!.email);
                    // }).onError((error, stackTrace) {
                    //   print(error);
                    // });

                    //Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePageLayoutPage(),));
                  }, child: const Text("SIGN UP")),
                ),
                SizedBox(height: 32.h),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text("Already have an account? - Sign In",style: TextStyle(
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

