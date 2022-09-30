import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'ProfilePageWidgets/ProfilePageAppBar.dart';
import 'ProfilePageWidgets/ProfilePageBody.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(222.h),
        child: const ProfilePageAppBar(),
      ),
      body: const ProfilePageBody(),
    );
  }
}



