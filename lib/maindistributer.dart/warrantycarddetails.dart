import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vinayakply/maindistributer.dart/distbuterapi.dart';
import 'package:vinayakply/maindistributer.dart/distributerHome.dart';

class WarrancycardDetails extends StatefulWidget {
  const WarrancycardDetails({super.key});

  @override
  State<WarrancycardDetails> createState() => _WarrancycardDetailsState();
}

class _WarrancycardDetailsState extends State<WarrancycardDetails> {
  Map warranty_dit = {};
  Map warranty_ditels = {};
  @override
  void initState() {
    // TODO: implement initState
    getAllwarantycardsDET();
    super.initState();
  }

  getAllwarantycardsDET() async {
    try {
      DistubuterApi distubuterApi = DistubuterApi();
      List data = await distubuterApi.getAllwarantycarddetails(warantycard_no);
      setState(() {
        warranty_ditels = data[0];
      });
      log("dfgdj$warranty_ditels");
    } catch (e) {
      print(e);
    }
  }

  downloadCard(productId, qty, prodPrice) async {
    try {
      DistubuterApi distubuterApi = DistubuterApi();
      List data = await distubuterApi.getSavetoCard(
          prod_price: prodPrice,
          qty: qty,
          product_id: productId,
          request: "minus/editQty/null");
      setState(() {
        // warranty_ditels = data[0];
      });
      log("dfgdj$data");
    } catch (e) {
      print(e);
    }
  }

  void _launchphone(String urlphone) async {
    if (!await launch(
      urlphone,
    )) throw 'Could not launch $urlphone';
  }

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as Map;

    warranty_dit = arg['warranty_dit'];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          "Warranty Card Details",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
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
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    child: const Text(
                                      "Card No.",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    child: Text(
                                      "${warranty_dit['warranty_number']}",
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            // Text(
                            //   "${warranty_dit['cardlink']}",
                            //   style: const TextStyle(color: Colors.black),
                            // ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    child: const Text(
                                      "Issue Data",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    child: Text(
                                      "${warranty_dit['issue_date']}",
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    child: const Text(
                                      "Customer Name",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    child: Text(
                                      "${warranty_dit['name']}",
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    child: const Text(
                                      "Mobile No.",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    child: Text(
                                      "${warranty_dit['mobile_no']}",
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    child: const Text(
                                      "Address",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    child: Text(
                                      "${warranty_dit['full_address']}",
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ]))),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    _launchphone(warranty_dit['cardlink'].toString());
                    // downloadCard();
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10)),
                    height: 40,
                    // width: 60,
                    child: const Center(
                      child: Text(
                        "View & Download",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                // Container(
                //   decoration: BoxDecoration(
                //       color: Colors.black,
                //       borderRadius: BorderRadius.circular(10)),
                //   height: 40,
                //   width: 100,
                //   child: const Center(
                //     child: Text(
                //       "Download",
                //       style: TextStyle(
                //           fontSize: 14,
                //           fontWeight: FontWeight.bold,
                //           color: Colors.white),
                //     ),
                //   ),
                // ),
                // const SizedBox(
                //   width: 20,
                // )
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                "View",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 5,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              "${warranty_ditels['prodcut_name']}",
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            "${warranty_ditels['my_qr']}",
                            style: const TextStyle(
                                fontSize: 10, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "${warranty_ditels['expiry']}",
                            style: const TextStyle(
                                fontSize: 10, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            ),
          ]),
    );
  }
}
