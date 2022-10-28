import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/ResuableWidgets/BuildItem.dart';
import '../../../FlatDetails/presentation/pages/ItemDetailes.dart';
import '../../data/remote/models/HotelModel.dart';

class ListOfNearestHotels extends StatelessWidget {
  const ListOfNearestHotels({
    Key? key,
    required this.hotels,
  }) : super(key: key);

  final List<HotelModel> hotels;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400.h,
      child: ListView.builder(
        itemCount: hotels.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>  ItemDetails(hotelModel: hotels[index]),));
              },
              child: BuildItem(bottomPaddingValue: 0,hotelModel: hotels[index],width: 295.w,));
        },),
    );
  }
}