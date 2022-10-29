import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/AppTheme/AppColors.dart';
import '../../../../Core/AppTheme/Strings.dart';
import '../../../../Core/ReusableComponantes.dart';
import '../../../FlatDetails/data/remote/models/HotelBlocksModel.dart';

class UpperSection extends StatelessWidget {
  const UpperSection({
    Key? key,
    required this.hotelBlockModel,
  }) : super(key: key);

  final List<HotelBlocksModel> hotelBlockModel;

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
              child: getColumn(firstString: hotelRoomsAppbarTitle,secondString: "We Have ${hotelBlockModel[0].rooms!.length.toString()} Types Of Rooms And ${hotelBlockModel[0].blocks!.length.toString()} Available Block"),
            ),
            SizedBox(height: 20.h,),
          ],
        ),
      ),
    );
  }
}
