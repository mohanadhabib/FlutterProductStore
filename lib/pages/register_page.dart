// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login_app/style/colors.dart';
import 'package:login_app/widget/text_field_widget.dart';
import '../infrastructure/controllers.dart';
import '../infrastructure/firebase.dart';
import '../widget/button_widget.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.textfieldBlue,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 40),
                    child: Text(
                      "Sign Up",
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
                padding: EdgeInsets.only(top: 20, left: 5),
                child: Text(
                  "Phone",
                  style: TextStyle(
                    color: MyColors.white,
                    fontSize: 15,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: MyTextField(
                    inputType: TextInputType.phone,
                    icon: Icons.phone,
                    hintText: " Enter Your Phone ",
                    controller: Controller.phone),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, left: 5),
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
              Padding(
                padding: EdgeInsets.only(top: 20, left: 5),
                child: Text(
                  "Confirm Password",
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
                    hintText: " Enter Your Password Confirm ",
                    controller: Controller.passwordConfirm),
              ),
              Padding(
                padding: EdgeInsets.only(top: 50),
                child: MyButton(
                    text: 'REGISTER',
                    onPressed: () async {
                      await Firebase().registerFirebaseAuth();
                      await Firebase().firebaseStore();
                      Fluttertoast.showToast(
                        msg: "Register Successful",
                        backgroundColor: MyColors.backgroundBlue,
                        textColor: MyColors.white,
                        gravity: ToastGravity.BOTTOM,
                      );
                      Controller.email.clear();
                      Controller.password.clear();
                      Controller.passwordConfirm.clear();
                      Controller.phone.clear();
                    }),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
