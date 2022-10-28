import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/remote/models/HotelPhotoModel.dart';

class SliderOfHotelImages extends StatelessWidget {
  final List<HotelPhotoModel> hotelPhotoModels;
  const SliderOfHotelImages({
    required this.hotelPhotoModels,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 375.h,
      child: PageView.builder(
          itemCount: hotelPhotoModels.length,
          pageSnapping: true,
          itemBuilder: (context,index){
            return  Container(
              height: 375.h,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(hotelPhotoModels[index].urlMax!)
                  )
              ),
            );
          }),
    );
  }
}