class UserEntity{
  String ?id;
  String ?userName;
  String ?email;
  String ?phoneNumber;
  String ?password;

  UserEntity(
      {this.id, this.userName, this.email, this.phoneNumber, this.password});

  UserEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userName'] = userName;
    data['email'] = email;
    data['phoneNumber'] = phoneNumber;
    data['password'] = password;
    return data;
  }
}