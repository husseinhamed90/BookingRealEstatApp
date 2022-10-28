import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../FlatDetails/data/remote/models/HotelBlocksModel.dart';
import '../pages/HotelRooms/room_item.dart';

class RoomsList extends StatelessWidget {
  const RoomsList({
    Key? key,
    required this.hotelBlockModel,
  }) : super(key: key);

  final List<HotelBlocksModel> hotelBlockModel;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(right: 20.w,left: 20.w),
      sliver: SliverList(delegate: SliverChildBuilderDelegate((context, index) {
        return RoomItem(hotelBlocksModel: hotelBlockModel[0], blockIndex: index);
      },childCount: hotelBlockModel[0].block!.length)),
    );
  }
}
