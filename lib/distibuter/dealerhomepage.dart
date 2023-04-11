import 'package:flutter/material.dart';
import 'package:vinayakply/distibuter/dashboard.dart';
import 'package:vinayakply/distibuter/rewards.dart';
import 'package:vinayakply/distibuter/schemes.dart';
import 'package:vinayakply/util/blog.dart';

import '../drawer.dart';
import '../interior/interiorprofile.dart';

class DealerHome extends StatefulWidget {
  const DealerHome({
    Key? key,
  }) : super(key: key);

  @override
  State<DealerHome> createState() => _DealerHomeState();
}

class _DealerHomeState extends State<DealerHome> {
  int pageIndex = 0;
  final pages = [
    const Dashboard(),
    Schemes(
      ispage: false,
    ),
    const Rewards(),
    const InteriorProfile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buildMyNavBar(context),
      drawer: const CustomDrawer(),
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Image.asset('assets/logo2.png', height: 90, width: 160),
        centerTitle: false,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  "My Points",
                  style: TextStyle(fontSize: 18),
                ),
                Text("${userCred.getSchool()}"),
              ],
            ),
          )
        ],
      ),
      body: pages[pageIndex],
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                pageIndex = 0;
              });
            },
            icon: pageIndex == 0
                ? const Icon(
                    Icons.home_filled,
                    color: Colors.white,
                    size: 35,
                  )
                : const Icon(
                    Icons.home_outlined,
                    color: Colors.white,
                    size: 35,
                  ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 1;
              });
            },
            icon: pageIndex == 1
                ? const Icon(
                    Icons.work_rounded,
                    color: Colors.white,
                    size: 35,
                  )
                : const Icon(
                    Icons.work_outline_outlined,
                    color: Colors.white,
                    size: 35,
                  ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 2;
              });
            },
            icon: pageIndex == 2
                ? const Icon(
                    Icons.widgets_rounded,
                    color: Colors.white,
                    size: 35,
                  )
                : const Icon(
                    Icons.widgets_outlined,
                    color: Colors.white,
                    size: 35,
                  ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 3;
              });
            },
            icon: pageIndex == 3
                ? const Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 35,
                  )
                : const Icon(
                    Icons.person_outline,
                    color: Colors.white,
                    size: 35,
                  ),
          ),
        ],
      ),
    );
  }
}
