import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../api/interiorApi.dart';
import '../api/registerapi.dart';
import '../constfile.dart/textfil.dart';

class InteriorAddEnquaey extends StatefulWidget {
  const InteriorAddEnquaey({super.key});

  @override
  State<InteriorAddEnquaey> createState() => _InteriorAddEnquaeyState();
}

class _InteriorAddEnquaeyState extends State<InteriorAddEnquaey> {
  TextEditingController projectController = TextEditingController();
  TextEditingController siteNameController = TextEditingController();
  TextEditingController persionNameController = TextEditingController();
  TextEditingController MobileNumberController = TextEditingController();
  TextEditingController emaniIdController = TextEditingController();
  TextEditingController fullAddressController = TextEditingController();
  TextEditingController commentController = TextEditingController();
  String selectState = "Select State";
  String setectCity = "Select City";
  String slectProjecType = "Project Type";
  String city = 'Select city';
  List state_list = [];
  List city_list = [];
  List poject_list = [];
  String stateId = "";
  String prjectid = "";
  String cityid = "";
  bool loading = false;
  getStateID() async {
    try {
      RegisterApi registerApi = RegisterApi();
      List data = await registerApi.getState();
      setState(() {
        state_list = data;
      });

      log("dfgdj$state_list");
    } catch (e) {
      print(e);
    }
  }

  getCityList(sId) async {
    try {
      RegisterApi registerApi = RegisterApi();
      List data = await registerApi.getCityList(state_id: sId);
      setState(() {
        city_list = data;
      });

      log("dfgdj$state_list");
    } catch (e) {
      print(e);
    }
  }

  getProjectList() async {
    try {
      InteriorApi interiorApi = InteriorApi();
      List data = await interiorApi.getProjectApi();
      setState(() {
        poject_list = data;
      });

      log("dfgdj$poject_list");
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getStateID();
    getProjectList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 139, 183, 220),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 139, 183, 220),
        title: const Text("Add Enquiry"),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 500,
              height: 48,
              padding: const EdgeInsets.all(10.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                color: Colors.white,
              ),
              child: DropdownButton(
                underline: Container(),
                isExpanded: true,
                hint: Text(slectProjecType),
                icon: const Icon(Icons.keyboard_arrow_down),
                items: poject_list.map((pojectList) {
                  return DropdownMenuItem<dynamic>(
                    value: pojectList,
                    child: Text(
                      pojectList['projecttype'].toString(),
                      style: const TextStyle(color: Colors.black),
                    ),
                  );
                }).toList(),
                onChanged: ((value) {
                  setState(() {
                    slectProjecType = value['projecttype'].toString();
                    prjectid = value['id'].toString();
                  });
                }),

                // },
              ),
            ),
          ),
          // FormTTextFild(
          //   controller: projectController,
          //   hinttext: "Enter Hotel",
          // ),
          FormTTextFild(
            controller: siteNameController,
            hinttext: "Enter Site Name",
          ),
          FormTTextFild(
            controller: persionNameController,
            hinttext: "Enter Meet Person Name",
          ),
          FormTTextFild(
            keyboardType: TextInputType.number,
            maxLength: 10,
            controller: MobileNumberController,
            hinttext: "Enter Mobile Number",
          ),
          FormTTextFild(
            controller: emaniIdController,
            hinttext: "Enter Email Id",
          ),
          FormTTextFild(
            controller: fullAddressController,
            hinttext: "Enter Full Address",
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Container(
              width: 500,
              height: 48,
              padding: const EdgeInsets.all(10.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                color: Colors.white,
              ),
              child: DropdownButton(
                underline: Container(),
                isExpanded: true,
                hint: Text(selectState),
                icon: const Icon(Icons.keyboard_arrow_down),
                items: state_list.map((stateList) {
                  return DropdownMenuItem<dynamic>(
                    value: stateList,
                    child: Text(
                      stateList['state_title'].toString(),
                      style: const TextStyle(color: Colors.black),
                    ),
                  );
                }).toList(),
                onChanged: ((value) {
                  setState(() {
                    selectState = value['state_title'].toString();
                    stateId = value['state_id'].toString();

                    getCityList(value['state_id'].toString());
                    log(value['state_title'].toString());
                  });
                }),

                // },
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 500,
              height: 48,
              padding: const EdgeInsets.all(10.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                color: Colors.white,
              ),
              child: DropdownButton(
                underline: Container(),
                isExpanded: true,
                hint: Text(setectCity),
                icon: const Icon(Icons.keyboard_arrow_down),
                items: city_list.map((cityList) {
                  return DropdownMenuItem<dynamic>(
                    value: cityList,
                    child: Text(
                      cityList['name'].toString(),
                      style: const TextStyle(color: Colors.black),
                    ),
                  );
                }).toList(),
                onChanged: ((value) {
                  setState(() {
                    setectCity = value['name'].toString();
                    cityid = value['id'].toString();
                    log(value['state_title'].toString());
                  });
                }),

                // },
              ),
            ),
          ),
          FormTTextFild(
            controller: commentController,
            maxLines: 10,
            hinttext: "Enter Your Comment",
          ),
          const SizedBox(
            height: 20,
          ),
          loading == false
              ? Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: InkWell(
                    onTap: () async {
                      if ((MobileNumberController.text).length <= 9) {
                        // print("${(phonecontroller.text).length <= 9}");
                        Fluttertoast.showToast(
                            msg: "Invalid phone no!",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);

                        return;
                      } else if (siteNameController.text == "") {
                        Fluttertoast.showToast(
                            msg: "Invalid Site Name!",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);

                        return;
                      } else if (persionNameController.text == "") {
                        Fluttertoast.showToast(
                            msg: "Invalid Person Name!",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);

                        return;
                      } else if (prjectid == "") {
                        Fluttertoast.showToast(
                            msg: "Invalid Project Name!",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);

                        return;
                      } else if (emaniIdController.text == "") {
                        Fluttertoast.showToast(
                            msg: "Invalid email id!",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);

                        return;
                      } else if (fullAddressController.text == "") {
                        Fluttertoast.showToast(
                            msg: "Invalid full address!",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);

                        return;
                      } else if (fullAddressController.text == "") {
                        Fluttertoast.showToast(
                            msg: "Invalid Comments!",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);

                        return;
                      }
                      setState(() {
                        loading = true;
                      });

                      InteriorApi interiorApi = InteriorApi();
                      try {
                        Map data = await interiorApi.SubmitInqury(
                            mobile: MobileNumberController.text,
                            name: persionNameController.text,
                            site_name: siteNameController.text,
                            email: emaniIdController.text,
                            stateid: stateId,
                            cityid: cityid,
                            project_type: prjectid,
                            address: fullAddressController.text,
                            comment: commentController.text);
                        print(data["status"].runtimeType);

                        if (data["success"].toString() == "1") {
                          Navigator.pop(context);
                          //  userCred.addUserId(data["user"]["_id"]);
                          setState(() {
                            loading = false;
                          });
                          Fluttertoast.showToast(
                              msg: " ${data['message']}! ",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                          setState(() {
                            loading = false;
                          });

                          Future.delayed(const Duration(seconds: 0), () {});
                        } else {
                          setState(() {
                            loading = false;
                          });
                          Fluttertoast.showToast(
                              msg: " ${data['message']}! ",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                          setState(() {
                            loading = false;
                          });
                        }
                      } catch (e) {}
                      // Navigator.pushReplacementNamed(context, '/main');
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width - 20,
                      height: 48,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(12)),
                      child: const Center(
                        child: Text(
                          "Create Enquiry",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                )
              : const Center(child: CircularProgressIndicator()),
        ]),
      ),
    );
  }
}
