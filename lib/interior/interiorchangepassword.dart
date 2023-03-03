import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vinayakply/api/interiorApi.dart';

class InteriorChangePassword extends StatefulWidget {
  const InteriorChangePassword({super.key});

  @override
  State<InteriorChangePassword> createState() => _InteriorChangePasswordState();
}

class _InteriorChangePasswordState extends State<InteriorChangePassword> {
  bool loading = false;
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController conformPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("Change Password"),
      ),
      body: Column(children: [
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: TextFormField(
            controller: oldPasswordController,
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
              labelText: "Enter Old Password",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(26.0)),
                  borderSide: BorderSide(color: Colors.white24)),
              prefixIcon: Align(
                widthFactor: 0.6,
                heightFactor: 1.0,
                child: Icon(
                  Icons.phone,
                ),
              ),
            ),
            // validator: (value) {
            //   if (value!.isEmpty) {
            //     return 'Enter Mobile No.!';
            //   }
            //   if (value.length < 10) {
            //     return 'Enter 10 digit Mobile No.!';
            //   }
            //   return null;
            // },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: TextFormField(
            controller: newPasswordController,
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
              labelText: "Enter New Password",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(26.0)),
                  borderSide: BorderSide(color: Colors.white24)),
              prefixIcon: Align(
                widthFactor: 0.6,
                heightFactor: 1.0,
                child: Icon(
                  Icons.phone,
                ),
              ),
            ),
            // validator: (value) {
            //   if (value!.isEmpty) {
            //     return 'Enter Mobile No.!';
            //   }
            //   if (value.length < 10) {
            //     return 'Enter 10 digit Mobile No.!';
            //   }
            //   return null;
            // },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: TextFormField(
            controller: conformPasswordController,
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
              labelText: "Enter Confirm Password",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(26.0)),
                  borderSide: BorderSide(color: Colors.white24)),
              prefixIcon: Align(
                widthFactor: 0.6,
                heightFactor: 1.0,
                child: Icon(
                  Icons.phone,
                ),
              ),
            ),
            // validator: (value) {
            //   if (value!.isEmpty) {
            //     return 'Enter Mobile No.!';
            //   }
            //   if (value.length < 10) {
            //     return 'Enter 10 digit Mobile No.!';
            //   }
            //   return null;
            // },
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        loading == true
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.all(15.0),
                child: InkWell(
                  onTap: () async {
                    if (newPasswordController.text == "") {
                      Fluttertoast.showToast(
                          msg: "Invalid new Password!",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);

                      return;
                    } else if (oldPasswordController.text == "") {
                      Fluttertoast.showToast(
                          msg: "Invalid Old Password !",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);

                      return;
                    } else if (conformPasswordController.text == "") {
                      Fluttertoast.showToast(
                          msg: "Invalid confirm Password!",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);

                      return;
                    } else if (newPasswordController.text !=
                        conformPasswordController.text) {
                      Fluttertoast.showToast(
                          msg: "password is not matched!",
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
                      Map data = await interiorApi.ChangePassword(
                          oldpassword: oldPasswordController.text,
                          newpasword: newPasswordController.text);
                      print(data["sucessCode"].runtimeType);

                      if (data["sucessCode"].toString() == "1") {
                        setState(() {
                          newPasswordController.clear();
                          oldPasswordController.clear();
                          conformPasswordController.clear();
                        });
                        //  userCred.addUserId(data["user"]["_id"]);
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
                        Future.delayed(const Duration(seconds: 0), () {
                          Navigator.pop(context);
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
                    // Navigator.pushReplacementNamed(context, '/main');
                  },
                  child: Container(
                    width: 400,
                    height: 48,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20)),
                    child: const Center(
                      child: Text(
                        "Update",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
      ]),
    );
  }
}
