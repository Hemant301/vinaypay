import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:vinayakply/distibuter/earnpoin.dart';
import 'package:vinayakply/untitled%20folder/scanQr.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            ImageSlideshow(
              width: double.infinity,
              height: 200,
              initialPage: 2,
              indicatorColor: Colors.deepOrange,
              indicatorBackgroundColor: Colors.blue,
              onPageChanged: (value) {
                print('Page changed: $value');
              },
              autoPlayInterval: 2000,
              isLoop: true,
              children: [
                Image.asset(
                  'assets/ply.png',
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/ply1.png',
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/ply2.png',
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/ply3.png',
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/ply1.png',
                  fit: BoxFit.cover,
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              width: MediaQuery.of(context).size.width * .8,
              height: MediaQuery.of(context).size.width * .6,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(12)),
              child: Column(children: [
                Image.asset(
                  'assets/qr.png',
                  width: 150,
                  height: 150,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0)),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Qr(
                              // data: result.code,
                              )),
                    );
                  },
                  child: const Text(
                    'SCAN QR',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ]),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 46,
              width: MediaQuery.of(context).size.width * .8,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: const RoundedRectangleBorder(),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const EarnPoint()),
                  );
                },
                child: const Text(
                  'View all points',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
