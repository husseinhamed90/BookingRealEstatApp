import 'package:realestate/Features/FlatDetails/domain/entities/HotelDescription.dart';

class HotelDescriptionModel extends Description{
  HotelDescriptionModel.fromJson(Map<String, dynamic> json) {
    extraLines = json['extra_lines'] != null
        ? ExtraLines.fromJson(json['extra_lines'])
        : null;
    languagecode = json['languagecode'];
    description = json['description'];
    descriptiontypeId = json['descriptiontype_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (extraLines != null) {
      data['extra_lines'] = extraLines!.toJson();
    }
    data['languagecode'] = languagecode;
    data['description'] = description;
    data['descriptiontype_id'] = descriptiontypeId;
    return data;
  }
}