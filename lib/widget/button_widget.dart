import 'package:flutter/material.dart';
import 'package:login_app/style/colors.dart';

class MyButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  MyButton({required this.text, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      MaterialButton(
          onPressed: onPressed,
          elevation: 10,
          splashColor: MyColors.textfieldBlue,
          minWidth: 300,
          height: 50,
          child: Text(text,
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
          color: MyColors.white,
          textColor: MyColors.greyBlue,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))
    ]);
  }
}
