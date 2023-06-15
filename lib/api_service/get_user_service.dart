import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Model/Get_user_Model.dart';

class GetData {
  static Future<GetAllUser?> GetUserData() async {
    http.Response response = await http.get(Uri.parse(
        "http://scprojects.in.net/projects/skoolmonk/api_/user/create"),headers: {

    });
    print("RESPONSE===>>${jsonDecode(response.body)}");
    return getAllUserFromJson(response.body);
  }
}
