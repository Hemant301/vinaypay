import 'dart:developer';

import "package:flutter/material.dart";
import 'package:vinayakply/maindistributer.dart/distbuterapi.dart';
import 'package:vinayakply/maindistributer.dart/orderpage.dart';
import 'package:vinayakply/routes.dart';
import 'package:vinayakply/untitled%20folder/scanQr.dart';

import 'distributernavbar.dart';

List warantycardData = [];
String warantycard_no = "";
List orderList = [];

class DistributerHome extends StatefulWidget {
  const DistributerHome({super.key});

  @override
  State<DistributerHome> createState() => _DistributerHomeState();
}

class _DistributerHomeState extends State<DistributerHome> {
  getAllwarantycards() async {
    try {
      DistubuterApi distubuterApi = DistubuterApi();
      List data = await distubuterApi.getAllwarantycard();
      setState(() {
        warantycardData = data;
      });

      log("dfgdj$warantycardData");
    } catch (e) {
      print(e);
    }
  }

  getOrderList() async {
    try {
      DistubuterApi distubuterApi = DistubuterApi();
      List data = await distubuterApi.getAllOrder();
      setState(() {
        orderList = data;
      });

      log("dfgdj$orderList");
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getOrderList();
    getAllwarantycards();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final platform = Theme.of(context).platform;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const InkWell(
                // onTap: () {
                //   Navigator.of(context).push(MaterialPageRoute(
                //       builder: (context) => MypDF(
                //             title: "fdgfdgf",
                //             platform: platform,
                //           )));
                // },
                child: Text(
                  "My Order",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              const Divider(
                thickness: 2,
                color: Colors.black,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: orderList.isEmpty
                    ? const Center(child: CircularProgressIndicator())
                    : Row(
                        children: List.generate(
                        orderList.length,
                        (index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                order_id = orderList[index]['order_id'] ?? "";
                              });
                              Navigator.pushNamed(
                                  context, My_Routes.orderdetails,
                                  arguments: {"order": orderList[index]});
                            },
                            child: Card(
                              elevation: 5,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "#${orderList[index]['order_id']}",
                                          style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "${orderList[index]['datee']}",
                                          style: const TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "${orderList[index]['prod_qty']} item",
                                      style: const TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 30,
                                    decoration: const BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(5),
                                          bottomLeft: Radius.circular(5)),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        "Reject",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      )),
              ),
              InkWell(
                onTap: (() {
                  Navigator.pushNamed(context, My_Routes.orderpage);
                }),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text(
                        "View All",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DistributerNav(
                                  selectedIndex: 1,
                                )),
                      );
                    },
                    child: Card(
                      child: Center(
                        child: Container(
                          height: 100,
                          width: MediaQuery.of(context).size.width / 2.5,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.file_copy,
                                  size: 50,
                                  color: Colors.blue,
                                ),
                                Text(
                                  "Place Order",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ]),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Qr()),
                      );
                    },
                    child: Card(
                      child: Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width / 2.5,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.qr_code,
                                size: 50,
                                color: Colors.blue,
                              ),
                              Text(
                                "OR CODE",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ]),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Warranty Cards",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const Divider(
                thickness: 2,
                color: Colors.black,
              ),
              const SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    warantycardData.length,
                    (index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: (() {
                          setState(() {
                            warantycard_no = warantycardData[index]
                                    ['warranty_number']
                                .toString();
                          });
                          Navigator.pushNamed(
                              context, My_Routes.warrantycarddetails,
                              arguments: {
                                "warranty_dit": warantycardData[index]
                              });
                        }),
                        child: Container(
                            decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    Colors.orange,
                                    Colors.yellow,
                                    Colors.orange,
                                    Colors.orange,
                                  ],
                                ),
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                "Warranty Cards No.",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                "${warantycardData[index]['warranty_number']}",
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Image.asset(
                                              "assets/logo2.png",
                                              height: 60,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2.8,
                                            ),
                                          ),
                                        ]),
                                  ),
                                  Text(
                                    "${warantycardData[index]['name']},",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "${warantycardData[index]['full_address']},pincode: ${warantycardData[index]['pincode']}",
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  )
                                ],
                              ),
                            )),
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: (() {
                  Navigator.pushNamed(context, My_Routes.warranypage);
                }),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text(
                        "View All",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
