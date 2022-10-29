import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../FlatDetails/domain/entities/HotelRooms.dart';
import '../pages/HotelRooms/room_item.dart';

class RoomsList extends StatelessWidget {
  const RoomsList({
    Key? key,
    required this.blocks,
  }) : super(key: key);

  final List<Block> blocks;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(right: 20.w,left: 20.w),
      sliver: SliverList(delegate: SliverChildBuilderDelegate((context, index) {
        return RoomItem(block: blocks[index],);
      },childCount:blocks.length)),
    );
  }
}
