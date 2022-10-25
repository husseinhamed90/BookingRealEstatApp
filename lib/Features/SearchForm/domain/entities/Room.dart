class Room {
  List<Photos>? photos;
  String? description;
  int ?roomId;

  Room({this.photos, this.description,required this.roomId});

  Room.fromJson(Map<String, dynamic> json) {
    if (json['photos'] != null) {
      photos = <Photos>[];
      json['photos'].forEach((v) {
        photos!.add(Photos.fromJson(v));
      });
    }
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (photos != null) {
      data['photos'] = photos!.map((v) => v.toJson()).toList();
    }
    data['description'] = description;
    return data;
  }
}

class Photos {
  double? ratio;
  String? lastUpdateDate;
  String? url640x200;
  int? photoId;
  int? newOrder;
  String? urlSquare60;
  String? urlMax300;
  String? urlOriginal;

  Photos(
      {this.ratio,
        this.lastUpdateDate,
        this.url640x200,
        this.photoId,
        this.newOrder,
        this.urlSquare60,
        this.urlMax300,
        this.urlOriginal});

  Photos.fromJson(Map<String, dynamic> json) {

    if(json['ratio']!=null){
      ratio = json['ratio'].toDouble();
    }
    else{
      ratio = 0.0;
    }
    lastUpdateDate = json['last_update_date'];
    url640x200 = json['url_640x200'];
    photoId = json['photo_id'];
    newOrder = json['new_order'];
    urlSquare60 = json['url_square60'];
    urlMax300 = json['url_max300'];
    urlOriginal = json['url_original'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ratio'] = ratio;
    data['last_update_date'] = lastUpdateDate;
    data['url_640x200'] = url640x200;
    data['photo_id'] = photoId;
    data['new_order'] = newOrder;
    data['url_square60'] = urlSquare60;
    data['url_max300'] = urlMax300;
    data['url_original'] = urlOriginal;
    return data;
  }
}