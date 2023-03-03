import 'package:flutter/material.dart';
import 'package:vinayakply/routes.dart';
class Bottom_Navigation extends StatefulWidget {
  const Bottom_Navigation({Key? key}) : super(key: key);

  @override
  State<Bottom_Navigation> createState() => _Bottom_NavigationState();
}

class _Bottom_NavigationState extends State<Bottom_Navigation> {
  int pageIndex=0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor:  Colors.cyan,
      currentIndex: pageIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        pageIndex=index;
        if(index==0)
        {
        //  Navigator.pushNamed(context, My_Routes.homeRoute);
        }
        if(index==1)
        {
         // Navigator.pushNamed(context, My_Routes.allcategoryRoute);
        }
        if(index==2)
        {
         // Navigator.pushNamed(context, My_Routes.dealsofdayRoute);
        }
        if(index==3)
        {
         // Navigator.pushNamed(context, My_Routes.userprofileRoute);
        }
      },
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white,
      selectedFontSize: 16,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Dashboard"),
        BottomNavigationBarItem(icon: Icon(Icons.play_arrow), label: "Schemes"),
        BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet_sharp), label: "Reward",),
        BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: "More"),
      ],
    );
  }
}
