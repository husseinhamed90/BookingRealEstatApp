
import 'package:realestate/Features/FlatDetails/domain/entities/HotelRooms.dart';
import 'package:realestate/Features/SearchForm/domain/entities/Room.dart';

class HotelBlocksModel extends HotelBlocks {


  HotelBlocksModel.fromJson(Map<String, dynamic> json) {
    if (json['block'] != null) {
      blocks = <Block>[];
      rooms = {};
      json['block'].forEach((v) {
        Room room =Room.fromJson(json["rooms"]['${(v["room_id"])}']);
        room.roomId=v["room_id"];
        roomsObjets.add(room);
        Block newBlock =Block.fromJson(v);
        newBlock.blockRoom =Room.fromJson(json["rooms"]['${(v["room_id"])}']);
        blocks!.add(newBlock);
        rooms!["${v["room_id"]}"]=room;
      });
    }
    hotelId = json['hotel_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (blocks != null) {
      data['block'] = blocks!.map((v) => v.toJson()).toList();
    }
    data['hotel_id'] = hotelId;
    return data;
  }
}