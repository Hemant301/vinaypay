import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vinayakply/api/bloc/bloc.dart';
import 'package:vinayakply/maindistributer.dart/distbuterapi.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  TextEditingController searchController = TextEditingController();
  List productlist = [];
  @override
  void initState() {
    getProductList("");
    // TODO: implement initState
    super.initState();
  }

  bool loading = false;
  getProductList(String s) async {
    try {
      DistubuterApi distubuterApi = DistubuterApi();
      List data = await distubuterApi.getAllprduct(s);
      setState(() {
        productlist = data;
      });

      log("dfgdj$productlist");
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          "Product",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  width: MediaQuery.of(context).size.width / 1.5,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      controller: searchController,
                      onChanged: (value) {},
                      decoration: const InputDecoration(
                          counterText: "",
                          hintText: "Search",
                          hintStyle: TextStyle(fontSize: 12),
                          // prefixIcon: Icon(icon),
                          border: InputBorder.none),
                    ),
                  )),
              InkWell(
                onTap: (() {
                  productlist.clear();
                  setState(() {
                    getProductList(searchController.text);
                  });
                }),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10)),
                  height: 45,
                  width: 100,
                  child: const Center(
                    child: Text(
                      "Search",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        productlist.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : Expanded(
                flex: 1,
                child: SingleChildScrollView(
                  child: Column(
                    children: List.generate(
                        productlist.length,
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
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
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
                                                "${productlist[index]['product_name']}",
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            const Text(
                                              "Product",
                                              style: TextStyle(
                                                fontSize: 14,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
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
                                                          request: "",
                                                          product_id:
                                                              productlist[index]
                                                                  ['id']);
                                                  print(data["status"]
                                                      .runtimeType);

                                                  if (data["success"]
                                                          .toString() ==
                                                      "1") {
                                                    homeBloc.fetchSlider();
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
                                                    homeBloc.fetchSlider();
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
                                                decoration: BoxDecoration(
                                                    color: Colors.black,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                height: 35,
                                                width: 150,
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: const [
                                                      Icon(Icons.add_card,
                                                          color: Colors.white),
                                                      Text(
                                                        " ADD to Card",
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.white),
                                                      )
                                                    ]),
                                              ),
                                            ),
                                          ],
                                        )
                                      ]),
                                ),
                              ),
                            )),
                  ),
                ),
              )
      ]),
    );
  }
}
