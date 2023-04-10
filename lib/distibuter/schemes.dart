import 'package:flutter/material.dart';
import 'package:vinayakply/routes.dart';

class Schemes extends StatefulWidget {
  Schemes({Key? key, this.ispage = false}) : super(key: key);
  bool? ispage;
  @override
  State<Schemes> createState() => _SchemesState();
}

class _SchemesState extends State<Schemes> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: widget.ispage == true
              ? InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.arrow_back))
              : Container(),
          backgroundColor: Colors.red,
          title: const Text(
            "Schemes",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: 5,
                  physics: const PageScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Wrap(
                      direction: Axis.vertical,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Card(
                            elevation: 10,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                            child: Row(children: [
                              GestureDetector(
                                child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.30,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        border: const Border.fromBorderSide(
                                            BorderSide(
                                                width: 1.0,
                                                color: Colors.black12))),
                                    child: Image.asset(
                                      "assets/ply1.png",
                                      height: 130,
                                      width: 86,
                                    )),
                                onTap: () {},
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.66,
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "Vinayak Plywood",
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.black),
                                      ),
                                      const Text(
                                        "Schem Launched on 2022-09-10",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.black54),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text(
                                        "Buy any Vinayak Products and scan to get rewards points,Buy any Vinayak Products and scan to get rewards points",
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.black45),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            height: 40,
                                            width: 122,
                                            child: OutlinedButton(
                                              onPressed: () {
                                                Navigator.pushNamed(context,
                                                    My_Routes.dealerRewards);
                                              },
                                              child: const Text(
                                                'Scheme Points 125 points',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12),
                                              ),
                                            ),
                                          ),
                                          TextButton(
                                              onPressed: () {},
                                              child: Column(
                                                children: const [
                                                  Text(
                                                    'Offer ends',
                                                    style: TextStyle(
                                                        color: Colors.red,
                                                        fontSize: 12),
                                                  ),
                                                  Text(
                                                    '2023-02-08',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 12),
                                                  ),
                                                ],
                                              ))
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ]),
                          ),
                        ),
                      ],
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
