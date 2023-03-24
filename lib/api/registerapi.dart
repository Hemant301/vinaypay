import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vinayakply/util/blog.dart';

// https://vinayakply.in/API/
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
        Uri.parse("https://vinayakply.in/API/all_usertype.php"),
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
        Uri.parse("https://vinayakply.in/API/all_state.php"),
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

  Future<dynamic> getCityList({
    String state_id = "",
  }) async {
    var client = http.Client();
    try {
      final response = await client.post(
          Uri.parse("https://vinayakply.in/API/all_city.php"),
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
          Uri.parse("https://vinayakply.in/API/verify-account.php"),
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
      final response = await client.post(
          Uri.parse("https://vinayakply.in/API/userdetail.php"),
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
          Uri.parse("https://vinayakply.in/API/login-account.php"),
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
      final response = await client
          .post(Uri.parse("https://vinayakply.in/API/signup.php"), body: {
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
