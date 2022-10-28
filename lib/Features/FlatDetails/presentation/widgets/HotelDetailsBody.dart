import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:realestate/Features/FlatDetails/presentation/widgets/SliderOfHotelImages.dart';

import '../../../../Core/AppTheme/AppColors.dart';
import '../../../../Core/ReusableComponantes.dart';
import '../../../SearchForm/domain/entities/Hotel.dart';
import '../../data/remote/models/DescriptionModel.dart';
import '../../data/remote/models/HotelDetailsModel.dart';
import '../../data/remote/models/HotelPhotoModel.dart';
import 'BuildHotelDescription.dart';
import 'UpperImageSlider.dart';

class HotelDetailsBody extends StatelessWidget {
  final Hotel hotel;
  final List<HotelPhotoModel> hotelPhotoModels;
  final HotelDetailsModel hotelDetailsModel;
  final HotelDescriptionModel hotelDescriptionModel;

  const HotelDetailsBody({
    required this.hotelDescriptionModel,
    required this.hotelDetailsModel,
    required this.hotelPhotoModels,
    required this.hotel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        UpperImageSlider(hotelModel: hotel,hotelPhotoModels:hotelPhotoModels, ),
        SizedBox(height: 30.h,),
        buildItemInfo(color: primaryColor,hotelDetailsModel: hotelDetailsModel,hotelModel:hotel),
        SizedBox(height: 14.h,),
        BuildHotelDescription(hotelDescriptionModel: hotelDescriptionModel,)
      ],
    );
  }
}