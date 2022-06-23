import 'package:flutter/services.dart';
import 'package:outshade_project/models/user_model.dart';

class ApiService {
  final userModel = UserModel();

  Future<List<UserModel>> compileJson() async {
    final String response = await rootBundle.loadString('lib/api.json');
    return userModel.userModelFromJson(response);
  }
}
