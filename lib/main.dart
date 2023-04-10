import 'package:flutter/material.dart';
// import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vinayakply/dashboardinterior.dart';
import 'package:vinayakply/distibuter/dashboard.dart';
import 'package:vinayakply/distibuter/rewards.dart';
import 'package:vinayakply/distibuter/schemes.dart';
import 'package:vinayakply/distibuter/warranycardDetail.dart';
import 'package:vinayakply/interior/editProfile.dart';
import 'package:vinayakply/login.dart';
import 'package:vinayakply/login2.dart';
import 'package:vinayakply/maindistributer.dart/orderdetails.dart';
import 'package:vinayakply/maindistributer.dart/orderpage.dart';
import 'package:vinayakply/maindistributer.dart/warranypage.dart';
import 'package:vinayakply/more.dart';
import 'package:vinayakply/register.dart';
import 'package:vinayakply/routes.dart';
import 'package:vinayakply/splashscreen.dart';
import 'package:vinayakply/util/storage.dart';
import 'package:vinayakply/verifyotp.dart';

import 'bottomnavigation.dart';
import 'distibuter/aboutus.dart';
import 'distibuter/dealerhomepage.dart';
import 'distibuter/support.dart';
import 'interior/interiorAddEnquiry.dart';
import 'interior/interiorNav.dart';
import 'interior/interiorchangepassword.dart';
import 'interior/interiordashboar.dart';
import 'maindistributer.dart/distributernavbar.dart';
import 'maindistributer.dart/warrantycarddetails.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageUtil.getInstance();
  // await FlutterDownloader.initialize(debug: true, ignoreSsl: true);
  runApp(const VinayakPly());
}

class VinayakPly extends StatelessWidget {
  const VinayakPly({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vinayak Ply',
      home: const Registration(),
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      initialRoute: My_Routes.splashRoute,
      routes: {
        My_Routes.splashRoute: (context) => const Splashscreen(),
        My_Routes.dealerMainHome: (context) => const DealerHome(),
        My_Routes.loginRoute: (context) => const LoginPage(),
        //My_Routes.homeRoute:(context) =>HomePage(),
        My_Routes.registerRoute: (context) => const Registration(),
        My_Routes.otpverifyRoute: (context) => Otpvarify(),
        My_Routes.dealerhomepage: (context) => const DealerHome(),
        My_Routes.warranycardDetail: (context) => const WarranyCardDetails(),
        // My_Routes.aboutus: (context) => const AboutUs(),
        My_Routes.dashboardinterior: (context) =>
            const InteriorInteriorDashboard(),
        My_Routes.dealerDashboard: (context) => const Dashboard(),
        My_Routes.dealerScheme: (context) => Schemes(
              ispage: true,
            ),
        My_Routes.dealerRewards: (context) => const Rewards(),
        My_Routes.dealerMore: (context) => const More(),
        My_Routes.aboutUs: (context) => const AboutUs(),
        My_Routes.login2: (context) => const FreshLogin(),
        My_Routes.support: (context) => const SupportPage(),
        My_Routes.interiorNav: (context) => const InteriorNav(),
        My_Routes.editProfile: (context) => const EditProflie(),
        My_Routes.bottomnavigation: (context) => const Bottom_Navigation(),
        My_Routes.interiorAddEnquiry: (context) => const InteriorAddEnquaey(),
        My_Routes.interiordashboar: (context) => const InteriorDashBord(),
        My_Routes.interiorchangepassword: (context) =>
            const InteriorChangePassword(),

// diisributer
        My_Routes.distributernavbar: (context) => DistributerNav(),
        My_Routes.orderpage: (context) => const MyOrder(),
        My_Routes.warranypage: (context) => const WarratyPage(),
        My_Routes.warrantycarddetails: (context) => const WarrancycardDetails(),
        My_Routes.orderdetails: (context) => const OrderDetals(),
      },
    );
  }
}
