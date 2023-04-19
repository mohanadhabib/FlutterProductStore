import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login_app/pages/home_page.dart';
import '../style/colors.dart';
import 'controllers.dart';

class Firebase {
  Future<void> registerFirebaseAuth() async {
    UserCredential auth = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: Controller.email.text, password: Controller.password.text);
  }

  Future<void> loginFirebaseAuth(BuildContext context) async {
    try {
      UserCredential auth = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: Controller.email.text, password: Controller.password.text);
      Fluttertoast.showToast(
          msg: "Login Successful",
          backgroundColor: MyColors.backgroundBlue,
          textColor: MyColors.white,
          gravity: ToastGravity.BOTTOM,
          toastLength: Toast.LENGTH_SHORT);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
        msg: e.code.toString().toUpperCase(),
        backgroundColor: MyColors.backgroundBlue,
        textColor: MyColors.white,
        gravity: ToastGravity.BOTTOM,
      );
    }
  }

  Future<void> firebaseStore() async {
    var store = await FirebaseFirestore.instance;
    await store
        .collection("Users")
        .add({"email": Controller.email.text, "phone": Controller.phone.text});
  }

  Future<void> productStore() async {
    var product = await FirebaseFirestore.instance;
    await product.collection("Products").doc().set({
      "image": Controller.image!.path,
      "name": Controller.productName.text,
      "price": Controller.productPrice.text,
      "stock": Controller.productStock.text,
    });
  }

  Future<QuerySnapshot<Map<String, dynamic>>?>? getProductStore() async {
    var product = await FirebaseFirestore.instance;
    return product.collection("Products").get();
  }

  Future<void> deleteProduct(String id) async {
    var product = await FirebaseFirestore.instance;
    await product.collection("Products").doc(id).delete();
  }
}
