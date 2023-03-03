import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:vinayakply/api/registerapi.dart';

import '../api/interiorApi.dart';
import '../constfile.dart/textfil.dart';

class EditProflie extends StatefulWidget {
  const EditProflie({super.key});

  @override
  State<EditProflie> createState() => _EditProflieState();
}

class _EditProflieState extends State<EditProflie> {
  TextEditingController mobileController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController altMoblieController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  String selectState = "Select State";
  String setectCity = "Select City";
  String city = 'Select city';
  List state_list = [];
  List city_list = [];
  String stateId = "";
  String cityid = "";
  TextEditingController dateinput = TextEditingController();
  var items1 = ['Marital Status', 'Married', 'Unmarried'];
  String maritalstatus = 'Marital Status';
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

  getUserDetail() async {
    try {
      RegisterApi registerApi = RegisterApi();
      List data = await registerApi.getUserDetails();
      setState(() {
// user_mobile_no
        mobileController.text = data[0]['user_mobile_no'].toString();
        nameController.text = data[0]['user_full_name'].toString();
        emailController.text = data[0]['user_email'].toString();
        dobController.text = data[0]['dob'].toString();
        altMoblieController.text = data[0]['alt_mobile_no'].toString();
        addressController.text = data[0]['full_address'].toString();
      });

      log("dfgdj$data");
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getStateID();
    getUserDetail();
    super.initState();
  }

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    print(mobileController.text);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 139, 183, 220),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 139, 183, 220),
        title: const Text("Edit Profile"),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(
            height: 20,
          ),
          FormTTextFild(
            controller: mobileController,
            hinttext: "Mobile Number",
          ),
          FormTTextFild(
            controller: nameController,
            hinttext: "Name",
          ),
          FormTTextFild(
            controller: emailController,
            hinttext: "Email Address",
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: dobController,
              decoration: const InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: "Enter Date date of birth",
                // border: OutlineInputBorder(
                //   borderRadius: BorderRadius.all(Radius.circular(12)),
                // ),

                prefixIcon: Align(
                  widthFactor: 1.0,
                  heightFactor: 1.0,
                  child: Icon(
                    Icons.calendar_today,
                    color: Colors.black,
                  ),
                ), //icon of text field
                // labelText: "Enter Date date of birth" //label text of field
              ),
              readOnly: true,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2101));

                if (pickedDate != null) {
                  print(pickedDate);
                  String formattedDate =
                      DateFormat('yyyy-MM-dd').format(pickedDate);
                  print(formattedDate);
                  setState(() {
                    dateinput.text = formattedDate;
                  });
                } else {
                  print("Date is not selected");
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 500,
              height: 48,
              padding: const EdgeInsets.all(10.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: Colors.white,
              ),
              child: DropdownButton(
                underline: Container(),
                isExpanded: true,
                value: maritalstatus,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: items1.map((String items1) {
                  return DropdownMenuItem(
                    value: items1,
                    child: Text(items1),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    maritalstatus = newValue!;
                  });
                },
              ),
            ),
          ),
          FormTTextFild(
            controller: altMoblieController,
            hinttext: "Enter Alt. Mobile Number",
          ),
          FormTTextFild(
            controller: addressController,
            hinttext: "Address",
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
          const SizedBox(
            height: 10,
          ),
          loading == true
              ? const Center(child: CircularProgressIndicator())
              : Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: InkWell(
                    onTap: () async {
                      if ((mobileController.text).length <= 9) {
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
                      } else if (nameController.text == "") {
                        Fluttertoast.showToast(
                            msg: "Invalid Name!",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);

                        return;
                      } else if (emailController.text == "") {
                        Fluttertoast.showToast(
                            msg: "Invalid email !",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);

                        return;
                      } else if (altMoblieController.text == "") {
                        Fluttertoast.showToast(
                            msg: "Invalid alt number !",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);

                        return;
                      } else if (dobController.text == "") {
                        Fluttertoast.showToast(
                            msg: "Invalid dob !",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);

                        return;
                      } else if (addressController.text == "") {
                        Fluttertoast.showToast(
                            msg: "Invalid full address!",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);

                        return;
                      }
                      //  else if (fullAddressController.text == "") {
                      //   Fluttertoast.showToast(
                      //       msg: "Invalid Comments!",
                      //       toastLength: Toast.LENGTH_SHORT,
                      //       gravity: ToastGravity.BOTTOM,
                      //       timeInSecForIosWeb: 1,
                      //       backgroundColor: Colors.red,
                      //       textColor: Colors.white,
                      //       fontSize: 16.0);

                      //   return;
                      // }
                      setState(() {
                        loading = true;
                      });

                      InteriorApi interiorApi = InteriorApi();
                      try {
                        Map data = await interiorApi.UpdateProfileApi(
                          mobile: mobileController.text,
                          name: nameController.text,
                          email: emailController.text,
                          user_alt_mobile_no: altMoblieController.text,
                          dob: dobController.text,
                          stateid: stateId ?? "",
                          cityid: cityid ?? "",
                          merital_status: maritalstatus ?? "",
                          address: addressController.text,
                        );
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
                      width: 400,
                      height: 48,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(12)),
                      child: const Center(
                        child: Text(
                          "Update",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
          const SizedBox(
            height: 10,
          ),
        ]),
      ),
    );
  }
}
