import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:realestate/DependencyInjection.dart';
import 'package:realestate/Features/Authentication/presentation/manager/auth_bloc.dart';
import 'package:realestate/Features/Authentication/presentation/pages/SignIn/SignInWidgets/CustomTextField.dart';
import 'package:realestate/Features/Authentication/presentation/pages/SignUp/SignUpScreen.dart';
import 'package:realestate/Features/HomePageLayout/HomePageLayoutPage.dart';
import '../../../../../Core/AppTheme/AppColors.dart';
import '../../../../../Core/ReusableComponantes.dart';

class SignInScreen extends StatefulWidget {

  SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dl<AuthBloc>().add(CheckIfUserLoggedIn());
  }

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
                SizedBox(height: 56.h+MediaQuery.of(context).padding.top,),
                SvgPicture.asset(
                    "Assets/Images/logo.svg",color: primaryColor,
                ),
                SizedBox(height: 56.h,),
                getColumn(firstString: "Sign in",secondString: "And explore 28 192+ offers"),
                SizedBox(height: 20.h,),
                CustomTextField(isSecure: false,isClickable: false,controller:emailController ,iconName: "Assets/Icons/user.svg",hindText: "Enter Email",readOnly: false,haveBorder: false,textAlign: TextAlign.left),
                SizedBox(height: 20.h),
                CustomTextField(isSecure: true,isClickable: false,controller: passwordController,iconName: "Assets/Icons/lock.svg",hindText: "Enter Password",readOnly: false,haveBorder: false,textAlign: TextAlign.left),
                const Spacer(),
                BlocConsumer<AuthBloc,AuthState>(
                  builder: (context, state) {
                    if(state.message!.message=="Loading"){
                      return const Center(
                        child: CircularProgressIndicator(color: primaryColor),
                      );
                    }
                    return SizedBox(
                      width: double.infinity,
                      height: 60.h,
                      child: ElevatedButton(onPressed: () {
                        dl<AuthBloc>().add(SignInEvent(email: emailController.text,password: passwordController.text));
                      }, child: const Text("SIGN IN")),
                    );
                  },
                  listener: (context, state) {
                    if(state.message!.message=="Logged In"||state.message!.message=="Already Logged"){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  const HomePageLayoutPage(),));
                    }
                    else if(state.errorMessage=="Error"){
                      final snackBar = SnackBar(
                        content: Text(state.message!.message),
                        action: SnackBarAction(
                          label: 'Undo',
                          onPressed: () {
                            // Some code to undo the change.
                          },
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
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

