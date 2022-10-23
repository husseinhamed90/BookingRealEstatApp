import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../DependencyInjection.dart';
import '../../../../Authentication/presentation/manager/auth_bloc.dart';

class Username extends StatelessWidget {
  const Username({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 29.h,
        child: FittedBox(
          child: Text(dl<AuthBloc>().state.userEntity!.userName!,
              style: TextStyle(
                  color: const Color(0xff312D2C),
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,fontFamily: "Raleway"),maxLines: 1,overflow: TextOverflow.clip),
        ),
      ),
    );
  }
}