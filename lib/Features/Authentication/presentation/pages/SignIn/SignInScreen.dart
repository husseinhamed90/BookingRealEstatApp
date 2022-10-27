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
import '../../../../../Core/AppTheme/Strings.dart';
import '../../../../../Core/ReusableComponantes.dart';
import '../../widgets/BackgroundImage.dart';

class SignInScreen extends StatefulWidget {

  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();

    dl<AuthBloc>().add(CheckIfUserLoggedIn());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          const BackgroundImage(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 56.h+MediaQuery.of(context).padding.top,),
                SvgPicture.asset(
                  logoImageAsset,color: primaryColor,
                ),
                SizedBox(height: 56.h,),
                getColumn(firstString: signInLabel,secondString: exploreOffersSubtitle),
                SizedBox(height: 20.h,),
                CustomTextField(isSecure: false,isClickable: false,controller:emailController ,iconName: usernameFieldIcon,hindText: "Enter Email",readOnly: false,haveBorder: false,textAlign: TextAlign.left),
                SizedBox(height: 20.h),
                CustomTextField(isSecure: true,isClickable: false,controller: passwordController,iconName: passwordFieldIcon,hindText: "Enter Password",readOnly: false,haveBorder: false,textAlign: TextAlign.left),
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
                      }, child: const Text(signInLabel)),
                    );
                  },
                  listener: (context, state) {
                    if(state.message!.message=="Logged In"||state.message!.message=="Already Logged"){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  const HomePageLayoutPage(),));
                    }
                    else if(state.errorMessage!=""){
                      final snackBar = SnackBar(
                        content: Text(state.errorMessage),
                        action: SnackBarAction(
                          label: 'Undo',
                          onPressed: () {},
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                ),
                SizedBox(height: 32.h),
                Center(
                  child: GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen(),)),
                    child: Text(notHaveAccountMassage,style: TextStyle(
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



