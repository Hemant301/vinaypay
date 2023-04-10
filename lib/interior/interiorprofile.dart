import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:vinayakply/routes.dart';

import '../maindistributer.dart/distributernavbar.dart';
import '../untitled folder/scanQr.dart';
import '../util/blog.dart';
import '../util/shearfunctions.dart';

class InteriorProfile extends StatefulWidget {
  const InteriorProfile({super.key});

  @override
  State<InteriorProfile> createState() => _InteriorProfileState();
}

class _InteriorProfileState extends State<InteriorProfile> {
  File? profileImage;
  String base64Image = "";

  fun() {
    log(userCred.getUserType());
    if (userCred.getUserType() == "2") {
      return Text(
        "Customer No:${userCred.getUserId()}",
        style: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
      );
    } else if (userCred.getUserType() == "4" || userCred.getUserType() == "5") {
      return Text(
        "Interior No:${userCred.getUserId()}",
        style: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
      );
    } else if (userCred.getUserType() == "3") {
      return Text(
        "Distributor No:${userCred.getUserId()}",
        style: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
      );
    }
  }

  // List profileData = [];

  // getUserDetail() async {
  //   try {
  //     RegisterApi registerApi = RegisterApi();
  //     List data = await registerApi.getUserDetails();
  //     setState(() {
  //       profileData = data;
  //       log(data.toString());
  //     });

  //     log("dfgdj$data");
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  fun2() {
    log(userCred.getUserType());
    if (userCred.getUserType() == "2") {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    "Personalization",
                    style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: (() {
                      Navigator.pushNamed(context, My_Routes.dealerScheme);
                    }),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          border:
                              Border.all(width: 1, color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: const <BoxShadow>[
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(1.0, 6.0),
                              blurRadius: 10.0,
                            ),
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "Schemes",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              Icon(Icons.arrow_forward_ios)
                            ]),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        border:
                            Border.all(width: 1, color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: const <BoxShadow>[
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(1.0, 6.0),
                            blurRadius: 10.0,
                          ),
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, My_Routes.dealerRewards);
                        },
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "Rewords",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              Icon(Icons.arrow_forward_ios)
                            ]),
                      ),
                    ),
                  ),
                ),
              ]),
        ),
      );
    } else if (userCred.getUserType() == "3") {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    "Personalization",
                    style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Qr()),
                      );
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          border:
                              Border.all(width: 1, color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: const <BoxShadow>[
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(1.0, 6.0),
                              blurRadius: 10.0,
                            ),
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "Generate Warrant Card",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              Icon(Icons.arrow_forward_ios)
                            ]),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: (() {
                      Navigator.pushNamed(context, My_Routes.warranypage);
                    }),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          border:
                              Border.all(width: 1, color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: const <BoxShadow>[
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(1.0, 6.0),
                              blurRadius: 10.0,
                            ),
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "Warranty Cards",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              Icon(Icons.arrow_forward_ios)
                            ]),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        border:
                            Border.all(width: 1, color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: const <BoxShadow>[
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(1.0, 6.0),
                            blurRadius: 10.0,
                          ),
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DistributerNav(
                                      selectedIndex: 2,
                                    )),
                          );
                        },
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "Orders",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              Icon(Icons.arrow_forward_ios)
                            ]),
                      ),
                    ),
                  ),
                ),
              ]),
        ),
      );
    } else if (userCred.getUserType() == "4" || userCred.getUserType() == "5") {
      return Container();
    }
  }

  @override
  void initState() {
    // getUserDetail();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // InkWell(
            //   onTap: () {
            //     Navigator.pushNamed(context, My_Routes.editProfile);
            //   },
            //   child: Container(
            //     color: Custom_colors.skyblue,
            //     height: 80,
            //     width: MediaQuery.of(context).size.width,
            //     child: Image.asset("assets/logo2.png"),
            //   ),
            // ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 60,
                  color: Colors.red,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                            "My Profile",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        )
                      ]),
                ),
                Positioned(
                  top: 20,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () async {
                            try {
                              FilePickerResult? result =
                                  await FilePicker.platform.pickFiles();
                              if (result != null) {
                                File file = File(result.files.single.path!);
                                print(file.path);
                                setState(() {
                                  profileImage = file;
                                  List<int> imageBytes =
                                      profileImage!.readAsBytesSync();
                                  print(imageBytes);
                                  base64Image = base64Encode(imageBytes);
                                });
                                // showProgressDialog(context);
                                // HomeApi _api = HomeApi();
                                // Map data = await _api.doUploadProfile(
                                //     file, userCred.getUserId());
                                // print(data);
                                //   if (data['response'] == 1) {
                                //     positiveToast(data['msg']);
                                //     setState(() {});

                                //     // homebloc.fetchuserDetails();
                                //   } else {
                                //     negetiveToast(data['msg']);
                                //   }
                                //   Navigator.pop(context);
                                // } else {
                                //   negetiveToast("Something went wrong");
                                //   // User canceled the picker
                              }
                            } catch (e) {
                              negetiveToast(e.toString());
                            }
                          },
                          child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 50,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 60,
                                    width: 60,
                                    child: profileImage == null
                                        ? const Icon(
                                            Icons.person,
                                            size: 72,
                                            color: Colors.black26,
                                          )
                                        : Image.file(
                                            profileImage!,
                                            fit: BoxFit.cover,
                                          ),
                                  ),
                                  const Icon(Icons.camera_alt)
                                ],
                              )),
                        ),
                        Text(
                          userCred.getName(),
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [fun()],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        userCred.getMob(),
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        child: Text(
                          userCred.getEmail(),
                          maxLines: 3,
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: const [
                  //     Text(
                  //       "Delete Account",
                  //       style: TextStyle(
                  //           fontSize: 18,
                  //           fontWeight: FontWeight.bold,
                  //           color: Colors.red),
                  //     ),
                  //     Icon(Icons.delete, color: Colors.red)
                  //   ],
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, My_Routes.editProfile);
                          },
                          child: const Text(
                            "Edit Profile",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.red),
                          ),
                        ),
                      ),
                      const Icon(Icons.edit, color: Colors.red)
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Divider(
              thickness: 5,
            ),
            fun2(),

            // if (userCred.getUserType() == "4" || userCred.getUserType() == "5")
            //   userCred.getUserType() != "4" ||
            //           userCred.getUserType() != "5" ||
            //           userCred.getUserType() != "1"
            //       ? Padding(
            //           padding: const EdgeInsets.all(8.0),
            //           child: Card(
            //             child: Column(
            //                 mainAxisAlignment: MainAxisAlignment.start,
            //                 crossAxisAlignment: CrossAxisAlignment.start,
            //                 children: [
            //                   const Padding(
            //                     padding: EdgeInsets.all(15.0),
            //                     child: Text(
            //                       "Personalization",
            //                       style: TextStyle(
            //                           fontSize: 23,
            //                           fontWeight: FontWeight.bold,
            //                           color: Colors.black),
            //                     ),
            //                   ),
            //                   Padding(
            //                     padding: const EdgeInsets.all(8.0),
            //                     child: InkWell(
            //                       onTap: (() {
            //                         Navigator.pushNamed(
            //                             context, My_Routes.dealerScheme);
            //                       }),
            //                       child: Container(
            //                         height: 50,
            //                         decoration: BoxDecoration(
            //                             border: Border.all(
            //                                 width: 1,
            //                                 color: Colors.grey.shade400),
            //                             borderRadius: BorderRadius.circular(10),
            //                             color: Colors.white,
            //                             boxShadow: const <BoxShadow>[
            //                               BoxShadow(
            //                                 color: Colors.grey,
            //                                 offset: Offset(1.0, 6.0),
            //                                 blurRadius: 10.0,
            //                               ),
            //                             ]),
            //                         child: Padding(
            //                           padding: const EdgeInsets.all(8.0),
            //                           child: Row(
            //                               mainAxisAlignment:
            //                                   MainAxisAlignment.spaceBetween,
            //                               children: const [
            //                                 Text(
            //                                   "Schemes",
            //                                   style: TextStyle(
            //                                       fontSize: 14,
            //                                       fontWeight: FontWeight.bold,
            //                                       color: Colors.black),
            //                                 ),
            //                                 Icon(Icons.arrow_forward_ios)
            //                               ]),
            //                         ),
            //                       ),
            //                     ),
            //                   ),
            //                   Padding(
            //                     padding: const EdgeInsets.all(8.0),
            //                     child: Container(
            //                       height: 50,
            //                       decoration: BoxDecoration(
            //                           border: Border.all(
            //                               width: 1,
            //                               color: Colors.grey.shade400),
            //                           borderRadius: BorderRadius.circular(10),
            //                           color: Colors.white,
            //                           boxShadow: const <BoxShadow>[
            //                             BoxShadow(
            //                               color: Colors.grey,
            //                               offset: Offset(1.0, 6.0),
            //                               blurRadius: 10.0,
            //                             ),
            //                           ]),
            //                       child: Padding(
            //                         padding: const EdgeInsets.all(8.0),
            //                         child: InkWell(
            //                           onTap: () {
            //                             Navigator.pushNamed(
            //                                 context, My_Routes.dealerRewards);
            //                           },
            //                           child: Row(
            //                               mainAxisAlignment:
            //                                   MainAxisAlignment.spaceBetween,
            //                               children: const [
            //                                 Text(
            //                                   "Rewords",
            //                                   style: TextStyle(
            //                                       fontSize: 14,
            //                                       fontWeight: FontWeight.bold,
            //                                       color: Colors.black),
            //                                 ),
            //                                 Icon(Icons.arrow_forward_ios)
            //                               ]),
            //                         ),
            //                       ),
            //                     ),
            //                   ),
            //                 ]),
            //           ),
            //         )
            //       : Padding(
            //           padding: const EdgeInsets.all(8.0),
            //           child: Card(
            //             child: Column(
            //                 mainAxisAlignment: MainAxisAlignment.start,
            //                 crossAxisAlignment: CrossAxisAlignment.start,
            //                 children: [
            //                   const Padding(
            //                     padding: EdgeInsets.all(15.0),
            //                     child: Text(
            //                       "Personalization",
            //                       style: TextStyle(
            //                           fontSize: 23,
            //                           fontWeight: FontWeight.bold,
            //                           color: Colors.black),
            //                     ),
            //                   ),
            //                   Padding(
            //                     padding: const EdgeInsets.all(8.0),
            //                     child: InkWell(
            //                       onTap: () {
            //                         Navigator.push(
            //                           context,
            //                           MaterialPageRoute(
            //                               builder: (context) => const Qr()),
            //                         );
            //                       },
            //                       child: Container(
            //                         height: 50,
            //                         decoration: BoxDecoration(
            //                             border: Border.all(
            //                                 width: 1,
            //                                 color: Colors.grey.shade400),
            //                             borderRadius: BorderRadius.circular(10),
            //                             color: Colors.white,
            //                             boxShadow: const <BoxShadow>[
            //                               BoxShadow(
            //                                 color: Colors.grey,
            //                                 offset: Offset(1.0, 6.0),
            //                                 blurRadius: 10.0,
            //                               ),
            //                             ]),
            //                         child: Padding(
            //                           padding: const EdgeInsets.all(8.0),
            //                           child: Row(
            //                               mainAxisAlignment:
            //                                   MainAxisAlignment.spaceBetween,
            //                               children: const [
            //                                 Text(
            //                                   "Generate Warrant Card",
            //                                   style: TextStyle(
            //                                       fontSize: 14,
            //                                       fontWeight: FontWeight.bold,
            //                                       color: Colors.black),
            //                                 ),
            //                                 Icon(Icons.arrow_forward_ios)
            //                               ]),
            //                         ),
            //                       ),
            //                     ),
            //                   ),
            //                   Padding(
            //                     padding: const EdgeInsets.all(8.0),
            //                     child: InkWell(
            //                       onTap: (() {
            //                         Navigator.pushNamed(
            //                             context, My_Routes.warranypage);
            //                       }),
            //                       child: Container(
            //                         height: 50,
            //                         decoration: BoxDecoration(
            //                             border: Border.all(
            //                                 width: 1,
            //                                 color: Colors.grey.shade400),
            //                             borderRadius: BorderRadius.circular(10),
            //                             color: Colors.white,
            //                             boxShadow: const <BoxShadow>[
            //                               BoxShadow(
            //                                 color: Colors.grey,
            //                                 offset: Offset(1.0, 6.0),
            //                                 blurRadius: 10.0,
            //                               ),
            //                             ]),
            //                         child: Padding(
            //                           padding: const EdgeInsets.all(8.0),
            //                           child: Row(
            //                               mainAxisAlignment:
            //                                   MainAxisAlignment.spaceBetween,
            //                               children: const [
            //                                 Text(
            //                                   "Warranty Cards",
            //                                   style: TextStyle(
            //                                       fontSize: 14,
            //                                       fontWeight: FontWeight.bold,
            //                                       color: Colors.black),
            //                                 ),
            //                                 Icon(Icons.arrow_forward_ios)
            //                               ]),
            //                         ),
            //                       ),
            //                     ),
            //                   ),
            //                   Padding(
            //                     padding: const EdgeInsets.all(8.0),
            //                     child: Container(
            //                       height: 50,
            //                       decoration: BoxDecoration(
            //                           border: Border.all(
            //                               width: 1,
            //                               color: Colors.grey.shade400),
            //                           borderRadius: BorderRadius.circular(10),
            //                           color: Colors.white,
            //                           boxShadow: const <BoxShadow>[
            //                             BoxShadow(
            //                               color: Colors.grey,
            //                               offset: Offset(1.0, 6.0),
            //                               blurRadius: 10.0,
            //                             ),
            //                           ]),
            //                       child: Padding(
            //                         padding: const EdgeInsets.all(8.0),
            //                         child: InkWell(
            //                           onTap: () {
            //                             Navigator.push(
            //                               context,
            //                               MaterialPageRoute(
            //                                   builder: (context) =>
            //                                       DistributerNav(
            //                                         selectedIndex: 2,
            //                                       )),
            //                             );
            //                           },
            //                           child: Row(
            //                               mainAxisAlignment:
            //                                   MainAxisAlignment.spaceBetween,
            //                               children: const [
            //                                 Text(
            //                                   "Orders",
            //                                   style: TextStyle(
            //                                       fontSize: 14,
            //                                       fontWeight: FontWeight.bold,
            //                                       color: Colors.black),
            //                                 ),
            //                                 Icon(Icons.arrow_forward_ios)
            //                               ]),
            //                         ),
            //                       ),
            //                     ),
            //                   ),
            //                 ]),
            //           ),
            //         ),

            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                "Account Setting",
                style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(
                      context, My_Routes.interiorchangepassword);
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: const <BoxShadow>[
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(1.0, 6.0),
                          blurRadius: 10.0,
                        ),
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Change Password",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          Icon(Icons.arrow_forward_ios)
                        ]),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, My_Routes.aboutUs);
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: const <BoxShadow>[
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(1.0, 6.0),
                          blurRadius: 10.0,
                        ),
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "About Us",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          Icon(Icons.arrow_forward_ios)
                        ]),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: const <BoxShadow>[
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(1.0, 6.0),
                        blurRadius: 10.0,
                      ),
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      userCred.logoutUser();

                      Navigator.of(context).pushNamedAndRemoveUntil(
                        My_Routes.login2,
                        ModalRoute.withName(My_Routes.splashRoute),
                      );
                    },
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Logout",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          Icon(Icons.arrow_forward_ios)
                        ]),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
