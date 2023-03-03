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
        // Navigator.pushReplacementNamed(context, My_Routes.dealerhomepage);
        Navigator.pushReplacementNamed(context, My_Routes.distributernavbar);
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
