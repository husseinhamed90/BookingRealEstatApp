import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../data/remote/models/HotelModel.dart';
import 'ListOfNearestHotels.dart';
import 'PageHeader.dart';
import 'TextWithShadow.dart';

class SearchFormBody extends StatelessWidget {
  final List<HotelModel>hotels;
  const SearchFormBody({
    required this.hotels,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const PageHeader(),
        SizedBox(height: 14.h,),
        const TextWithShadow(),
        ListOfNearestHotels(hotels: hotels)
      ],
    );
  }
}