import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:post_api/view/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Comman_widget/Comman_Container.dart';
import '../Comman_widget/Comman_TeextFiled.dart';
import '../Comman_widget/Comman_text.dart';
import '../api_service/signup_user_service.dart';
import '../model/signup_model.dart';
import 'package:dio/dio.dart' as dio;
import 'home_page.dart';

class Sign_Up_screen extends StatefulWidget {
  const Sign_Up_screen({Key? key}) : super(key: key);

  @override
  State<Sign_Up_screen> createState() => _Sign_Up_screenState();
}

class _Sign_Up_screenState extends State<Sign_Up_screen> {
  final gloablekey = GlobalKey<FormState>();
  final fristname = TextEditingController();
  final lastname = TextEditingController();
  final username = TextEditingController();
  final Passwordcontroler = TextEditingController();
  bool isloding = false;

  File? image;
  ImagePicker picker = ImagePicker();

  chooseImage() async {
    final file = await picker.pickImage(source: ImageSource.gallery);

    if (file != null) {
      setState(() {
        image = File(file.path);
      });
    }
  }

  Future uploadImage() async {
    dio.FormData formData = dio.FormData.fromMap(
        {"avatar": await dio.MultipartFile.fromFile(image!.path)});

    dio.Response response = await dio.Dio().post(
        "https://codelineinfotech.com/student_api/User/user_avatar_upload.php",
        data: formData);
    return response.data['url'];
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Form(
          key: gloablekey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 80,
                ),
                InkWell(
                  onTap: () {
                    chooseImage();
                  },
                  child: Container(
                      height: 170,
                      width: 170,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        shape: BoxShape.circle,
                      ),
                      child: ClipOval(
                        child: image == null
                            ? Icon(
                                Icons.camera,
                                size: 30,
                              )
                            : Image.file(
                                image!,
                                fit: BoxFit.cover,
                              ),
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                Comman_TexxtFiled(
                  controller: fristname,
                  onChanged: (value) {
                    gloablekey.currentState!.validate();
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter First Name";
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
                  hinttext: "First Name",
                  fillcolor: Colors.grey.shade300,
                  filled: true,
                ),
                SizedBox(
                  height: 30,
                ),
                Comman_TexxtFiled(
                  controller: lastname,
                  onChanged: (value) {
                    gloablekey.currentState!.validate();
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Last Name";
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
                  hinttext: "Last Name",
                  fillcolor: Colors.grey.shade300,
                  filled: true,
                ),
                SizedBox(
                  height: 30,
                ),
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
                isloding == true
                    ? CupertinoActivityIndicator(
                        radius: 20,
                      )
                    : GestureDetector(
                        onTap: () async {
                          if (gloablekey.currentState!.validate()) {
                            final imageurl = await uploadImage();

                            SignupModel model = SignupModel();
                            model.firstName = fristname.text;
                            model.lastName = lastname.text;
                            model.username = username.text;
                            model.password = Passwordcontroler.text;
                            model.avatar = "${imageurl}";

                            setState(() {
                              isloding = true;
                            });
                            bool status = await SignupService.SignUserwithModel(
                                model.toJson());

                            if (status == true) {
                              SharedPreferences sh =
                                  await SharedPreferences.getInstance();
                              sh
                                  .setString("username", username.text)
                                  .then((value) => Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Home_Page(),
                                      )));
                            }
                            else {
                              setState(() {
                                isloding = false;
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Username already exists!"),
                                ),
                              );
                            }
                          }
                        },
                        child: Comman_Container(
                          child: Center(
                            child: Comman_Text(
                              text: "Sign Up",
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
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Login_Screen(),
                          ));
                    },
                    child: Comman_Text(
                      color: Colors.black,
                      fontweight: FontWeight.bold,
                      text: "Login",
                      fontsize: 20,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
