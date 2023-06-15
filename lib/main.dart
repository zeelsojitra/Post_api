import 'package:flutter/material.dart';
import 'package:post_api/view/delete_screen.dart';
import 'package:post_api/view/home_page.dart';
import 'package:post_api/view/login_screen.dart';
import 'package:post_api/view/sign_up.dart';
import 'package:post_api/view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Splash_Screen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
