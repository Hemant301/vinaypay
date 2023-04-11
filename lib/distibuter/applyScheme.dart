import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vinayakply/api/registerapi.dart';

class ApplyScheme extends StatefulWidget {
  const ApplyScheme({super.key, required this.data});
  final Map data;
  @override
  State<ApplyScheme> createState() => _ApplySchemeState();
}

class _ApplySchemeState extends State<ApplyScheme> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 223, 223, 223),
      appBar: AppBar(
        title: Text("Apply scheme"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Card(
                elevation: 5,
                child: Container(
                  color: Colors.white,
                  // width: MediaQuery.of(context).size.width / 1.2,
                  child: Center(
                    child: Image.network(
                        "https://knowledgeitservices.in/vinayakply/scheamimage/${widget.data['picture']}"),
                  ),
                ),
              ),
            ),
            Text(
              widget.data['prize_name'],
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Card(
                child: Container(
                  padding: EdgeInsets.all(12),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Scheme Points : ${widget.data['points']}",
                        style: TextStyle(fontSize: 16, color: Colors.red),
                      ),
                      Divider(),
                      Text(
                        "Expired on : ${widget.data['offer_end_date']}",
                        style: TextStyle(fontSize: 16, color: Colors.blue),
                      ),
                      Divider(),
                      Text(
                        "Terms & Condition",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Html(data: "${widget.data['offer_apply_rules']}")
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: InkWell(
        onTap: () async {
          Map data = await registerApi.applyonScheme(
              widget.data['offerid'], widget.data['points']);
          log(data.toString());
          if (data['successCode'].toString() == "1") {
          } else {
            Fluttertoast.showToast(msg: data['message']);
            return;
          }
        },
        child: Container(
          width: MediaQuery.of(context).size.width - 50,
          height: 45,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.blue),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Center(
              child: Text(
                "APPLY NOW",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 16),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
