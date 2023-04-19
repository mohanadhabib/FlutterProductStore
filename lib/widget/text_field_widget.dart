// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:login_app/style/colors.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final IconData? icon;
  final TextEditingController controller;
  final TextInputType inputType;
  bool obsecure = false;
  MyTextField(
      {required this.inputType,
      required this.icon,
      required this.hintText,
      required this.controller,
      this.obsecure: false});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      color: MyColors.textfieldBlue,
      child: Padding(
        padding: const EdgeInsets.only(left: 8, top: 5, bottom: 5),
        child: TextFormField(
          keyboardType: inputType,
          obscureText: obsecure,
          controller: controller,
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(color: MyColors.textfieldHintBlue),
              fillColor: MyColors.textfieldHintBlue,
              icon: Icon(icon, color: MyColors.white),
              border: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none)),
        ),
      ),
    );
  }
}
