import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/AppTheme/AppColors.dart';
import '../../../../Core/AppTheme/Strings.dart';
import '../../../../Core/ReusableComponantes.dart';
import '../../../FlatDetails/data/remote/models/HotelBlocksModel.dart';

class UpperSection extends StatelessWidget {
  const UpperSection({
    required this.title,
    required this.subTitle,
    Key? key,
  }) : super(key: key);
  final String title,subTitle;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        color: primaryColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: getColumn(firstString: title,secondString: subTitle),
            ),
            SizedBox(height: 20.h,),
          ],
        ),
      ),
    );
  }
}
