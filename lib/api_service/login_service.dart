import 'dart:convert';

import 'package:http/http.dart' as http;

class LoginService {
  static Future<bool> LoginServiceWithModel(
      Map<String, dynamic> reqbody) async {
    http.Response response = await http.post(
        Uri.parse('https://codelineinfotech.com/student_api/User/login.php'),
        body: reqbody);

    var Result = jsonDecode(response.body);
    print('Sign In Response ==>${jsonDecode(response.body)}');
    return Result['status'];
  }
}
