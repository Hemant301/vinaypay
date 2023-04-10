import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:vinayakply/const/constant.dart';
import 'package:vinayakply/util/blog.dart';

class InteriorApi {
  var client = http.Client();

  Future<dynamic> getInquary() async {
    var client = http.Client();
    try {
      final response = await client.post(
        body: {"user_id": userCred.getUserId()},
        Uri.parse("${baseurl}all_inquiry.php"),
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

  Future<dynamic> SubmitInqury(
      {String? email,
      name,
      site_name,
      project_type,
      mobile,
      address,
      stateid,
      cityid,
      comment}) async {
    var client = http.Client();
    try {
      final response = await client.post(
        body: {
          "user_id": userCred.getUserId(),
          "site_name": site_name,
          "project_type": project_type,
          "name": name,
          "email": email,
          "mobile": mobile,
          "address": address,
          "stateid": stateid,
          "cityid": cityid,
          "comment": comment
        },
        Uri.parse("${baseurl}inquiry.php"),
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

  Future<dynamic> UpdateProfileApi({
    String? email,
    name,
    // site_name,
    // project_type,
    // mobile,
    address,
    stateid,
    // shopname,
    cityid,
    anniversary,
    // user_alt_mobile_no,
    gender,
    // merital_status,
    dob,
  }) async {
    var client = http.Client();
    try {
      log("hhhhhh${userCred.getUserId()}");
      final response = await client.post(
        body: {
          "userid": userCred.getUserId(),
          "name": name,
          "email": email,
          // "mobile": mobile,
          "street_address": address,
          "dob": "5TT3",
          "gender": "1",
          "state_id": "3",
          "anniversary": "VFFSBVF",
          // "user_alt_mobile_no": user_alt_mobile_no,
          // "shopname": shopname,
          "city_id": "4",
          // "city_id": merital_status,
        },
        Uri.parse("${baseurl}updateprofile.php"),
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

  Future<dynamic> ChangePassword({String? newpasword, oldpassword}) async {
    var client = http.Client();
    try {
      final response = await client.post(
        body: {
          "UserId": userCred.getUserId(),
          "password": newpasword,
          "oldpassword": oldpassword
        },
        Uri.parse("${baseurl}changepassword.php"),
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

  Future<dynamic> getProjectApi() async {
    var client = http.Client();
    try {
      final response = await client.post(
        Uri.parse("${baseurl}projecttype.php"),
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

  Future<dynamic> EditProfileApi({
    String? name,
    moblie,
    email,
    dob,
    marital,
    altmoblie,
    address,
    stateId,
    cityid,
  }) async {
    var client = http.Client();
    try {
      final response = await client.post(
        body: {"newpasword": name},
        Uri.parse("${baseurl}inquiry.php"),
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
}
