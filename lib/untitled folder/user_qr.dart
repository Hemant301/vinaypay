import 'dart:typed_data';

import 'package:flutter/material.dart';

class UserQr extends StatefulWidget {
  const UserQr({Key? key}) : super(key: key);
  @override
  State<UserQr> createState() => _UserQrState();
}

class _UserQrState extends State<UserQr> {
  final _openResult = 'Unknown';

  // ScreenshotController screenshotController = ScreenshotController();
  var result;
  // Future<dynamic> mapToCustomer() async {
  //   var client = http.Client();
  //   final body = {
  //     // "user_code": mapCode,
  //     "vendor_code": mapController.text,
  //   };
  //   log("body ++++///////======== $body");
  //   try {
  //     final response = await client.post(
  //         // Uri.parse("${AppConstants.BASE_URL}/api/v1/auth/uservendormap"),
  //         body: jsonEncode(body),
  //         headers: {
  //           "Content-Type": "application/json"
  //           // "Authorization": "Bearer ${userCred.getUserToken()}"
  //         });
  //     if (response.statusCode == 200) {
  //       log("Check ${response.body}");
  //       setState(() {
  //         result = jsonDecode(response.body) as Map;
  //       });
  //       return result;
  //     } else {
  //       log('Request skg failed with status checkMapping: ${response.statusCode}.');
  //       throw "Something went wrong";
  //     }
  //   } catch (e) {
  //     ////  print(e);
  //     throw "Something went wrong";
  //   } finally {
  //     client.close();
  //   }
  // }

  TextEditingController mapController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 238, 238, 238),
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),
            actions: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.notifications_outlined,
                  color: Colors.black,
                ),
              )
            ]),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                color: Theme.of(context).primaryColor,
                child: const Center(
                  child: Text(
                    'Scan QR to Connect with vendors',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              // Screenshot(
              //   controller: screenshotController,
              //   child: Container(
              //     padding: EdgeInsets.all(10),
              //     decoration: BoxDecoration(
              //         color: Colors.white,
              //         borderRadius: BorderRadius.circular(10)),
              //     child: Column(
              //       children: [
              //         Container(
              //             height: 250,
              //             width: 250,
              //             child: QrImage(
              //               data: mapCode,
              //               version: QrVersions.auto,
              //               size: 200.0,
              //             )),
              //         Text("$mapCode"),
              //       ],
              //     ),
              //   ),
              // ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  // Navigator.of(context)
                  //     .push(MaterialPageRoute(builder: (context) => const Qr()));
                },
                child: Container(
                    padding: const EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width - 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Theme.of(context).primaryColor,
                    ),
                    child: const Center(child: Text("Scan QR"))),
              ),
              const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text("or"),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                          height: 45,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context).primaryColor),
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10)),
                            color: Colors.white,
                          ),
                          child: TextFormField(
                            controller: mapController,
                            decoration: const InputDecoration(
                                hintText: "Enter Map Code",
                                border: InputBorder.none),
                          )),
                    ),
                    InkWell(
                      onTap: () async {
                        if (mapController.text == "") {
                          // showCustomSnackBar("Enter map code");
                          return;
                        }
                        // Map data = await mapToCustomer();
                        // if (data['message'].toString().toLowerCase() ==
                        //     "success") {
                        //   // showCustomSnackBar(data['message'], isError: false);
                        //   mapController.text = "";
                        // } else {
                        //   // showCustomSnackBar(data['message']);
                        // }
                      },
                      child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          height: 45,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10)),
                            color: Theme.of(context).primaryColor,
                          ),
                          child: const Center(child: Text("Map"))),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Future<dynamic> ShowCapturedWidget(
      BuildContext context, Uint8List capturedImage) {
    return showDialog(
      useSafeArea: false,
      context: context,
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: const Text("Captured widget screenshot"),
        ),
        body: Center(
            child: capturedImage != null
                ? Image.memory(capturedImage)
                : Container()),
      ),
    );
  }
}
