class Description {
  ExtraLines? extraLines;
  String? languagecode;
  String? description;
  int? descriptiontypeId;

  Description(
      {this.extraLines,
        this.languagecode,
        this.description,
        this.descriptiontypeId});


}

class ExtraLines {
  String? impInfo;

  ExtraLines({this.impInfo});

  ExtraLines.fromJson(Map<String, dynamic> json) {
    impInfo = json['imp_info'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['imp_info'] = impInfo;
    return data;
  }
}