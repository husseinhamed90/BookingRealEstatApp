import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../Core/Utils.dart';
import '../../../../FlatDetails/data/remote/models/HotelBlocksModel.dart';

class BuildUpperImage extends StatelessWidget {
  const BuildUpperImage({
    Key? key,
    required this.hotelBlocksModel,
    required this.blockIndex,
  }) : super(key: key);

  final HotelBlocksModel hotelBlocksModel;
  final int? blockIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
          image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(getUrl(hotelBlocksModel,blockIndex!))
          )
      ),
    );
  }
}