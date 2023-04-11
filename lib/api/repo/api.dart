import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:vinayakply/maindistributer.dart/distbuterapi.dart';
import 'package:vinayakply/util/blog.dart';

class HomeApi {
  var client = http.Client();
  Future<dynamic> fetchCart() async {
    try {
      final response = await client.post(
        Uri.parse("${mainbaseUrl}showCart.php"),
        body: {
          "user_id": userCred.getUserId(),
        },
      );
      if (response.statusCode == 200) {
        print(response.body);
        return response;
      } else {
        // //   print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      print(e);
    } finally {}
  }
}
