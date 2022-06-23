import 'dart:convert';

class UserModel {
  late final String uid;
  late final String name;
  late final String id;
  late final String atype;

  List<UserModel> userModelFromJson(String response) {
    var decodedJson = json.decode(response)[0]['users'] as List;
    return decodedJson.map((user) => UserModel.fromJson(user)).toList();
  }

  UserModel(
      {String uid = "", String id = "", String name = "", String atype = ""}) {
    this.uid = uid;
    this.name = name;
    this.id = id;
    this.atype = atype;
  }

  UserModel.fromJson(Map<dynamic, dynamic> json) {
    name = json['name'];
    id = json['id'];
    atype = json['atype'];
  }
}
