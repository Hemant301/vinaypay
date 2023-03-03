import 'package:flutter/material.dart';

class WarrantyCard extends StatefulWidget {
  const WarrantyCard({Key? key}) : super(key: key);

  @override
  State<WarrantyCard> createState() => _WarrantyCardState();
}

class _WarrantyCardState extends State<WarrantyCard> {
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 60,
            color: Colors.red,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.arrow_back_outlined,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Warranty Card',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ]),
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: 2,
              physics: const PageScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Wrap(
                  direction: Axis.vertical,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                          elevation: 10,
                          color: Colors.red,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(22.0)),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.66,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Color(0xFFc2e59c),
                                Color(0xFF64b3f4)
                              ]),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.6,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          "Warranty Card No.",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black),
                                        ),
                                        Text(
                                          "276434568888",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black54),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text('Bhagat Ji'),
                                        Text(
                                            'D-32,Main market uttrakhand pin-263135'),
                                      ],
                                    ),
                                  ),
                                  Image.asset("assets/logo2.png",
                                      height: 100,
                                      width: MediaQuery.of(context).size.width *
                                          0.3)
                                ],
                              ),
                            ),
                          )),
                    ),
                  ],
                );
              })
        ],
      ),
    ));
  }
}
