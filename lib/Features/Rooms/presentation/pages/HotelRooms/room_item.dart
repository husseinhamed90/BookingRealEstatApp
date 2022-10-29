import 'package:flutter/material.dart';
import 'package:realestate/Features/FlatDetails/domain/entities/HotelRooms.dart';
import '../../widgets/RoomItemParts/BuildRoomInfo.dart';
import '../../widgets/RoomItemParts/BuildUpperImage.dart';
import '../../widgets/zoom_icon_button.dart';

class RoomItem extends StatelessWidget {
  final bool isBookedRooms;
  const RoomItem({
    required this.isBookedRooms,
    Key? key,
    required this.block,
  }) : super(key: key);
  final Block block;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            BuildUpperImage(block: block),
            BuildRoomInfo(block: block,isBookedRooms: isBookedRooms),
          ],
        ),
        ZoomIconButton(block: block),
      ],
    );
  }
}


