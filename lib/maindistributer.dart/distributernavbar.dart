import 'dart:io';

// import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:vinayakply/api/bloc/bloc.dart';
import 'package:vinayakply/api/repo/modal.dart';
import 'package:vinayakply/maindistributer.dart/productpage.dart';

import '../custom_color.dart';
import '../interior/interiorprofile.dart';
import 'cartpage.dart';
import 'distributerHome.dart';

class DistributerNav extends StatefulWidget {
  DistributerNav({super.key, this.selectedIndex});
  int? selectedIndex = 0;
  @override
  State<DistributerNav> createState() => _DistributerNavState();
}

class _DistributerNavState extends State<DistributerNav> {
  final List<Widget> _widgetOptions = <Widget>[
    // const InteriorDashBord(),

    const DistributerHome(),
    const ProductPage(),
    const MyCardPage(),
    const InteriorProfile()
  ];

  void _onItemTap(int index) {
    setState(() {
      widget.selectedIndex = index;
    });
  }

  Future<bool> _onBack() {
    return check();
  }

  check() {
    if (widget.selectedIndex != 0) {
      setState(() {
        widget.selectedIndex = 0;
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
  void initState() {
    // TODO: implement initState
    super.initState();
    homeBloc.fetchSlider();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onBack,
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              actions: [
                StreamBuilder<CartModal>(
                    stream: homeBloc.getCartModal.stream,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) return Container();
                      return Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: InkWell(
                          onTap: () {
                            _onItemTap(2);
                          },
                          child: Center(
                            child: Badge(
                              label: Text(
                                  snapshot.data!.products.length.toString()),
                              child: const Icon(
                                Icons.shopping_cart,
                                color: Colors.white,
                                size: 28,
                              ),
                            ),
                          ),
                        ),
                      );
                    })
              ],
              leading: Container(),

              toolbarHeight: 60, // Set this height
              flexibleSpace: InkWell(
                onTap: () {
                  homeBloc.fetchSlider();
                },
                child: Container(
                  child: Container(
                    color: Custom_colors.skyblue,
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset("assets/logo2.png"),
                  ),
                ),
              ),
            ),
            body: Center(
              child: _widgetOptions.elementAt(widget.selectedIndex ?? 0),
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
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  // backgroundColor: primaryLight,
                  icon: Icon(
                    Icons.badge,
                  ),
                  label: 'Products',
                ),
                BottomNavigationBarItem(
                  // backgroundColor: primaryLight,
                  icon: Icon(
                    Icons.shopping_bag,
                  ),
                  label: 'Cart',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person_add,
                  ),
                  label: 'More',
                ),
              ],
              currentIndex: widget.selectedIndex ?? 0,
              onTap: _onItemTap,
              // fixedColor: Colors.orange,
            ),
          ),
        ));
  }
}
