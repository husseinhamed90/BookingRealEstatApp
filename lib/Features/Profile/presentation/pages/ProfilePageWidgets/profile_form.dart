import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:realestate/DependencyInjection.dart';
import 'package:realestate/Features/Authentication/presentation/manager/auth_bloc.dart';
import 'package:realestate/Features/Authentication/presentation/pages/SignIn/SignInWidgets/CustomTextField.dart';

import '../../../../../Core/ReusableComponantes.dart';

class ProfileForm extends StatefulWidget {
  const ProfileForm({Key? key}) : super(key: key);

  @override
  _ProfileFormState createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 48.w),
      child: Form(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildTextFieldLabelText(
              text: "E-MAIL",
              color: const Color(0xff312D2C),
              fontSize: 13,
              fontWeight: FontWeight.w600),
          SizedBox(
            height: 6.h,
          ),
          CustomTextField(
              isSecure: false,
              isClickable: false,
              hindText: dl<AuthBloc>().state.userEntity!.email!,
              readOnly: true,
              haveBorder: true,
              textAlign: TextAlign.center,
              haveIcon: false,
              controller: dl<AuthBloc>().userController),
          SizedBox(
            height: 40.h,
          ),
          buildTextFieldLabelText(
              text: "PHONE NUMBER",
              color: const Color(0xff312D2C),
              fontSize: 13,
              fontWeight: FontWeight.w600),
          SizedBox(
            height: 6.h,
          ),
          CustomTextField(
              isSecure: false,
              isClickable: false,
              hindText: dl<AuthBloc>().state.userEntity!.phoneNumber!,
              readOnly: true,
              haveBorder: true,
              textAlign: TextAlign.center,
              haveIcon: false,
              controller: dl<AuthBloc>().phoneNumberController),
          SizedBox(
            height: 40.h,
          ),
          buildTextFieldLabelText(
              text: "PASSWORD",
              color: const Color(0xff312D2C),
              fontSize: 13,
              fontWeight: FontWeight.w600),
          SizedBox(
            height: 6.h,
          ),
          CustomTextField(
              isSecure: true,
              isClickable: false,
              hindText: dl<AuthBloc>().state.userEntity!.password!,
              readOnly: true,
              haveBorder: true,
              textAlign: TextAlign.center,
              haveIcon: false,
              controller: dl<AuthBloc>().passwordController),
          SizedBox(
            height: 40.h,
          ),
          buildTextFieldLabelText(
              text: "CONFIRM PASSWORD",
              color: const Color(0xff312D2C),
              fontSize: 13,
              fontWeight: FontWeight.w600),
          SizedBox(
            height: 6.h,
          ),
          CustomTextField(
              isSecure: true,
              isClickable: false,
              hindText: dl<AuthBloc>().state.userEntity!.password!,
              readOnly: true,
              haveBorder: true,
              textAlign: TextAlign.center,
              haveIcon: false,
              controller: dl<AuthBloc>().confirmPasswordController),
        ],
      )),
    );
  }
}
