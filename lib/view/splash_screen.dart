import 'dart:async';

import 'package:flutter/material.dart';
import 'package:post_api/view/home_page.dart';
import 'package:post_api/view/sign_up.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../Comman_widget/Comman_text.dart';
import 'login_screen.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({Key? key}) : super(key: key);

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  String? username;

  Future getusername() async {
    SharedPreferences sh = await SharedPreferences.getInstance();
    final name = sh.getString("username");
    setState(() {
      username = name;
    });
  }

  @override
  void initState() {
    getusername().whenComplete(
      () => Timer(
        Duration(seconds: 2),
        () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    username == null ? Sign_Up_screen() : Home_Page(),
              ));
        },
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Comman_Text(
              text: "Splash_Screen",
              color: Colors.black,
              fontsize: 30,
              fontweight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Center(
              child: CircularProgressIndicator(
            color: Colors.red,
            strokeWidth: 5,
          )),
        ],
      ),
    );
  }
}
