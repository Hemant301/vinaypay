import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vinayakply/routes.dart';
import 'package:vinayakply/util/blog.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      if (userCred.isUserLogin()) {
        if (userCred.getUserType() == '2') {
          Navigator.pushReplacementNamed(context, My_Routes.dealerhomepage);
        } else if (userCred.getUserType() == '3') {
          Navigator.pushReplacementNamed(context, My_Routes.distributernavbar);
        } else if (userCred.getUserType() == '4' ||
            userCred.getUserType() == '5') {
          Navigator.pushReplacementNamed(context, My_Routes.interiorNav);
        }

        // Navigator.pushReplacementNamed(context, My_Routes.dealerhomepage);
        // Navigator.pushReplacementNamed(context, My_Routes.distributernavbar);
        // Navigator.pushReplacementNamed(context, My_Routes.interiorNav);
      } else {
        Navigator.pushReplacementNamed(context, My_Routes.login2);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Image.asset("assets/logo2.png"),
          )
        ]),
      ),
    );
  }
}
