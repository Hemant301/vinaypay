import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../api/registerapi.dart';
import '../maindistributer.dart/distbuterapi.dart';
import '../untitled folder/scanQr.dart';

class WarranyCardDetails extends StatefulWidget {
  const WarranyCardDetails({super.key});

  @override
  State<WarranyCardDetails> createState() => _WarranyCardDetailsState();
}

class _WarranyCardDetailsState extends State<WarranyCardDetails> {
  TextEditingController mobileController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController serialController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  String selectState = "Select State";
  String setectCity = "Select City";
  List state_list = [];
  List city_list = [];
  List poject_list = [];
  String stateId = "";
  String cityid = "";
  List waranty_data = [];
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

  getwarantyDetail() async {
    try {
      DistubuterApi distubuterApi = DistubuterApi();
      List data = await distubuterApi.getwarantyDetail();
      setState(() {
        waranty_data = data;
      });

      log("dfgdj$waranty_data");
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    getwarantyDetail();
    getStateID();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: const Text(
          'Warranty Card Details',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Qr()),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Icon(Icons.qr_code),
                  Text(
                    'Add More',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 10),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Column(
            children: List.generate(
              waranty_data.length,
              (index) => Padding(
                padding: const EdgeInsets.all(15.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${waranty_data[index]["prodcut_name"]}',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                            Text(
                              '${waranty_data[index]["my_qr"]}',
                              style: const TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${waranty_data[index]["brand_name"]}',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                            Text(
                              '${waranty_data[index]["expiry"]}',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () async {
                              DistubuterApi distubuterApi = DistubuterApi();
                              try {
                                Map data =
                                    await distubuterApi.removeWarrantyCard(
                                        qrid: waranty_data[index]['my_qr']
                                            .toString());
                                print(data["status"].runtimeType);

                                if (data["status"].toString() == "1") {
                                  setState(() {
                                    getwarantyDetail();
                                    loading = false;
                                  });
                                  Fluttertoast.showToast(
                                      msg: " ${data['response']}! ",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.green,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                  setState(() {
                                    loading = false;
                                  });
                                } else {
                                  setState(() {
                                    loading = false;
                                  });
                                  Fluttertoast.showToast(
                                      msg: " ${data['response']}! ",
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
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(25)),
                              height: 25,
                              width: 80,
                              child: const Center(
                                child: Text(
                                  "Remove Card",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ]),
                  ),
                ),
              ),
            ),
          ),

          Textfiless(
            controller: mobileController,
            title: "Enter Mobile Number",
          ),
          Textfiless(
            controller: nameController,
            title: "Enter Name",
          ),
          Textfiless(
            controller: addressController,
            title: "Enter Full Address",
          ),
          Textfiless(
            controller: pincodeController,
            title: "Enter PinCode",
          ),
          // Textfiless(
          //   controller: serialController,
          //   title: "Enter Serial Number",
          // ),

          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              width: 500,
              height: 48,
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5),
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
          // const SizedBox(
          //   height: 10,
          // ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              width: 500,
              height: 48,
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5),
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

          loading == false
              ? Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: InkWell(
                    onTap: () async {
                      if (nameController.text == "") {
                        Fluttertoast.showToast(
                            msg: "Invalid  Name!",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);

                        return;
                      } else if (mobileController.text == "") {
                        Fluttertoast.showToast(
                            msg: "Invalid  mobile number",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);

                        return;
                      } else if (addressController.text == "") {
                        Fluttertoast.showToast(
                            msg: "Invalid address!",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);

                        return;
                      } else if (pincodeController.text == "") {
                        Fluttertoast.showToast(
                            msg: "Invalid pincode",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);

                        return;
                      }
                      //  else if (serialController.text == "") {
                      //   Fluttertoast.showToast(
                      //       msg: "Invalid serial number !",
                      //       toastLength: Toast.LENGTH_SHORT,
                      //       gravity: ToastGravity.BOTTOM,
                      //       timeInSecForIosWeb: 1,
                      //       backgroundColor: Colors.red,
                      //       textColor: Colors.white,
                      //       fontSize: 16.0);

                      //   return;
                      // }
                      else if (cityid == "") {
                        Fluttertoast.showToast(
                            msg: "Invalid city!",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);

                        return;
                      } else if (stateId == "") {
                        Fluttertoast.showToast(
                            msg: "Invalid state!",
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
                      DistubuterApi distubuterApi = DistubuterApi();

                      try {
                        Map data = await distubuterApi.gentatewarantyCard(
                          mobile_no: mobileController.text,
                          name: nameController.text,
                          street_address: addressController.text,
                          pincode: pincodeController.text,
                          state: stateId,
                          city: cityid,
                        );
                        print(data["status"].runtimeType);

                        if (data["success"].toString() == "1") {
                          Navigator.pushNamed(context, "/");
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
                          "Generate Card",
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
