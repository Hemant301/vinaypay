import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vinayakply/maindistributer.dart/distbuterapi.dart';

import '../util/shearfunctions.dart';

class MyCardPage extends StatefulWidget {
  const MyCardPage({super.key});

  @override
  State<MyCardPage> createState() => _MyCardPageState();
}

class _MyCardPageState extends State<MyCardPage> {
  TextEditingController itemController = TextEditingController();
  List cardList = [];
  getCard() async {
    try {
      DistubuterApi distubuterApi = DistubuterApi();
      Map data = await distubuterApi.getcrdproduct();
      if (data['status'].toString() == "1") {
        setState(() {
          cardList = data['data'];
        });
      }

      log("dfgdj$cardList");
    } catch (e) {
      print(e);
    }
  }

  getCardinit() async {
    try {
      DistubuterApi distubuterApi = DistubuterApi();
      Map data = await distubuterApi.getcrdproduct();

      setState(() {
        cardList = data['data'];
      });

      log("dfgdj$cardList");
    } catch (e) {
      print(e);
    }
  }

  bool loading = false;
  @override
  void initState() {
    // getCardinit();
    // TODO: implement initState
    super.initState();
  }

  TextEditingController qunt = TextEditingController();
  File? profileImage;
  String base64Image = "";
  @override
  Widget build(BuildContext context) {
    getCard();
    return Scaffold(
        body: Column(
      children: [
        cardList.isEmpty
            ? const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text("no data found"),
              )
            : Column(
                children: List.generate(
                    cardList.length,
                    (index) => Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Card(
                            elevation: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                3,
                                        child: Image.asset(
                                          "assets/ply1.png",
                                          height: 100,
                                          width: 100,
                                        )),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2,
                                          child: Text(
                                            "${cardList[index]['prod_name']}",
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        const Text(
                                          "Product",
                                          style: TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        InkWell(
                                          onTap: () async {
                                            DistubuterApi distubuterApi =
                                                DistubuterApi();
                                            try {
                                              Map data = await distubuterApi
                                                  .removeCard(
                                                      cartid: cardList[index]
                                                              ['cartid']
                                                          .toString());
                                              print(data["status"].runtimeType);

                                              if (data["success"].toString() ==
                                                  "1") {
                                                Navigator.pop(context);

                                                setState(() {
                                                  getCard();
                                                  loading = false;
                                                });
                                                Fluttertoast.showToast(
                                                    msg:
                                                        " ${data['response']}! ",
                                                    toastLength:
                                                        Toast.LENGTH_SHORT,
                                                    gravity:
                                                        ToastGravity.BOTTOM,
                                                    timeInSecForIosWeb: 1,
                                                    backgroundColor: Colors.red,
                                                    textColor: Colors.white,
                                                    fontSize: 16.0);
                                                setState(() {
                                                  loading = false;
                                                });
                                              } else {
                                                setState(() {
                                                  loading = false;
                                                });
                                                Fluttertoast.showToast(
                                                    msg:
                                                        " ${data['response']}! ",
                                                    toastLength:
                                                        Toast.LENGTH_SHORT,
                                                    gravity:
                                                        ToastGravity.BOTTOM,
                                                    timeInSecForIosWeb: 1,
                                                    backgroundColor: Colors.red,
                                                    textColor: Colors.white,
                                                    fontSize: 16.0);
                                                setState(() {
                                                  loading = false;
                                                });
                                              }
                                            } catch (e) {}
                                            // Navigator.pushReplacementNamed(context, '/main');
                                          },
                                          child: const Text(
                                            "Remove",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.red,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            InkWell(
                                              onTap: () async {
                                                DistubuterApi distubuterApi =
                                                    DistubuterApi();
                                                try {
                                                  Map data = await distubuterApi
                                                      .getSavetoCard(
                                                          prod_price: "0",
                                                          qty: "1",
                                                          request: "",
                                                          product_id:
                                                              cardList[index]
                                                                  ['prod_id']);
                                                  print(data["status"]
                                                      .runtimeType);

                                                  if (data["success"]
                                                          .toString() ==
                                                      "1") {
                                                    // Navigator.pop(context);

                                                    setState(() {
                                                      getCard();
                                                      loading = false;
                                                    });
                                                    Fluttertoast.showToast(
                                                        msg:
                                                            " ${data['response']}! ",
                                                        toastLength:
                                                            Toast.LENGTH_SHORT,
                                                        gravity:
                                                            ToastGravity.BOTTOM,
                                                        timeInSecForIosWeb: 1,
                                                        backgroundColor:
                                                            Colors.red,
                                                        textColor: Colors.white,
                                                        fontSize: 16.0);
                                                    setState(() {
                                                      loading = false;
                                                    });
                                                  } else {
                                                    setState(() {
                                                      loading = false;
                                                    });
                                                    Fluttertoast.showToast(
                                                        msg:
                                                            " ${data['response']}! ",
                                                        toastLength:
                                                            Toast.LENGTH_SHORT,
                                                        gravity:
                                                            ToastGravity.BOTTOM,
                                                        timeInSecForIosWeb: 1,
                                                        backgroundColor:
                                                            Colors.red,
                                                        textColor: Colors.white,
                                                        fontSize: 16.0);
                                                    setState(() {
                                                      loading = false;
                                                    });
                                                  }
                                                } catch (e) {}
                                                // Navigator.pushReplacementNamed(context, '/main');
                                              },
                                              child: Container(
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.black,
                                                ),
                                                child: const Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: Text(
                                                    "+",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            // TextField(
                                            //   decoration: InputDecoration(
                                            //       hintText: cardList[index]
                                            //               ['qty']
                                            //           .toString()),
                                            // ),
                                            SizedBox(
                                              height: 50,
                                              width: 100,
                                              child: Center(
                                                  child: TextField(
                                                    
                                                controller: qunt,
                                              )

                                                  //  Text(
                                                  //   "${cardList[index]['qty']}",
                                                  //   style: const TextStyle(
                                                  //       fontSize: 14,
                                                  //       fontWeight:
                                                  //           FontWeight.bold,
                                                  //       color: Colors.black),
                                                  // ),
                                                  ),
                                            ),
                                            InkWell(
                                              onTap: () async {
                                                DistubuterApi distubuterApi =
                                                    DistubuterApi();
                                                try {
                                                  Map data = await distubuterApi
                                                      .getSavetoCard(
                                                          prod_price: "0",
                                                          qty: "1",
                                                          request: "minus",
                                                          product_id:
                                                              cardList[index]
                                                                  ['prod_id']);
                                                  print(data["status"]
                                                      .runtimeType);

                                                  if (data["success"]
                                                          .toString() ==
                                                      "1") {
                                                    Navigator.pop(context);

                                                    setState(() {
                                                      loading = false;
                                                    });
                                                    Fluttertoast.showToast(
                                                        msg:
                                                            " ${data['response']}! ",
                                                        toastLength:
                                                            Toast.LENGTH_SHORT,
                                                        gravity:
                                                            ToastGravity.BOTTOM,
                                                        timeInSecForIosWeb: 1,
                                                        backgroundColor:
                                                            Colors.red,
                                                        textColor: Colors.white,
                                                        fontSize: 16.0);
                                                    setState(() {
                                                      loading = false;
                                                    });
                                                  } else {
                                                    setState(() {
                                                      loading = false;
                                                    });
                                                    Fluttertoast.showToast(
                                                        msg:
                                                            " ${data['response']}! ",
                                                        toastLength:
                                                            Toast.LENGTH_SHORT,
                                                        gravity:
                                                            ToastGravity.BOTTOM,
                                                        timeInSecForIosWeb: 1,
                                                        backgroundColor:
                                                            Colors.red,
                                                        textColor: Colors.white,
                                                        fontSize: 16.0);
                                                    setState(() {
                                                      loading = false;
                                                    });
                                                  }
                                                } catch (e) {}
                                                // Navigator.pushReplacementNamed(context, '/main');
                                              },
                                              child: Container(
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.black,
                                                ),
                                                child: const Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: Text(
                                                    "-",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ]),
                            ),
                          ),
                        )),
              ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: const Text(
              "Upload Order Confirmation Picture",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              InkWell(
                onTap: () async {
                  try {
                    FilePickerResult? result =
                        await FilePicker.platform.pickFiles();
                    if (result != null) {
                      File file = File(result.files.single.path!);
                      print(file.path);
                      setState(() {
                        profileImage = file;
                        List<int> imageBytes = profileImage!.readAsBytesSync();
                        print(imageBytes);
                        base64Image = base64Encode(imageBytes);
                      });
                      // showProgressDialog(context);
                      DistubuterApi distubuterApi = DistubuterApi();
                      Map data =
                          await distubuterApi.getProductUplad(base64Image);
                      print(data);
                      if (data['statusstatus'] == 1) {
                        positiveToast(data['response']);
                        setState(() {});

                        // homebloc.fetchuserDetails();
                      } else {
                        negetiveToast(data['response']);
                      }
                      Navigator.pop(context);
                    } else {
                      negetiveToast("Something went wrong");
                      // User canceled the picker
                    }
                  } catch (e) {
                    negetiveToast(e.toString());
                  }
                },
                child: Container(
                  width: 200,
                  height: 30,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5)),
                  child: const Center(
                    child: Text(
                      "Upload Order Picture",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        InkWell(
          child: Container(
            width: MediaQuery.of(context).size.width - 60,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(5)),
            child: const Center(
              child: Text(
                "Place your Order",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
