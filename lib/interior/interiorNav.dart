import 'dart:io';

import 'package:flutter/material.dart';

import '../custom_color.dart';
import 'interiordashboar.dart';
import 'interiorprofile.dart';

class InteriorNav extends StatefulWidget {
  const InteriorNav({super.key});

  @override
  State<InteriorNav> createState() => _InteriorNavState();
}

class _InteriorNavState extends State<InteriorNav> {
  final List<Widget> _widgetOptions = <Widget>[
    const InteriorDashBord(),
    const InteriorProfile()
  ];
  int selectedIndex = 0;
  void _onItemTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  Future<bool> _onBack() {
    return check();
  }

  check() {
    if (selectedIndex != 0) {
      setState(() {
        selectedIndex = 0;
      });
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Are you sure"),
              content: const Text('Are you sure to quit?'),
              actions: <Widget>[
                TextButton(
                  child:
                      const Text("Stay", style: TextStyle(color: Colors.blue)),
                  onPressed: () => Navigator.pop(context, false),
                ),
                TextButton(
                    onPressed: () {
                      exit(1);
                    },
                    child: const Text("Quit",
                        style: TextStyle(color: Colors.blue))),
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onBack,
        child: Scaffold(
          body: Center(
            child: _widgetOptions.elementAt(selectedIndex),
          ),
          bottomNavigationBar: BottomNavigationBar(
            // selectedItemColor: Colors.white,
            selectedItemColor: Colors.white,
            elevation: 0,
            backgroundColor: Custom_colors.skyblue,
            showUnselectedLabels: true,
            selectedLabelStyle: const TextStyle(fontSize: 14),
            unselectedLabelStyle: const TextStyle(fontSize: 14),
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: Colors.black,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                // backgroundColor: primaryLight,
                icon: Icon(
                  Icons.home,
                ),
                label: 'DashBoard',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_add,
                ),
                label: 'More',
              ),
            ],
            currentIndex: selectedIndex,
            onTap: _onItemTap,
            // fixedColor: Colors.orange,
          ),
        ));
  }
}
