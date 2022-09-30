import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:realestate/Features/Profile/presentation/pages/ProfilePageWidgets/profile_form.dart';
import 'ChangePhoto.dart';
import 'SwitchToPublisherModeButton.dart';
import 'Username.dart';

class ProfilePageBody extends StatelessWidget {
  const ProfilePageBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Username(),
        SizedBox(
          height: 5.h,
        ),
        const ChangePhoto(),
        SizedBox(
          height: 30.h,
        ),
        const ProfileForm(),
        SizedBox(
          height: 48.h,
        ),
      ],
    );
  }
}



