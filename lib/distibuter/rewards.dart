import 'dart:developer';

import 'package:flutter/material.dart';

import '../api/registerapi.dart';

class Rewards extends StatefulWidget {
  const Rewards({Key? key}) : super(key: key);

  @override
  State<Rewards> createState() => _RewardsState();
}

class _RewardsState extends State<Rewards> {
  List rewordPoin = [];

  getStateID() async {
    try {
      RegisterApi registerApi = RegisterApi();
      List data = await registerApi.rewordPoints();
      setState(() {
        rewordPoin = data;
      });

      log("dfgdj$rewordPoin");
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    getStateID();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rewords"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
                children: List.generate(
                    rewordPoin.length,
                    (index) => Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(children: [
                              Image.network(
                                "https://knowledgeitservices.in/vinayakply/scheamimage/${rewordPoin[index]['picture'].toString()}",
                                height: 100,
                                width: 100,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(rewordPoin[index]['prize_name']
                                          .toString()),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Image.asset(
                                        "assets/WhatsApp Image 2023-03-26 at 14.37.19.jpeg",
                                        height: 40,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2,
                                      ),
                                      Text(
                                          "${rewordPoin[index]['points'].toString()} points Completed"),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                    ]),
                              )
                            ]),
                          ),
                        ))),
          ),
        ],
      ),
    );
  }
}
