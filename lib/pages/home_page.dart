import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login_app/infrastructure/controllers.dart';
import 'package:login_app/infrastructure/firebase.dart';
import 'package:login_app/style/colors.dart';
import 'package:login_app/widget/text_field_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ImagePicker picker = ImagePicker();
  File? file;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.textfieldBlue,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 7),
                      child: MaterialButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: ((context) => AlertDialog(
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              setState(() {
                                                file = null;
                                                Controller.image = null;
                                                Controller.productName.clear();
                                                Controller.productPrice.clear();
                                                Controller.productStock.clear();
                                              });
                                            },
                                            child: Text("Remove",
                                                style: TextStyle(
                                                    color:
                                                        MyColors.textfieldBlue,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold))),
                                        TextButton(
                                            onPressed: () async {
                                              setState(() async {
                                                await Firebase().productStore();
                                                file = null;
                                                Controller.image = null;
                                                Controller.productName.clear();
                                                Controller.productPrice.clear();
                                                Controller.productStock.clear();
                                                Navigator.pop(context);
                                              });
                                            },
                                            child: Text("Add",
                                                style: TextStyle(
                                                    color:
                                                        MyColors.textfieldBlue,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold)))
                                      ],
                                      backgroundColor:
                                          MyColors.textfieldHintBlue,
                                      elevation: 5,
                                      content: StatefulBuilder(
                                        builder: (context, setState) =>
                                            Container(
                                          width: 500,
                                          height: 400,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              MaterialButton(
                                                onPressed: () async {
                                                  Controller.image =
                                                      await picker.pickImage(
                                                          source: ImageSource
                                                              .gallery);
                                                  file = File(
                                                      Controller.image!.path);
                                                  setState(() {});
                                                },
                                                height: 100,
                                                minWidth: 100,
                                                color: MyColors.textfieldBlue,
                                                child: Controller.image == null
                                                    ? Icon(Icons.image,
                                                        color: MyColors
                                                            .textfieldHintBlue)
                                                    : CircleAvatar(
                                                        backgroundImage:
                                                            FileImage(file!),
                                                        radius: 40,
                                                      ),
                                                splashColor:
                                                    MyColors.textfieldHintBlue,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                              ),
                                              Column(
                                                children: [
                                                  Padding(
                                                      padding: EdgeInsets
                                                          .symmetric(
                                                              vertical: 10),
                                                      child: MyTextField(
                                                          inputType:
                                                              TextInputType
                                                                  .text,
                                                          icon: null,
                                                          hintText:
                                                              "Enter Product Name",
                                                          controller: Controller
                                                              .productName)),
                                                  Padding(
                                                      padding: EdgeInsets
                                                          .symmetric(
                                                              vertical: 10),
                                                      child: MyTextField(
                                                          inputType:
                                                              TextInputType
                                                                  .text,
                                                          icon: null,
                                                          hintText:
                                                              "Enter Product Price",
                                                          controller: Controller
                                                              .productPrice)),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 10),
                                                    child: MyTextField(
                                                        inputType:
                                                            TextInputType.text,
                                                        icon: null,
                                                        hintText:
                                                            "Enter Product Stock",
                                                        controller: Controller
                                                            .productStock),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(40)))));
                        },
                        elevation: 5,
                        height: 55,
                        minWidth: 50,
                        color: MyColors.backgroundBlue,
                        child: Icon(Icons.add, color: MyColors.white),
                        splashColor: MyColors.textfieldHintBlue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 7),
                      child: MaterialButton(
                        onPressed: () {
                          setState(() {});
                        },
                        elevation: 5,
                        height: 55,
                        minWidth: 50,
                        color: MyColors.backgroundBlue,
                        child: Icon(Icons.refresh, color: MyColors.white),
                        splashColor: MyColors.textfieldHintBlue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                        padding: EdgeInsets.all(10),
                        child:
                            FutureBuilder<QuerySnapshot<Map<String, dynamic>>?>(
                          future: Firebase().getProductStore(),
                          builder: (context, snapshot) => snapshot
                                      .connectionState ==
                                  ConnectionState.waiting
                              ? Center(
                                  child: Text("No Items Found",
                                      style: TextStyle(
                                          color: MyColors.backgroundBlue,
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold)),
                                )
                              : Container(
                                  width: double.infinity,
                                  height:
                                      MediaQuery.of(context).size.height * 0.85,
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: snapshot.data!.docs.length,
                                      scrollDirection: Axis.vertical,
                                      itemBuilder: (context, index) => Card(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 10),
                                            color: MyColors.backgroundBlue,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            elevation: 4,
                                            child: Column(
                                              children: [
                                                Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left: 30),
                                                        child: Image(
                                                            image: FileImage(
                                                                File(snapshot
                                                                        .data!
                                                                        .docs[index]
                                                                    ["image"])),
                                                            width: 120,
                                                            height: 120),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 30),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Text(
                                                              "Name : " +
                                                                  snapshot.data!
                                                                              .docs[
                                                                          index]
                                                                      ["name"],
                                                              style: TextStyle(
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: MyColors
                                                                      .white),
                                                            ),
                                                            Text(
                                                              "Price : " +
                                                                  snapshot.data!
                                                                              .docs[
                                                                          index]
                                                                      ["price"],
                                                              style: TextStyle(
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: MyColors
                                                                      .white),
                                                            ),
                                                            Text(
                                                              "Stock : " +
                                                                  snapshot.data!
                                                                              .docs[
                                                                          index]
                                                                      ["stock"],
                                                              style: TextStyle(
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: MyColors
                                                                      .white),
                                                            )
                                                          ],
                                                        ),
                                                      )
                                                    ]),
                                                Center(
                                                    child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 10),
                                                  child: MaterialButton(
                                                    onPressed: () {
                                                      Firebase().deleteProduct(
                                                          snapshot.data!
                                                              .docs[index].id);
                                                      setState(() {});
                                                    },
                                                    child: Text("Delete"),
                                                    elevation: 10,
                                                    color: MyColors
                                                        .textfieldHintBlue,
                                                    minWidth: 40,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20)),
                                                  ),
                                                ))
                                              ],
                                            ),
                                          )),
                                ),
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
