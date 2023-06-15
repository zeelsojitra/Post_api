import 'dart:convert';

import 'package:http/http.dart' as http;

class Delete_service {
  static Future Delete_user(Map<String, dynamic> reqbody) async {
    http.Response response = await http.post(
        Uri.parse(
            "https://codelineinfotech.com/student_api/User/delete_user.php"),
        body: reqbody);
    var result = jsonDecode(response.body);
    print("Delete Response ==> ${jsonDecode(response.body)}");
    return result['status'];
  }
}
