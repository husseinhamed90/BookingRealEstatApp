
import 'package:realestate/Features/SearchForm/domain/entities/HotelRooms.dart';
import 'package:realestate/Features/SearchForm/domain/entities/Room.dart';

class HotelBlocksModel extends HotelBlocks {


  HotelBlocksModel.fromJson(Map<String, dynamic> json) {
    if (json['block'] != null) {
      block = <Block>[];
      rooms = {};
      json['block'].forEach((v) {
        block!.add(Block.fromJson(v));
        Room room =Room.fromJson(json["rooms"]['${(v["room_id"])}']);
        room.roomId=v["room_id"];
        rooms!["${v["room_id"]}"]=room;
      });
    }
    hotelId = json['hotel_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (block != null) {
      data['block'] = block!.map((v) => v.toJson()).toList();
    }
    data['hotel_id'] = hotelId;
    return data;
  }
}