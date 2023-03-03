import 'package:flutter/material.dart';
import 'package:vinayakply/routes.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
              ), //BoxDecoration
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.white),
                accountName: Text(
                  "Vinayak ply",
                  style: TextStyle(fontSize: 18),
                ),
                accountEmail: Text("sunny@gmail.com"),
                currentAccountPictureSize: Size.square(50),
                currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.red,
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                    ) //Text
                    ), //circleAvatar
              ), //UserAccountDrawerHeader
            ), //DrawerHeader
            ListTile(
              leading: const Icon(Icons.card_giftcard),
              title: const Text(' Scheme'),
              onTap: () {
                Navigator.pushNamed(context, My_Routes.dealerScheme);
              },
            ),
            ListTile(
              leading: const Icon(Icons.workspace_premium),
              title: const Text(' Reward '),
              onTap: () {
                setState(() {
                  // widgetForBody = productBody();
                });
                //Navigator.pushNamed(context, My_Routes.viewcartRoute);
              },
            ),
            const Divider(
              height: 1,
              thickness: 1,
            ),
            ListTile(
              leading: const Icon(Icons.message),
              title: const Text(' About '),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, My_Routes.aboutUs);
              },
            ),
            ListTile(
              leading: const Icon(Icons.call),
              title: const Text(' Support '),
              onTap: () {
                Navigator.pushNamed(context, My_Routes.support);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('LogOut'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const Divider(
              height: 1,
              thickness: 1,
            ),
            ListTile(
              title: const Text('Version 1.0'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
