import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vinayakply/api/registerapi.dart';
import 'package:vinayakply/custom_color.dart';
import 'package:vinayakply/routes.dart';
import 'package:vinayakply/usertypeModel.dart';
import 'package:vinayakply/util/shearfunctions.dart';

class Registration extends StatefulWidget {
  const Registration({
    Key? key,
  }) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  // late usertypeModel selectedUser;
  //List<usertypeModel> usertype = <usertypeModel>[];//[const usertypeModel(1,'Foo'), const usertypeModel(2,'Bar')];
  List<usertypeModel> usertype = <usertypeModel>[];
  //List usertypenew

  TextEditingController dateinput = TextEditingController();
  TextEditingController anniversaryControler = TextEditingController();
  @override
  void initState() {
    dateinput.text = "";
    // selectedUser=usertype[0];
    // sslectuserr = userType[0]["usertype"];
    geturrtype();
    getStateID();
    super.initState();
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpassController = TextEditingController();
  TextEditingController dealershopController = TextEditingController();
  TextEditingController user_nameController = TextEditingController();
  TextEditingController refralcontrolar = TextEditingController();
  TextEditingController addresscontroler = TextEditingController();
  TextEditingController altmobliecontroler = TextEditingController();
  bool isChecked = false;
  File? profileImage;
  String base64Image = "";
  String userTypeId = "";
  String maritalstatus = 'Marital Status';
  var items1 = ['Marital Status', 'Married', 'Unmarried'];
  String stateId = "";
  String cityid = "";

  String state = 'Select State';
  var items2 = ['Select State', 'Delhi', 'UP'];
  String sslectuserr = "User Type";
  String selectState = "Select State";
  String setectCity = "Select City";
  String city = 'Select city';
  List state_list = [];
  List city_list = [];
  var items3 = ['Select city', 'Delhi', 'Mumbai'];
  List userType = [];
  geturrtype() async {
    try {
      RegisterApi registerApi = RegisterApi();
      List data = await registerApi.getUserType();
      setState(() {
        userType = data;
      });
      // for (var i = 0; i < userType.length; i++) {
      //   setState(() {
      //     userType.add(data[i]['status_id']);
      //   });
      // }
      log("dfgdj$userType");
    } catch (e) {
      print(e);
    }
  }

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
  // void _getusertype() async {
  //   try {
  //     Response response = await post(
  //         Uri.parse("${My_Routes.server_path}all_usertype.php"),
  //         body: {
  //           //'UserName': mobile
  //         });
  //     // print(response.body);
  //     // print(response.statusCode);

  //     if (response.statusCode == 200) {
  //       var tagsJson = jsonDecode(response.body.toString());
  //       List? tags = tagsJson != null ? List.from(tagsJson) : null;

  //       for (int a = 0; a < tagsJson.length; a++) {
  //         usertype.add(usertypeModel(tags![a].getString("usertype_id"),
  //             tags[a].getString("usertype")));
  //         // String user =tags![a]["usertype"];
  //         // usertypeModel(1,user);
  //       }
  //     } else {
  //       print('Something went wrong');
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }
  String mobile = "";
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    // _getusertype();
    Map data = ModalRoute.of(context)!.settings.arguments as Map;
    print("${data['mobile']}}-------------123");
    mobile = data['mobile'];

    // final arg =
    //     ModalRoute.of(context)!.settings.arguments as Map<dynamic, dynamic>;
    // mobile = arg['mobile'];
    mobileController.text = mobile;
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Image.asset("assets/logo2.png", fit: BoxFit.cover),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                height: 1400,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25),
                      topLeft: Radius.circular(25)),
                  gradient: LinearGradient(
                      colors: [
                        Custom_colors.redlight,
                        Colors.white,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      tileMode: TileMode.clamp),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Text("Personal Information",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    const SizedBox(
                      height: 10,
                    ),
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
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 14.0, horizontal: 20.0),
                      child: Column(
                        children: [
                          Container(
                            width: 500,
                            height: 48,
                            padding: const EdgeInsets.all(10.0),
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                              color: Colors.white,
                            ),
                            child: DropdownButton(
                              underline: Container(),
                              isExpanded: true,
                              hint: Text(sslectuserr),
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: userType.map((userType) {
                                return DropdownMenuItem<dynamic>(
                                  value: userType,
                                  child: Text(
                                    userType['usertype'].toString(),
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                );
                              }).toList(),
                              onChanged: ((value) {
                                setState(() {
                                  sslectuserr = value['usertype'].toString();
                                  userTypeId = value['usertype_id'].toString();
                                  log(userTypeId);
                                  // log(value['usertype'].toString());
                                });
                              }),

                              // },
                            ),
                          ),

                          const SizedBox(
                            height: 9,
                          ),
                          sslectuserr == "Dristributer"
                              ? TextFormField(
                                  keyboardType: TextInputType.name,
                                  controller: dealershopController,
                                  decoration: const InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: "Enter Shop Name",
                                    labelText: "Enter Shop Name",
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(12)),
                                    ),
                                    prefixIcon: Align(
                                      widthFactor: 1.0,
                                      heightFactor: 1.0,
                                      child: Icon(Icons.phone,
                                          color: Colors.black),
                                    ),
                                  ),
                                )
                              : Container(),

                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            maxLength: 10,
                            keyboardType: TextInputType.number,
                            controller: mobileController,
                            decoration: const InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              hintText: "Enter Mobile Number",
                              labelText: "Enter Mobile Number",
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                              ),
                              prefixIcon: Align(
                                widthFactor: 1.0,
                                heightFactor: 1.0,
                                child: Icon(Icons.person, color: Colors.black),
                              ),
                            ),
                          ),

                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.name,
                            controller: user_nameController,
                            decoration: const InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              hintText: "Name",
                              labelText: "Enter Name",
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                              ),
                              prefixIcon: Align(
                                widthFactor: 1.0,
                                heightFactor: 1.0,
                                child: Icon(Icons.person, color: Colors.black),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: emailController,
                            decoration: const InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              hintText: "Email",
                              labelText: "Enter Email id",
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                              ),
                              prefixIcon: Align(
                                widthFactor: 1.0,
                                heightFactor: 1.0,
                                child: Icon(Icons.email, color: Colors.black),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextField(
                            controller: dateinput,
                            decoration: const InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)),
                                ),
                                prefixIcon: Align(
                                  widthFactor: 1.0,
                                  heightFactor: 1.0,
                                  child: Icon(
                                    Icons.calendar_today,
                                    color: Colors.black,
                                  ),
                                ), //icon of text field
                                labelText:
                                    "Enter Date date of birth" //label text of field
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
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 500,
                            height: 48,
                            padding: const EdgeInsets.all(10.0),
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
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
                          const SizedBox(
                            height: 10,
                          ),
                          const SizedBox(
                            height: 10,
                          ),

                          if (maritalstatus == "Married")
                            TextField(
                              controller: anniversaryControler,
                              decoration: const InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                  ),
                                  prefixIcon: Align(
                                    widthFactor: 1.0,
                                    heightFactor: 1.0,
                                    child: Icon(
                                      Icons.calendar_today,
                                      color: Colors.black,
                                    ),
                                  ), //icon of text field
                                  labelText:
                                      "Enter Anniversary Date" //label text of field
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
                                      DateFormat('yyyy-MM-dd')
                                          .format(pickedDate);
                                  print(formattedDate);
                                  setState(() {
                                    dateinput.text = formattedDate;
                                  });
                                } else {
                                  print("Date is not selected");
                                }
                              },
                            ),
                          const SizedBox(
                            height: 10,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            maxLength: 10,
                            keyboardType: TextInputType.number,
                            controller: altmobliecontroler,
                            decoration: const InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              hintText: "Alternate Mobile",
                              labelText: "Enter alternate mobile no.",
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                              ),
                              prefixIcon: Align(
                                widthFactor: 1.0,
                                heightFactor: 1.0,
                                child: Icon(Icons.phone, color: Colors.black),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: refralcontrolar,
                            decoration: const InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              hintText: "Referal code",
                              labelText: "Enter referal code(optional)",
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                              ),
                              prefixIcon: Align(
                                widthFactor: 1.0,
                                heightFactor: 1.0,
                                child: Icon(Icons.note, color: Colors.black),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.name,
                            controller: addresscontroler,
                            decoration: const InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              hintText: "Local address",
                              labelText: "Enter local address",
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                              ),
                              prefixIcon: Align(
                                widthFactor: 1.0,
                                heightFactor: 1.0,
                                child: Icon(Icons.location_on,
                                    color: Colors.black),
                              ),
                            ),
                          ),

                          // start of test code

                          //end of test code

                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 500,
                            height: 48,
                            padding: const EdgeInsets.all(10.0),
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
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
                                  // log(value['state_title'].toString());
                                });
                              }),

                              // },
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 500,
                            height: 48,
                            padding: const EdgeInsets.all(10.0),
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
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
                                  // log(value['state_title'].toString());
                                });
                              }),

                              // },
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: passwordController,
                            decoration: const InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              hintText: "Password",
                              labelText: "Create Password",
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                              ),
                              prefixIcon: Align(
                                widthFactor: 1.0,
                                heightFactor: 1.0,
                                child: Icon(Icons.lock, color: Colors.black),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Checkbox(
                                checkColor: Colors.white,
                                //fillColor: MaterialStateProperty.resolveWith(getColor),
                                value: isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isChecked = value!;
                                  });
                                },
                              ),
                              const Text('I agree with terms and conditions. '),
                              InkWell(
                                onTap: () {
                                  _launchtwitterUrl(
                                      "https://vinayakply.in/privacy_policy.php");
                                },
                                child: const Text(
                                  'Read',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                          loading == false
                              ? SizedBox(
                                  width: 340,
                                  height: 48,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      backgroundColor:
                                          Colors.black, // foreground
                                    ),
                                    onPressed: () async {
                                      // Navigator.pushNamed(
                                      //     context, My_Routes.dealerMainHome);

                                      if (isChecked == false) {
                                        Fluttertoast.showToast(
                                            msg:
                                                "Term and condition not agree!",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor: Colors.red,
                                            textColor: Colors.white,
                                            fontSize: 16.0);

                                        return;
                                      }
                                      // else if (nameController.text == "") {
                                      //   Fluttertoast.showToast(
                                      //       msg: "Invalid name!",
                                      //       toastLength: Toast.LENGTH_SHORT,
                                      //       gravity: ToastGravity.BOTTOM,
                                      //       timeInSecForIosWeb: 1,
                                      //       backgroundColor: Colors.red,
                                      //       textColor: Colors.white,
                                      //       fontSize: 16.0);

                                      //   return;
                                      // }
                                      else if (emailController.text == "") {
                                        Fluttertoast.showToast(
                                            msg: "Invalid email!!",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor: Colors.red,
                                            textColor: Colors.white,
                                            fontSize: 16.0);

                                        return;
                                      } else if (mobileController.text == "") {
                                        Fluttertoast.showToast(
                                            msg: "Invalid phone number!!",
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

                                      RegisterApi Registerapi = RegisterApi();
                                      try {
                                        dynamic data =
                                            await Registerapi.signUpApi(
                                                usertype: userTypeId,
                                                name: user_nameController.text,
                                                email: emailController.text,
                                                mobile_no:
                                                    mobileController.text,
                                                street_address:
                                                    addresscontroler.text,
                                                state_id: stateId,
                                                city_id: cityid,
                                                password:
                                                    passwordController.text,
                                                userpic: base64Image,
                                                dob: dateinput.text.toString(),
                                                gender: "M",
                                                anniversary:
                                                    anniversaryControler.text
                                                        .toString(),
                                                shopname:
                                                    dealershopController.text,
                                                user_alt_mobile_no:
                                                    altmobliecontroler.text,
                                                merital_status: maritalstatus);

                                        if (data["success"] == "1") {
                                          //  userCred.addUserId(data["user"]["_id"]);
                                          setState(() {
                                            loading = false;
                                          });
                                          Future.delayed(
                                              const Duration(seconds: 0), () {
                                            Navigator.pushNamed(
                                                context, My_Routes.login2);
                                          });
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
                                    },
                                    child: const Text(
                                      "Register",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                  ),
                                )
                              : const Center(
                                  child: CircularProgressIndicator()),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  void _launchtwitterUrl(String twitterUrl) async {
    if (!await launchUrl(Uri.parse(
      twitterUrl,
    ))) throw 'Could not launch $twitterUrl';
  }
}
