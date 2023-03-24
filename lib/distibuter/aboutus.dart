import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isVisible = false;

  void _launchphone(String urlphone) async {
    if (!await launch(
      urlphone,
    )) throw 'Could not launch $urlphone';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text(
            'About Us',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset("assets/logo2.png", fit: BoxFit.fitWidth),
              ),
              Container(
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    "Vinayak Ply provides unparalleled quality in plywood, blackboard, and flush doors from its production division, which is outfitted with the most cutting-edge equipment and infrastructure and employs 550 talented workers throughout its five manufacturing facilities. With advantages like uniform and high density, resilience to a hot, humid environment, resistance to borers and termites, as well as eco-friendliness, we have a full range of products for dealers and distributors across India. These characteristics combine to make Vinayak ply products the best. Products made of plywood are widely used in both household and business contexts. The greatest option is Vinayak Ply, which is both inexpensive and long-lasting and provides unparalleled strength and tones of elegance to go with contemporary urban living",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                  alignment: Alignment.bottomLeft,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Need more help ?",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    _launchphone('9627200009');
                  },
                  child: Card(
                    elevation: 5,
                    child: Row(children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                            decoration: const BoxDecoration(
                                color: Colors.red, shape: BoxShape.circle),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.call,
                                color: Colors.white,
                              ),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              "Call With Us",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            const Text(
                              "9627200009",
                              style: TextStyle(
                                  fontSize: 15,
                                  // fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            Text(
                              "We are live and ready to help",
                              style: TextStyle(
                                  fontSize: 15,
                                  // fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade700),
                            ),
                          ],
                        ),
                      )
                    ]),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    _launchphone('1800-309-1918');
                  },
                  child: Card(
                    elevation: 5,
                    child: Row(children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                            decoration: const BoxDecoration(
                                color: Colors.red, shape: BoxShape.circle),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.call,
                                color: Colors.white,
                              ),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              "Toll Free Number",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            const Text(
                              "1800-309-1918",
                              style: TextStyle(
                                  fontSize: 15,
                                  // fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            Text(
                              "We are live and ready to help",
                              style: TextStyle(
                                  fontSize: 15,
                                  // fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade700),
                            ),
                          ],
                        ),
                      )
                    ]),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    _launchphone('customerhelpdesk@vinayakply.com');
                  },
                  child: Card(
                    elevation: 5,
                    child: Row(children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                            decoration: const BoxDecoration(
                                color: Colors.red, shape: BoxShape.circle),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.mail,
                                color: Colors.white,
                              ),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              "Mail with us",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            Text(
                              "customerhelpdesk@vinayakply.com",
                              style: TextStyle(
                                  fontSize: 15,
                                  // fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            // Text(
                            //   "We are live and ready to help",
                            //   style: TextStyle(
                            //       fontSize: 15,
                            //       // fontWeight: FontWeight.bold,
                            //       color: Colors.grey.shade700),
                            // ),
                          ],
                        ),
                      )
                    ]),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
