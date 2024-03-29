import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vinayakply/const/constant.dart';
import 'package:vinayakply/util/blog.dart';

// ${baseurl}
class RegisterApi {
  var client = http.Client();
  // Future<dynamic> getUserType() async {
  //   try {
  //     final response = await client.get(
  //       Uri.parse("$baseurl/all_usertype.php"),
  //     );

  //     if (response.statusCode == 200) {
  //       log("${response.body}dfgdfszgvdj");
  //       return jsonDecode(response.body) as List<dynamic>;
  //     } else {
  //       print('Request failed with status: ${response.statusCode}.');
  //     }
  //   } catch (e) {
  //     print(e);
  //   } finally {}
  // }
  Future<dynamic> getUserType() async {
    var client = http.Client();
    try {
      final response = await client.post(
        Uri.parse("${baseurl}all_usertype.php"),
      );
      if (response.statusCode == 200) {
        print(response.body);
        return jsonDecode(response.body);
      } else {
        print('Request failed with status: ${response.statusCode}.');
        throw "Somethiing went wrong";
      }
    } catch (e) {
      print(e);
      throw "Somethiing went wrong";
    } finally {
      client.close();
    }
  }

  Future<dynamic> getState() async {
    var client = http.Client();
    try {
      final response = await client.post(
        Uri.parse("${baseurl}all_state.php"),
      );
      if (response.statusCode == 200) {
        print(response.body);
        return jsonDecode(response.body);
      } else {
        print('Request failed with status: ${response.statusCode}.');
        throw "Somethiing went wrong";
      }
    } catch (e) {
      print(e);
      throw "Somethiing went wrong";
    } finally {
      client.close();
    }
  }

  Future<dynamic> rewordPoints() async {
    var client = http.Client();
    try {
      final response = await client
          .post(Uri.parse("${baseurl}reward.php"), body: {"userid": "35"});
      if (response.statusCode == 200) {
        print(response.body);
        return jsonDecode(response.body);
      } else {
        print('Request failed with status: ${response.statusCode}.');
        throw "Somethiing went wrong";
      }
    } catch (e) {
      print(e);
      throw "Somethiing went wrong";
    } finally {
      client.close();
    }
  }

  Future<dynamic> getCityList({
    String state_id = "",
  }) async {
    var client = http.Client();
    try {
      final response = await client.post(Uri.parse("${baseurl}all_city.php"),
          body: {"state_id": state_id});
      if (response.statusCode == 200) {
        print(response.body);
        return jsonDecode(response.body);
      } else {
        print('Request failed with status: ${response.statusCode}.');
        throw "Somethiing went wrong";
      }
    } catch (e) {
      print(e);
      throw "Somethiing went wrong";
    } finally {
      client.close();
    }
  }

  Future<dynamic> accountveryfy({
    String mobile = "",
  }) async {
    var client = http.Client();
    try {
      final response = await client.post(
          Uri.parse("${baseurl}verify-account.php"),
          body: {"UserName": mobile});
      if (response.statusCode == 200) {
        print(response.body);
        return jsonDecode(response.body);
      } else {
        print('Request failed with status: ${response.statusCode}.');
        throw "Somethiing went wrong";
      }
    } catch (e) {
      print(e);
      throw "Somethiing went wrong";
    } finally {
      client.close();
    }
  }

  Future<dynamic> getUserDetails() async {
    var client = http.Client();
    try {
      final response = await client.post(Uri.parse("${baseurl}userdetail.php"),
          body: {"userid": userCred.getUserId()});
      if (response.statusCode == 200) {
        print(response.body);
        return jsonDecode(response.body);
      } else {
        print('Request failed with status: ${response.statusCode}.');
        throw "Somethiing went wrong";
      }
    } catch (e) {
      print(e);
      throw "Somethiing went wrong";
    } finally {
      client.close();
    }
  }

  Future<dynamic> LoginApi({
    String? mobile,
    password,
  }) async {
    var client = http.Client();
    try {
      final response = await client.post(
          Uri.parse("${baseurl}login-account.php"),
          body: {"UserName": mobile, "Userpass": password});
      if (response.statusCode == 200) {
        print(response.body);
        return jsonDecode(response.body);
      } else {
        print('Request failed with status: ${response.statusCode}.');
        throw "Somethiing went wrong";
      }
    } catch (e) {
      print(e);
      throw "Somethiing went wrong";
    } finally {
      client.close();
    }
  }

  Future<dynamic> forgetApi({
    required String mobile,
  }) async {
    var client = http.Client();
    try {
      final response = await client.post(
          Uri.parse("${baseurl}forgotpassword.php"),
          body: {"UserName": mobile});
      if (response.statusCode == 200) {
        print(response.body);
        return jsonDecode(response.body);
      } else {
        print('Request failed with status: ${response.statusCode}.');
        throw "Somethiing went wrong";
      }
    } catch (e) {
      print(e);
      throw "Somethiing went wrong";
    } finally {
      client.close();
    }
  }

  Future<dynamic> schemeApi() async {
    var client = http.Client();
    try {
      final response = await client.post(Uri.parse("${baseurl}all_scheam.php"),
          body: {"state_id": userCred.getStateId()});
      if (response.statusCode == 200) {
        print(response.body);
        return jsonDecode(response.body);
      } else {
        print('Request failed with status: ${response.statusCode}.');
        throw "Somethiing went wrong";
      }
    } catch (e) {
      print(e);
      throw "Somethiing went wrong";
    } finally {
      client.close();
    }
  }

  Future<dynamic> applyonScheme(String offerid, scPoint) async {
    var client = http.Client();
    try {
      final response = await client
          .post(Uri.parse("${baseurl}participate_scheam.php"), body: {
        "userid": userCred.getUserId(),
        "offerid": offerid,
        "scheam_point": scPoint
      });
      if (response.statusCode == 200) {
        print(response.body);
        return jsonDecode(response.body);
      } else {
        print('Request failed with status: ${response.statusCode}.');
        throw "Somethiing went wrong";
      }
    } catch (e) {
      print(e);
      throw "Somethiing went wrong";
    } finally {
      client.close();
    }
  }

  Future<dynamic> signUpApi({
    String name = "",
    String usertype = "",
    String email = "",
    String mobile_no = "",
    String street_address = "",
    String state_id = "",
    String city_id = "",
    String password = "",
    String userpic = "",
    String dob = "",
    String gender = "",
    String anniversary = "",
    String shopname = "",
    String user_alt_mobile_no = "",
    String merital_status = "",
  }) async {
    var client = http.Client();
    try {
      print("body ${{
        "usertype": usertype,
        "name": name,
        "email": email,
        "mobile_no": mobile_no,
        "street_address": street_address,
        "state_id": state_id,
        "city_id": city_id,
        "password": password,
        "userpic": userpic,
        "dob": dob,
        "gender": gender,
        "anniversary": anniversary,
        "shopname": shopname,
        "user_alt_mobile_no": user_alt_mobile_no,
        "merital_status": merital_status
      }}");
      final response =
          await client.post(Uri.parse("${baseurl}signup.php"), body: {
        "usertype": usertype,
        "name": name,
        "email": email,
        "mobile_no": mobile_no,
        "street_address": street_address,
        "state_id": state_id,
        "city_id": city_id,
        "password": password,
        "userpic": userpic,
        "dob": dob,
        "gender": gender,
        "anniversary": anniversary,
        "shopname": shopname,
        "user_alt_mobile_no": user_alt_mobile_no,
        "merital_status": merital_status
      });
      if (response.statusCode == 200) {
        print(response.body);
        return jsonDecode(response.body);
      } else {
        print('Request failed with status: ${response.statusCode}.');
        throw "Somethiing went wrong";
      }
    } catch (e) {
      print(e);
      throw "Somethiing went wrong";
    } finally {
      client.close();
    }
  }
}

final registerApi = RegisterApi();
