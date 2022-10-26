import 'package:flutter/material.dart';
import 'package:realestate/Features/FlatDetails/data/remote/models/HotelBlocksModel.dart';
import '../../widgets/RoomItemParts/BuildRoomInfo.dart';
import '../../widgets/RoomItemParts/BuildUpperImage.dart';
import '../../widgets/zoom_icon_button.dart';

class RoomItem extends StatelessWidget {
  const RoomItem({Key? key,required this.hotelBlocksModel,required this.blockIndex}) : super(key: key);
  final int ?blockIndex;
  final HotelBlocksModel hotelBlocksModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            BuildUpperImage(hotelBlocksModel: hotelBlocksModel, blockIndex: blockIndex),
            BuildRoomInfo(hotelBlocksModel: hotelBlocksModel, blockIndex: blockIndex),
          ],
        ),
        ZoomIconButton(hotelBlocksModel: hotelBlocksModel,blockIndex: blockIndex!,),
      ],
    );
  }
}





