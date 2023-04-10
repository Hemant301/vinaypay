import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../maindistributer.dart/distbuterapi.dart';
import '../routes.dart';

Barcode? result;

class QrClint extends StatefulWidget {
  const QrClint({Key? key}) : super(key: key);

  @override
  State<QrClint> createState() => _QrClintState();
}

class _QrClintState extends State<QrClint> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  QRViewController? controller;
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller?.pauseCamera();
    } else if (Platform.isIOS) {
      controller?.resumeCamera();
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: const MyHomePage(
            title: "hfgh",
          ),
        )
      ],
    ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String? title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Barcode? result;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  QRViewController? controller;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller?.pauseCamera();
    } else if (Platform.isIOS) {
      controller?.resumeCamera();
    }
  }

  bool loading = false;
  TextEditingController sirNoController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    refresh();
  }

  refresh() {
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        controller?.resumeCamera();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        // leading: InkWell(
        //     onTap: () {
        //       // Navigator.pop(context);
        //     },
        //     child: const Icon(Icons.arrow_back)),
        title: InkWell(
            onTap: () {
              // Navigator.pushReplacement(
              //   context,
              //   MaterialPageRoute(
              //       builder: (context) => QrResponse(
              //             data: "NoufIqg",
              //           )),
              // );
            },
            child: const Text("Scan QR")),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width,
              child: QRView(
                key: qrKey,
                onQRViewCreated: _onQRViewCreated,
              ),
            ),
            Container(
              // height: MediaQuery.of(context).size.width,
              // width: MediaQuery.of(context).size.width,
              color: Colors.grey.shade200,
              child: Column(children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "OR",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Textfiless(
                  controller: sirNoController,
                  title: "Enter Serial Number",
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 10,
                ),
                loading == true
                    ? const Center(child: CircularProgressIndicator())
                    : InkWell(
                        onTap: () async {
                          DistubuterApi distubuterApi = DistubuterApi();
                          try {
                            Map data = await distubuterApi.addpoinapi(
                                serial_no: sirNoController.text);
                            print(data["status"].runtimeType);

                            if (data["success"].toString() == "1") {
                              Navigator.pop(context);
                              setState(() {
                                loading = false;
                              });
                              Fluttertoast.showToast(
                                  msg: " ${data['message']}! ",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                              setState(() {
                                loading = false;
                              });
                            } else {
                              setState(() {
                                loading = false;
                              });
                              Fluttertoast.showToast(
                                  msg: " ${data['message']}! ",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                              setState(() {
                                loading = false;
                              });
                            }
                          } catch (e) {}
                          // Navigator.pushReplacementNamed(context, '/main');
                        },
                        // onTap: (() {
                        //   Navigator.pushNamed(context, My_Routes.warranycardDetail);
                        // }),
                        child: Container(
                          width: MediaQuery.of(context).size.width - 20,
                          height: 48,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(12)),
                          child: const Center(
                            child: Text(
                              "Apply",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      if (result != "" || result != null) {
        setState(() {
          result = scanData;
          controller.pauseCamera();
          qrapi(result);
        });
      } else {
        // showCustomSnackBar("Not a valid qr");
        Future.delayed(const Duration(seconds: 20), () {
          Navigator.pop(context);
        });
      }
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  qrapi(res) async {
    DistubuterApi distubuterApi = DistubuterApi();
    try {
      Map data = await distubuterApi.addpoinapi(serial_no: res);
      print(data["status"].runtimeType);

      if (data["success"].toString() == "1") {
        log("mc");
        // Navigator.pop(context);
        Fluttertoast.showToast(
            msg: " ${data['message']}! ",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        Future.delayed(const Duration(seconds: 0), () {
          Navigator.pushNamed(context, My_Routes.warranycardDetail);
          // Navigator.pushReplacement(
          //   context,
          //   MaterialPageRoute(
          //       builder: (context) => QrResponse(
          //             data: result.code,
          //           )),
          // );
        });
        setState(() {
          loading = false;
        });
        Fluttertoast.showToast(
            msg: " ${data['message']}! ",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        // setState(() {
        //   // loading = false;
        // });
      } else {
        setState(() {
          loading = false;
        });
        Fluttertoast.showToast(
            msg: " ${data['message']}! ",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        // setState(() {
        //   loading = false;
        // });
      }
    } catch (e) {}
  }
  // void showCustomSnackBar(String s) {}
}

class Textfiless extends StatelessWidget {
  Textfiless(
      {Key? key,
      this.title,
      this.icon,
      this.controller,
      this.maxLength,
      this.keyboardType})
      : super(key: key);
  String? title;
  IconData? icon;
  int? maxLength;
  TextInputType? keyboardType;

  TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        // padding: EdgeInsets.all(20),
        // height: 160,
        width: MediaQuery.of(context).size.width - 30,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(1, 3), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TextField(
            controller: controller,
            maxLength: maxLength,
            keyboardType: keyboardType,
            decoration: InputDecoration(
                counterText: "",
                hintText: title,
                hintStyle: const TextStyle(fontSize: 12),
                // prefixIcon: Icon(icon),
                border: InputBorder.none),
          ),
        ),
      ),
    );
  }
}
