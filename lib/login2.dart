import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vinayakply/api/registerapi.dart';
import 'package:vinayakply/routes.dart';
import 'package:vinayakply/util/blog.dart';
import 'package:vinayakply/util/forget.dart';

Map userData = {};

class FreshLogin extends StatefulWidget {
  const FreshLogin({super.key});

  @override
  State<FreshLogin> createState() => _FreshLoginState();
}

class _FreshLoginState extends State<FreshLogin> {
  Map accData = {};
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool loading = false;
  bool loading1 = false;
  bool isShow = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
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
              child: Column(children: [
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ForgetPssword()),
                          );
                        },
                        child: const Text(
                          "Forgot Password",
                          style: TextStyle(
                              color: Color.fromARGB(255, 3, 107, 128),
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
                if (isShow != true)
                  Column(
                    children: [
                      loading == true
                          ? const Center(child: CircularProgressIndicator())
                          : Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: 400,
                                height: 48,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor: Colors.black, // foreground
                                  ),
                                  onPressed: () async {
                                    if ((mobileController.text).length <= 9) {
                                      // print("${(phonecontroller.text).length <= 9}");
                                      Fluttertoast.showToast(
                                          msg: "Invalid phone no!",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0);

                                      return;
                                    }
                                    setState(() {
                                      loading = true;
                                    });

                                    RegisterApi registerApi = RegisterApi();
                                    try {
                                      Map data =
                                          await registerApi.accountveryfy(
                                              mobile: mobileController.text);
                                      setState(() {
                                        accData = accData;
                                      });
                                      print(data["successCode"].runtimeType);

                                      if (data["successCode"] == "1") {
                                        log(data.toString());
                                        if (data["user_status"] == "0") {
                                          if (data["usertype"] == "0") {
                                            Future.delayed(
                                                const Duration(seconds: 0), () {
                                              Navigator.pushNamed(context,
                                                  My_Routes.otpverifyRoute,
                                                  arguments: {
                                                    "userid": data["userid"],
                                                    "get_otp":
                                                        data["OTP"].toString(),
                                                    "mobile":
                                                        mobileController.text
                                                  });
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

                                            // verify otp
                                          } else {
                                            // verify dialog
                                            veryFyPopUP(context);
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
                                        }
                                        // verify otp

                                        else if (data["user_status"] == "1") {
                                          log("hhhhhhhh");
                                          // user login
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
                                            isShow = true;
                                          });
                                        } else if (data["user_status"] == "2") {
                                          BlockedUser(context);
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
                                        } else if (data["user_status"] == "0" &&
                                            data["usertype"] != "0") {
                                          // block dialog
                                          veryFyPopUP(context);
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
                                      }
                                    } catch (e) {}
                                    // Navigator.pushReplacementNamed(context, '/main');
                                  },
                                  child: const Text(
                                    "Continue",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                ),
                              ),
                            ),
                    ],
                  ),
                if (isShow == true)
                  Container(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: "Enter Password",
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(26.0)),
                                borderSide: BorderSide(color: Colors.white24)),
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
                          height: 20,
                        ),
                        loading1 == true
                            ? const Center(child: CircularProgressIndicator())
                            : SizedBox(
                                width: 400,
                                height: 48,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor: Colors.black, // foreground
                                  ),
                                  onPressed: () async {
                                    if ((mobileController.text).length <= 9) {
                                      // print("${(phonecontroller.text).length <= 9}");
                                      Fluttertoast.showToast(
                                          msg: "Invalid phone no!",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0);

                                      return;
                                    } else if (passwordController.text == "") {
                                      // print("${(phonecontroller.text).length <= 9}");
                                      Fluttertoast.showToast(
                                          msg: "Invalid Password no!",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0);

                                      return;
                                    }
                                    setState(() {
                                      loading1 = true;
                                    });

                                    RegisterApi registerApi = RegisterApi();
                                    try {
                                      Map data = await registerApi.LoginApi(
                                          mobile: mobileController.text,
                                          password: passwordController.text);
                                      setState(() {
                                        // accData = accData;
                                      });
                                      log(data.toString());

                                      if (data["success"].toString() == "1") {
                                        userCred.setSchool(
                                            data['total_point'].toString());
                                        userCred.setStateId(
                                            data['state_id'].toString());
                                        userCred.addUserId(
                                            data["userid"].toString());
                                        userCred.addMob(
                                            data["mobile_no"].toString());
                                        userCred
                                            .addName(data["name"].toString());
                                        userCred.addEmail(
                                            data["email_id"].toString());
                                        userCred.addUserType(
                                            data["usertype_id"].toString());
                                        setState(() {
                                          userData = accData;
                                          loading1 = false;
                                        });

                                        if (data["usertype_id"].toString() ==
                                            "2") {
                                          Future.delayed(
                                              const Duration(seconds: 0), () {
                                            Navigator.pushReplacementNamed(
                                                context,
                                                My_Routes.dealerhomepage);
                                          });

                                          // Navigator.pushReplacementNamed(context, My_Routes.distributernavbar);
                                          // Navigator.pushReplacementNamed(context, My_Routes.interiorNav);
                                        } else if (data["usertype_id"]
                                                    .toString() ==
                                                "4" ||
                                            data["usertype_id"].toString() ==
                                                "5") {
                                          Future.delayed(
                                              const Duration(seconds: 0), () {
                                            Navigator.pushReplacementNamed(
                                                context, My_Routes.interiorNav);
                                          });
                                        } else if (data["usertype_id"]
                                                .toString() ==
                                            "3") {
                                          Future.delayed(
                                              const Duration(seconds: 0), () {
                                            Navigator.pushReplacementNamed(
                                                context,
                                                My_Routes.distributernavbar);
                                          });
                                        }

                                        Fluttertoast.showToast(
                                            msg: " ${data['message']}! ",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor: Colors.red,
                                            textColor: Colors.white,
                                            fontSize: 16.0);

                                        // Future.delayed(
                                        //     const Duration(seconds: 0), () {
                                        //   // Navigator.pushNamed(
                                        //   //   context,
                                        //   //   My_Routes.interiorNav,
                                        //   // );
                                        //   Navigator.pushNamed(context,
                                        //       My_Routes.distributernavbar
                                        //       // My_Routes.dealerhomepage,
                                        //       );
                                        // });
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
                                    "Login",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
                const SizedBox(
                  height: 10,
                ),
              ]))
        ]),
      ),
    );
  }
}

veryFyPopUP(context) {
  void _launchphone(String urlphone) async {
    if (!await launch(
      urlphone,
    )) throw 'Could not launch $urlphone';
  }

  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      backgroundColor: Colors.white,
      elevation: 5,
      insetPadding: const EdgeInsets.all(10),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      content: SizedBox(
        height: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              "Account Verification -",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 18, color: Colors.red),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Dear User, Your Account Verification is Currently Complete Pending. Please Wait for Verification. Contact to Vinayak Ply.",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.grey),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => Navigator.pushNamed(context, "/login2"),
                  child: Container(
                    height: 40,
                    width: 100,
                    color: const Color.fromARGB(255, 53, 22, 189),
                    child: const Center(
                      child: Text(
                        "OK",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _launchphone('tel:9627200009');
                  },
                  child: Container(
                    height: 40,
                    width: 150,
                    color: const Color.fromARGB(255, 53, 22, 189),
                    child: const Center(
                      child: Text(
                        "CALL NOW",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    ),
  );
}

BlockedUser(context) {
  void _launchphone(String urlphone) async {
    if (!await launch(
      urlphone,
    )) throw 'Could not launch $urlphone';
  }

  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (_) => AlertDialog(
      backgroundColor: Colors.white,
      elevation: 5,
      insetPadding: const EdgeInsets.all(10),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      content: SizedBox(
        height: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              "Account Blocked -",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 18, color: Colors.red),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Dear User, Your Account has been blocked . Contact to Vinayak Ply.",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.grey),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => Navigator.pushNamed(context, "/login2"),
                  child: Container(
                    height: 40,
                    width: 100,
                    color: const Color.fromARGB(255, 53, 22, 189),
                    child: const Center(
                      child: Text(
                        "OK",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _launchphone('tel:96272 00009');
                  },
                  child: Container(
                    height: 40,
                    width: 150,
                    color: const Color.fromARGB(255, 53, 22, 189),
                    child: const Center(
                      child: Text(
                        "CALL NOW",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    ),
  );
}



// else if (data["usertype"]
//                                                   .toString() ==
//                                               "2") {
//                                             // customer par jana h
//                                             Future.delayed(
//                                                 const Duration(seconds: 0),
//                                                 () {});
//                                             Fluttertoast.showToast(
//                                                 msg: " ${data['message']}! ",
//                                                 toastLength: Toast.LENGTH_SHORT,
//                                                 gravity: ToastGravity.BOTTOM,
//                                                 timeInSecForIosWeb: 1,
//                                                 backgroundColor: Colors.red,
//                                                 textColor: Colors.white,
//                                                 fontSize: 16.0);
//                                             setState(() {
//                                               loading = false;
//                                             });

//                                             // verify otp
//                                           } else if (data["usertype"]
//                                                       .toString() ==
//                                                   "4" ||
//                                               data["usertype"].toString() ==
//                                                   "5") {
//                                             // interor  par jana h
//                                             Future.delayed(
//                                                 const Duration(seconds: 0),
//                                                 () {});
//                                             Fluttertoast.showToast(
//                                                 msg: " ${data['message']}! ",
//                                                 toastLength: Toast.LENGTH_SHORT,
//                                                 gravity: ToastGravity.BOTTOM,
//                                                 timeInSecForIosWeb: 1,
//                                                 backgroundColor: Colors.red,
//                                                 textColor: Colors.white,
//                                                 fontSize: 16.0);
//                                             setState(() {
//                                               loading = false;
//                                             });

//                                             // verify otp
//                                           }