import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../maindistributer.dart/distbuterapi.dart';

class EarnPoint extends StatefulWidget {
  const EarnPoint({super.key});

  @override
  State<EarnPoint> createState() => _EarnPointState();
}

class _EarnPointState extends State<EarnPoint> {
  List pointlist = [];

  getProductList() async {
    log("dsvdhjsvhjsdhjvhjs");
    try {
      DistubuterApi distubuterApi = DistubuterApi();
      List data = await distubuterApi.getpoin();

      setState(() {
        pointlist = data;
      });

      log("dfgdj$pointlist");
    } catch (e) {
      print(e);
    }
  }

  fun() {
    for (var element in pointlist) {
      if (element['transaction_type']) {
        log(element['transaction_type']);
      }
    }
  }

  @override
  void initState() {
    getProductList();
    Future.delayed(const Duration(seconds: 1));
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          "Earn Points",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          // const Padding(
          //   padding: EdgeInsets.all(8.0),
          //   child: Center(
          //     child: Text(
          //       "Earn 0 Points",
          //       style: TextStyle(fontSize: 20),
          //     ),
          //   ),
          // ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                  children: List.generate(
                pointlist.length,
                (index) => Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                pointlist[index]['product_name'].toString(),
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12),
                              ),
                              Text(
                                "${pointlist[index]['point'].toString()}points",
                                style: const TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                pointlist[index]['brand_name'].toString(),
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                              Text(
                                DateFormat('dd-MM-yyyy')
                                    .format(DateTime.parse(
                                        pointlist[index]['transaction_date']))
                                    .toString(),
                                style: const TextStyle(
                                    color: Colors.black,
                                    // fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              pointlist[index]['barcode'].toString(),
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                            // Text(
                            //   'Add More',
                            //   style: TextStyle(
                            //       color: Colors.green,
                            //       // fontWeight: FontWeight.bold,
                            //       fontSize: 10),
                            // ),
                          ],
                        )
                      ]),
                    ),
                  ),
                ),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
