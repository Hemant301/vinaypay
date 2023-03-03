import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:vinayakply/api/registerapi.dart';
import 'package:vinayakply/routes.dart';

Map accountveryfy = {};

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var isLoading = false;
  bool isVisible = false;

  @override
  accotVerf(mob) async {
    try {
      RegisterApi registerApi = RegisterApi();
      Map data = await registerApi.accountveryfy(mobile: "8445721334");
      setState(() {
        accountveryfy = data;
      });

      log("dfgdj$accountveryfy");
    } catch (e) {
      print(e);
    }
  }

  void _verify_user_account(String mobile) async {
    //   final isValid = _formKey.currentState?.validate();
    //   if (!isValid!) {
    //     return;
    //   } else {
    //     try {
    //       Response response = await post(
    //           Uri.parse("${My_Routes.server_path}verify-account.php"),
    //           body: {'UserName': mobile});
    //       print(response.body);
    //       // print(response.statusCode);

    //       if (response.statusCode == 200) {
    //         var data = jsonDecode(response.body) as Map;

    //         String sucess = data['successCode'];
    //         if (sucess == "1") {
    //           String usersucess = data["user_status"];
    //           String getuserid = data["userid"];

    //           if (usersucess == "0") {
    //             String usertype = data["usertype"];
    //             // Toast.makeText(LoginDashboard2.this, "usertype : "+usertype, Toast.LENGTH_SHORT).show();
    //             if (usertype == "0") {
    //               //   Navigator.pushNamed(context, My_Routes.otpverifyRoute);
    //               Navigator.pushNamed(
    //                 context,
    //                 My_Routes.otpverifyRoute,
    //                 arguments: {
    //                   'userid': getuserid,
    //                   'mobile': mobile,
    //                   'get_otp': data['OTP'],
    //                   'status_id': usersucess,
    //                 },
    //               );
    //               print("verify account..");
    //             } else {}
    //           } else if (usersucess == "1") {
    //             // print("in2");
    //             setState(() {
    //               isVisible = !isVisible;
    //             });
    //           }
    //         }

    //         // print(data['status']);
    //         // Navigator.pushNamed(context, My_Routes.otpverifyRoute);

    //         /*  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //           content: Text("Sending Message"),
    //         ));*/

    //         /**/

    //       } else {
    //         print('failed');
    //       }
    //     } catch (e) {
    //       print(e.toString());
    //     }
    //   }
    //   _formKey.currentState?.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Image.asset("assets/logo2.png", fit: BoxFit.fitWidth),
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: (() {
                print("dcvdcvd");
                Navigator.pushNamed(context, My_Routes.interiorNav);
              }),
              child: const Text(
                "Signin/Signup Account",
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
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Column(
                children: [
                  TextFormField(
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
                    height: 10,
                  ),
                  Visibility(
                    visible: !isVisible,
                    child: SizedBox(
                      width: 400,
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.black, // foreground
                        ),
                        onPressed: () async {
                          await accotVerf(mobileController.text);
                          /* setState(() {
                            isVisible=!isVisible;
                          }); */
                        },
                        child: const Text(
                          "Continue",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                  if (accountveryfy['user_status'] == 1)
                    Container(
                      child: Column(
                        children: [
                          TextFormField(
                            controller: passwordController,
                            obscureText: true,
                            decoration: const InputDecoration(
                              labelText: "Enter Password",
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(26.0)),
                                  borderSide:
                                      BorderSide(color: Colors.white24)),
                              prefixIcon: Align(
                                widthFactor: 1.0,
                                heightFactor: 1.0,
                                child: Icon(
                                  Icons.lock,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
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
                                Navigator.pushNamed(
                                    context, My_Routes.dashboardinterior);
                              },
                              child: const Text(
                                "Login",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
