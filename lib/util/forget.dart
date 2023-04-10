import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../api/registerapi.dart';
import '../routes.dart';

class ForgetPssword extends StatefulWidget {
  const ForgetPssword({super.key});

  @override
  State<ForgetPssword> createState() => _ForgetPsswordState();
}

class _ForgetPsswordState extends State<ForgetPssword> {
  TextEditingController mobileController = TextEditingController();

  bool loading1 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const SizedBox(
          height: 100,
        ),
        InkWell(
          onTap: () {
            // veryFyPopUP(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Image.asset("assets/logo2.png", fit: BoxFit.fitWidth),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        const InkWell(
          // onTap: (() {
          //   print("dcvdcvd");
          //   Navigator.pushNamed(context, My_Routes.interiorNav);
          // }),
          child: Text(
            "Forgot Password",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: Column(
            children: [
              TextFormField(
                maxLength: 10,
                controller: mobileController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: "Enter Mobile Number",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(26.0)),
                      borderSide: BorderSide(color: Colors.white24)),
                  prefixIcon: Align(
                    widthFactor: 0.6,
                    heightFactor: 1.0,
                    child: Icon(
                      Icons.phone,
                    ),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter Mobile No.!';
                  }
                  if (value.length < 10) {
                    return 'Enter 10 digit Mobile No.!';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 400,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.black, // foreground
                  ),
                  onPressed: () async {
                    // if ((mobileController.text).length <= 9) {
                    //   // print("${(phonecontroller.text).length <= 9}");
                    //   Fluttertoast.showToast(
                    //       msg: "Invalid phone no!",
                    //       toastLength: Toast.LENGTH_SHORT,
                    //       gravity: ToastGravity.BOTTOM,
                    //       timeInSecForIosWeb: 1,
                    //       backgroundColor: Colors.red,
                    //       textColor: Colors.white,
                    //       fontSize: 16.0);

                    //   return;
                    // }
                    setState(() {
                      loading1 = true;
                    });

                    RegisterApi registerApi = RegisterApi();
                    try {
                      Map data = await registerApi.forgetApi(
                        mobile: mobileController.text,
                      );
                      Fluttertoast.showToast(
                          msg: " ${data['message']}! ",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                      print(data["success"].runtimeType);

                      if (data["successCode"].toString() == "1") {
                        Timer(const Duration(seconds: 2), () {
                          Navigator.pushReplacementNamed(
                              context, My_Routes.login2);
                        });
                      } else {
                        setState(() {
                          loading1 = false;
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
                          loading1 = false;
                        });
                      }
                    } catch (e) {}
                    // Navigator.pushReplacementNamed(context, '/main');
                  },
                  child: const Text(
                    "Send Password",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
