import 'dart:developer';

import 'package:flutter/material.dart';

import '../api/interiorApi.dart';
import '../custom_color.dart';
import '../routes.dart';

class InteriorDashBord extends StatefulWidget {
  const InteriorDashBord({super.key});

  @override
  State<InteriorDashBord> createState() => _InteriorDashBordState();
}

class _InteriorDashBordState extends State<InteriorDashBord> {
  List dataList = [];
  getInquaryList() async {
    try {
      InteriorApi interiorApi = InteriorApi();
      List data = await interiorApi.getInquary();
      setState(() {
        dataList = data;
      });

      log("dfgdj$dataList");
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getInquaryList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(children: [
          Container(
            color: Custom_colors.skyblue,
            height: 80,
            width: MediaQuery.of(context).size.width,
            child: Image.asset("assets/logo2.png"),
          ),
          dataList.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: List.generate(
                          dataList.length,
                          (index) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                  elevation: 5,
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Column(children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            children: [
                                              const Text(
                                                "Enquiry",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text("#${dataList[index]['id']}")
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              const Text(
                                                "Test",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromARGB(
                                                        255, 102, 24, 186)),
                                              ),
                                              Text(
                                                  "${dataList[index]['projecttype']}")
                                            ],
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  3,
                                              child: const Text(
                                                "Name :",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                          Text(
                                              "${dataList[index]['meet_person']}"),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  3,
                                              child: const Text(
                                                "Mobile :",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                          Text("${dataList[index]['mobile']}"),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  3,
                                              child: const Text(
                                                "Email id :",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                          Text("${dataList[index]['email']}"),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  3,
                                              child: const Text(
                                                "Status :",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                          Text("${dataList[index]['status']}"),
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
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: InkWell(
          onTap: () {
            Navigator.pushNamed(context, My_Routes.interiorAddEnquiry);
          },
          child: Container(
            decoration: BoxDecoration(
                color: Custom_colors.skyblue,
                borderRadius: BorderRadius.circular(25)),
            height: 40,
            width: 150,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.person_add, color: Colors.white),
                  Text(
                    " ADD ENQUIRY",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
