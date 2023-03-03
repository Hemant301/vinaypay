import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vinayakply/util/blog.dart';

class InteriorApi {
  var client = http.Client();

  Future<dynamic> getInquary() async {
    var client = http.Client();
    try {
      final response = await client.post(
        body: {"user_id": userCred.getUserId()},
        Uri.parse("https://knowledgeitservices.in/vinayakply/all_inquiry.php"),
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
        Uri.parse("https://knowledgeitservices.in/vinayakply/inquiry.php"),
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
    site_name,
    project_type,
    mobile,
    address,
    stateid,
    shopname,
    cityid,
    anniversary,
    user_alt_mobile_no,
    gender,
    merital_status,
    dob,
  }) async {
    var client = http.Client();
    try {
      final response = await client.post(
        body: {
          "userid": userCred.getUserId(),
          "name": name,
          "email": email,
          "mobile": mobile,
          "street_address": address,
          "dob": dob,
          "gender": gender,
          "state_id": stateid,
          "anniversary": anniversary,
          "user_alt_mobile_no": user_alt_mobile_no,
          "shopname": shopname,
          "city_id": cityid,
          "city_id": merital_status,
        },
        Uri.parse(
            "https://knowledgeitservices.in/vinayakply/updateprofile.php"),
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
        Uri.parse(
            "https://knowledgeitservices.in/vinayakply/changepassword.php"),
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
        Uri.parse("https://knowledgeitservices.in/vinayakply/projecttype.php"),
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
        Uri.parse("https://knowledgeitservices.in/vinayakply/inquiry.php"),
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
