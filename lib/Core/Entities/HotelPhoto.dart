class HotelPhoto {
  List<Tags>? tags;
  String? urlSquare60;
  String? urlMax;
  String? url1440;

  HotelPhoto({this.tags, this.urlSquare60, this.urlMax, this.url1440});

}

class Tags {
  String? tag;

  Tags({this.tag});

  Tags.fromJson(Map<String, dynamic> json) {
    tag = json['tag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tag'] = tag;
    return data;
  }
}