
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../SearchForm/domain/entities/Hotel.dart';
import '../../data/remote/models/HotelPhotoModel.dart';
import 'CustomBackButton.dart';
import 'RowOfButtonAndIconButton.dart';
import 'SliderOfHotelImages.dart';

class UpperImageSlider extends StatelessWidget {
  final List<HotelPhotoModel> hotelPhotoModels;
  final Hotel hotelModel;
  const UpperImageSlider({
    required this.hotelModel,
    required this.hotelPhotoModels,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 405.h,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          SliderOfHotelImages(hotelPhotoModels: hotelPhotoModels),
          RowOfButtonAndIconButton(hotel: hotelModel,),
          const CustomBackButton()
        ],
      ),
    );
  }
}



