import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Controller {
  static TextEditingController email = TextEditingController();
  static TextEditingController password = TextEditingController();
  static TextEditingController passwordConfirm = TextEditingController();
  static TextEditingController phone = TextEditingController();
  static TextEditingController productName = TextEditingController();
  static TextEditingController productPrice = TextEditingController();
  static TextEditingController productStock = TextEditingController();
  static XFile? image;
}
