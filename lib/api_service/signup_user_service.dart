import 'dart:convert';
import 'package:http/http.dart' as http;

class SignupService {
  static Future SignUser({
    String? fristname,
    String? lastname,
    String? username,
    String? password,
  }) async {
    Map<String, dynamic> reqbody = {
      'fristname': fristname,
      'lastname': lastname,
      'username': username,
      'password': password,
      'avtar':
          "data:image/jpeg;base64,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"
    };

    http.Response response = await http.post(
        Uri.parse("https://codelineinfotech.com/student_api/User/signup.php"),
        body: reqbody);

    var result = jsonDecode(response.body);
    print('SIGN UP RESPONSE===>>${jsonDecode(response.body)}');
    return result;
  }

  static Future<bool> SignUserwithModel(Map<String, dynamic> json) async {
    http.Response response = await http.post(
        Uri.parse("https://codelineinfotech.com/student_api/User/signup.php"),
        body: json);

    var result = jsonDecode(response.body);
    print('SIGN UP RESPONSE===>>${jsonDecode(response.body)}');
    return result['status'];
  }
}
