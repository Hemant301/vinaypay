import 'package:flutter/material.dart';
import 'package:vinayakply/maindistributer.dart/distributerHome.dart';

import '../routes.dart';

class WarratyPage extends StatefulWidget {
  const WarratyPage({super.key});

  @override
  State<WarratyPage> createState() => _WarratyPageState();
}

class _WarratyPageState extends State<WarratyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          "Warranty Card",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
            children: List.generate(
          warantycardData.length,
          (index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: (() {
                setState(() {
                  warantycard_no =
                      warantycardData[index]['warranty_number'].toString();
                });
                Navigator.pushNamed(context, My_Routes.warrantycarddetails,
                    arguments: {"warranty_dit": warantycardData[index]});
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
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Warranty Cards No.",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "${warantycardData[index]['warranty_number']}",
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    "assets/logo2.png",
                                    height: 60,
                                    width:
                                        MediaQuery.of(context).size.width / 2.8,
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
        )),
      ),
    );
  }
}
