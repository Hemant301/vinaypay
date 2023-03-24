import 'dart:convert';


import 'package:vinayakply/api/repo/api.dart';
import 'package:vinayakply/api/repo/modal.dart';

class HomeRepo {
  HomeApi homeApi = HomeApi();
  Future<CartModal> fetchCart() async {
    final response = await homeApi.fetchCart();
    var jsonResponse = jsonDecode(response.body) as Map;
    return CartModal(jsonResponse);
  }
}
