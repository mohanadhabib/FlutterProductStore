// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:login_app/pages/register_page.dart';
import 'package:login_app/style/colors.dart';
import 'package:login_app/widget/button_widget.dart';
import 'package:login_app/widget/text_field_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../infrastructure/controllers.dart';
import '../infrastructure/firebase.dart';

class LoginPage extends StatefulWidget {
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isChecked = false;
  String? e, pass;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.textfieldBlue,
      body: SingleChildScrollView(
        child: Form(
          child: SafeArea(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 40),
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                            color: MyColors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, left: 5),
                  child: Text(
                    "Email",
                    style: TextStyle(
                      color: MyColors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: MyTextField(
                      inputType: TextInputType.emailAddress,
                      icon: Icons.email,
                      hintText: " Enter Your Email ",
                      controller: Controller.email),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 45, left: 5),
                  child: Text(
                    "Password",
                    style: TextStyle(
                      color: MyColors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: MyTextField(
                      inputType: TextInputType.visiblePassword,
                      obsecure: true,
                      icon: Icons.lock,
                      hintText: " Enter Your Password ",
                      controller: Controller.password),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forget Password?",
                        style: TextStyle(color: MyColors.white),
                      )),
                ]),
                Row(
                  children: [
                    Checkbox(
                        fillColor: MaterialStateProperty.all(MyColors.white),
                        checkColor: MyColors.textfieldBlue,
                        value: isChecked,
                        onChanged: (Checked) {
                          setState(() {
                            isChecked = !isChecked;
                          });
                        }),
                    Text(
                      "Remember me",
                      style: TextStyle(color: MyColors.white),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: MyButton(
                      text: 'LOGIN',
                      onPressed: () async {
                        await Firebase().loginFirebaseAuth(context);
                        Controller.email.clear();
                        Controller.password.clear();
                      }),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "OR",
                        style: TextStyle(color: MyColors.white),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Sign in with",
                        style: TextStyle(
                            color: MyColors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 28),
                        child: MaterialButton(
                          elevation: 5,
                          splashColor: MyColors.backgroundBlue,
                          onPressed: () {},
                          color: MyColors.white,
                          minWidth: 60,
                          height: 60,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          child: Icon(FontAwesomeIcons.facebookF,
                              color: MyColors.textfieldBlue),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 28),
                        child: MaterialButton(
                          elevation: 5,
                          splashColor: MyColors.backgroundBlue,
                          onPressed: () {},
                          color: MyColors.white,
                          minWidth: 60,
                          height: 60,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          child: Icon(FontAwesomeIcons.google,
                              color: MyColors.textfieldBlue),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an Account?",
                        style: TextStyle(color: MyColors.white, fontSize: 17),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterPage()));
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                color: MyColors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          ))
                    ],
                  ),
                )
              ],
            ),
          )),
        ),
      ),
    );
  }
}
