import 'package:flutter/material.dart';
import 'package:post_api/view/home_page.dart';
import 'package:post_api/view/sign_up.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Comman_widget/Comman_Container.dart';
import '../Comman_widget/Comman_TeextFiled.dart';
import '../Comman_widget/Comman_text.dart';
import '../api_service/login_service.dart';
import '../model/Login_model.dart';
import 'package:flutter/cupertino.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({Key? key}) : super(key: key);

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  final Passwordcontroler = TextEditingController();
  final username = TextEditingController();
  final gloablekey = GlobalKey<FormState>();
  bool isLoding = false;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Form(
          key: gloablekey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Comman_TexxtFiled(
                controller: username,
                onChanged: (value) {
                  gloablekey.currentState!.validate();
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter UserName";
                  }
                },
                FocusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide.none,
                ),
                focouseborder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide.none,
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide.none,
                ),
                disableborder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide.none,
                ),
                hinttext: "UserName",
                fillcolor: Colors.grey.shade300,
                filled: true,
              ),
              SizedBox(
                height: 30,
              ),
              Comman_TexxtFiled(
                obscureText: true,
                controller: Passwordcontroler,
                onChanged: (value) {
                  gloablekey.currentState!.validate();
                },
                validator: (value) {
                  // final bool passwordValid = RegExp(
                  //         r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                  //     .hasMatch(value!);

                  if (value!.isEmpty) {
                    return "Required";
                  }
                },
                FocusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide.none,
                ),
                focouseborder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide.none,
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide.none,
                ),
                disableborder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide.none,
                ),
                hinttext: "Password",
                fillcolor: Colors.grey.shade300,
                filled: true,
              ),
              SizedBox(
                height: 30,
              ),
              isLoding == true
                  ? CupertinoActivityIndicator(
                      radius: 20,
                    )
                  : GestureDetector(
                      onTap: () async {
                        if (gloablekey.currentState!.validate()) {
                          LoginModel model = LoginModel();
                          model.username = username.text;
                          model.password = Passwordcontroler.text;
                          setState(() {
                            isLoding = true;
                          });
                          bool staus = await LoginService.LoginServiceWithModel(
                              model.toJson());

                          if (staus == true) {
                            SharedPreferences sh =
                                await SharedPreferences.getInstance();
                            sh
                                .setString("username", username.text)
                                .then((value) => Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Home_Page(),
                                      ),
                                    ));
                          } else {
                            setState(() {
                              isLoding = false;
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Invalid Username or Password!"),
                              ),
                            );
                          }
                        }
                      },
                      child: Comman_Container(
                        child: Center(
                          child: Comman_Text(
                            text: "Log_In",
                            fontsize: 20,
                            color: Colors.white,
                            fontweight: FontWeight.bold,
                          ),
                        ),
                        BorderRadius: BorderRadius.circular(40),
                        height: height * 0.06,
                        width: width,
                        color: Color(0xffFC6011),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
