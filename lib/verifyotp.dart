import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vinayakply/api/registerapi.dart';
import 'package:vinayakply/custom_color.dart';
import 'package:vinayakply/routes.dart';

class Otpvarify extends StatefulWidget {
  @override
  State<Otpvarify> createState() => _OtpvarifyState();
}

class _OtpvarifyState extends State<Otpvarify> {
  TextEditingController first = TextEditingController();
  TextEditingController second = TextEditingController();
  TextEditingController third = TextEditingController();
  TextEditingController four = TextEditingController();

  int secondsRemaining = 60;
  bool enableResend = false;
  Timer? timer;
  String? otpset;

  @override
  void initState() {
    // TODO: implement initState
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (secondsRemaining != 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        setState(() {
          enableResend = true;
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String mobile = "";
    final arg = ModalRoute.of(context)!.settings.arguments as Map;
    String userid = arg['userid'];
    mobile = arg['mobile'];
    // int OTP = arg['get_otp'];
    otpset = arg['get_otp'];

    //print(OTP);
    //
    /*  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("set mobile :"+mobile+", userid : "+userid),
          ));*/
    /*  final routeArgs ="";
    ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final otp = routeArgs["dd"];
    final mobile = routeArgs['mobile'];*/
    return Scaffold(
      body: Container(
        color: Colors.white,
        height: double.maxFinite,
        child: Stack(
          //alignment:new Alignment(x, y)
          children: <Widget>[
            Positioned(
                child: Column(
              children: [
                const SizedBox(
                  height: 70,
                ),
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Image.asset(
                    "assets/logo2.png",
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ],
            )),
            Positioned(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Container(
                  height: MediaQuery.of(context).size.width * 1.0,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    gradient: LinearGradient(
                        colors: [Colors.white, Custom_colors.redlight],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        tileMode: TileMode.clamp),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Text("Enter the 4 digit code",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Received on ",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center),
                            Text(mobile,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center),
                          ]),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 60,
                              width: 70,
                              color: Colors.white70,
                              child: TextField(
                                controller: first,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                style: Theme.of(context).textTheme.headline6,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                              ),
                            ),
                            Container(
                              height: 60,
                              width: 70,
                              color: Colors.white70,
                              child: TextField(
                                controller: second,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder()),
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                style: Theme.of(context).textTheme.headline6,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                              ),
                            ),
                            Container(
                              height: 60,
                              width: 70,
                              color: Colors.white70,
                              child: TextField(
                                controller: third,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                style: Theme.of(context).textTheme.headline6,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                              ),
                            ),
                            Container(
                              height: 60,
                              width: 70,
                              color: Colors.white70,
                              child: TextField(
                                controller: four,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder()),
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                style: Theme.of(context).textTheme.headline6,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Resend ",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center),
                            const Text("code in ",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center),
                            Text("$secondsRemaining",
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center),
                            secondsRemaining == 0
                                ? InkWell(
                                    onTap: () async {
                                      await resendCode(mobile);
                                    },
                                    child: const Text(
                                      " Resend",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: Colors.blue),
                                    ),
                                  )
                                : const SizedBox(),
                          ]),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: 340,
                        height: 48,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.black, // foreground
                          ),
                          onPressed: () {
                            if (first.text != "" &&
                                second.text != "" &&
                                third.text != "" &&
                                four.text != "") {
                              String matchOTP = first.text.toString() +
                                  second.text.toString() +
                                  third.text.toString() +
                                  four.text.toString();
                              if (otpset.toString() == matchOTP) {
                                //  Navigator.pushNamed(context, My_Routes.registerRoute);
                                Navigator.pushNamed(
                                  context,
                                  My_Routes.registerRoute,
                                  arguments: {
                                    'mobile': mobile,
                                  },
                                );
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text("Enter Correct OTP "),
                                ));
                              }
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("Enter 4 digit OTP"),
                              ));
                            }

                            //signin(mobileController.text.toString());
                          },
                          child: const Text(
                            "Next",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Cancel",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<dynamic> resendCode(mob) async {
    try {
      RegisterApi registerApi = RegisterApi();
      Map data = await registerApi.accountveryfy(mobile: mob);
      setState(() {
        first.text == null;
        second.text == null;
        third.text == null;
        four.text == null;
        print(first.text);
        otpset = data['OTP'];
      });

      log("dfgdj$otpset");
    } catch (e) {
      print(e);
    }

    //other code here
    setState(() {
      secondsRemaining = 60;
      enableResend = false;
    });
    //other code here
  }

  @override
  dispose() {
    timer?.cancel();
    super.dispose();
  }
}
