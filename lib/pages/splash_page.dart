import 'dart:async';

import 'package:flutter/material.dart';
import 'package:login_app/pages/login_page.dart';
import 'package:login_app/style/colors.dart';

class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: ((context) => LoginPage())));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColors.textfieldBlue,
        body: Center(
            child: Text(
          "Welcome",
          style: TextStyle(
              color: MyColors.textfieldHintBlue,
              fontSize: 35,
              fontWeight: FontWeight.w900),
        )));
  }
}
