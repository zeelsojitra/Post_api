import 'package:flutter/material.dart';
import 'package:post_api/view/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text("Home_page"),
          ),
          IconButton(
            onPressed: () async {
              SharedPreferences sh = await SharedPreferences.getInstance();
              sh.remove("username").then(
                    (value) => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Login_Screen(),
                      ),
                    ),
                  );
            },
            icon: Icon(
              Icons.login,
              color: Colors.black,
              size: 40,
            ),
          ),
        ],
      ),
    );
  }
}
