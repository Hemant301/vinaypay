import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vinayakply/util/blog.dart';

String mainbaseUrl = "https://vinayakply.in/API/";
String imageurl = "https://vinayakply.in/API/product/";

class DistubuterApi {
  var client = http.Client();

  Future<dynamic> getAllOrder() async {
    var client = http.Client();
    try {
      final response = await client.post(
        body: {"user_sr": "2"},
        Uri.parse("${mainbaseUrl}all_order.php"),
      );
      if (response.statusCode == 200) {
        print(response.body);
        return jsonDecode(response.body) as List;
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

  Future<dynamic> getOrderDetail(String orderid) async {
    var client = http.Client();
    try {
      final response = await client.post(
        body: {"orderid": orderid},
        Uri.parse("${mainbaseUrl}orderdetail.php"),
      );
      if (response.statusCode == 200) {
        print(response.body);
        return jsonDecode(response.body) as Map;
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

  Future<dynamic> getAllwarantycard() async {
    var client = http.Client();
    try {
      final response = await client.post(
        body: {"userid": "22"},
        Uri.parse("${mainbaseUrl}warranty_card_list.php"),
      );
      if (response.statusCode == 200) {
        print(response.body);
        return jsonDecode(response.body) as List;
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

  Future<dynamic> getAllwarantycarddetails(String WNO) async {
    var client = http.Client();
    try {
      final response = await client.post(
        body: {"userid": "22", "warranty_number": WNO},
        Uri.parse("${mainbaseUrl}warrantyditemetail.php"),
      );
      if (response.statusCode == 200) {
        print(response.body);
        return jsonDecode(response.body) as List;
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

  Future<dynamic> getAllprduct(String search) async {
    var client = http.Client();
    try {
      final response = await client.post(
        body: {"warranty_number": search},
        Uri.parse("${mainbaseUrl}product.php"),
      );
      if (response.statusCode == 200) {
        print(response.body);
        return jsonDecode(response.body) as List;
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

  Future<dynamic> getwarantyDetail() async {
    var client = http.Client();
    try {
      final response = await client.post(
        body: {"userid": userCred.getUserId()},
        Uri.parse("${mainbaseUrl}showqr.php"),
      );
      if (response.statusCode == 200) {
        print(response.body);
        return jsonDecode(response.body) as List;
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

  Future<dynamic> getProductUplad(String doc) async {
    var client = http.Client();
    try {
      final response = await client.post(
        body: {"uploadFileImage": doc},
        Uri.parse("${mainbaseUrl}placeorder.php"),
      );
      if (response.statusCode == 200) {
        print(response.body);
        return jsonDecode(response.body) as Map;
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

  Future<dynamic> getSavetoCard(
      {String? product_id, qty, prod_price, request}) async {
    var client = http.Client();
    try {
      final response = await client.post(
        body: {
          "user_sr": userCred.getUserId(),
          "prod_id": product_id,
          "qty": qty,
          "prod_price": prod_price,
          "request": request
        },
        Uri.parse("${mainbaseUrl}saveCart.php"),
      );
      if (response.statusCode == 200) {
        print(response.body);
        return jsonDecode(response.body) as Map;
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

  Future<dynamic> removeWarrantyCard({
    String? qrid,
  }) async {
    var client = http.Client();
    try {
      final response = await client.post(
        body: {
          "qrid": qrid,
        },
        Uri.parse("${mainbaseUrl}removeqr.php"),
      );
      if (response.statusCode == 200) {
        print(response.body);
        return jsonDecode(response.body) as Map;
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

  Future<dynamic> gentatewarantyCard({
    String? name,
    pincode,
    mobile_no,
    street_address,
    state,
    city,
  }) async {
    var client = http.Client();
    try {
      final response = await client.post(
        body: {
          "name": name,
          "pincode": pincode,
          "mobile_no": mobile_no,
          "street_address": street_address,
          "state": state,
          "mobile": mobile_no,
          "address": street_address,
          "state": state,
          "userdi": userCred.getUserId()
          // "city": city
        },
        Uri.parse("${mainbaseUrl}generatecard.php"),
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

  Future<dynamic> removeCard({
    String? cartid,
  }) async {
    var client = http.Client();
    try {
      final response = await client.post(
        body: {
          "cartid": cartid,
        },
        Uri.parse("${mainbaseUrl}removecart.php"),
      );
      if (response.statusCode == 200) {
        print(response.body);
        return jsonDecode(response.body) as Map;
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

  Future<dynamic> genratewaranty({String? serial_no}) async {
    var client = http.Client();
    try {
      final response = await client.post(
        body: {
          "userid": userCred.getUserId(),
          "qrcode": serial_no,
        },
        //https://vinayakply.in/API/
        Uri.parse("${mainbaseUrl}verifywarranty.php"),
      );
      if (response.statusCode == 200) {
        print(response.body);
        return jsonDecode(response.body) as Map;
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

  Future<dynamic> getcrdproduct() async {
    var client = http.Client();
    try {
      final response = await client.post(
        body: {
          "user_id": userCred.getUserId(),
        },
        Uri.parse("${mainbaseUrl}showCart.php"),
      );
      if (response.statusCode == 200) {
        print(response.body);
        return jsonDecode(response.body) as Map;
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

  // Future<dynamic> SubmitInqury(
  //     {String? email,
  //     name,
  //     site_name,
  //     project_type,
  //     mobile,
  //     address,
  //     stateid,
  //     cityid,
  //     comment}) async {
  //   var client = http.Client();
  //   try {
  //     final response = await client.post(
  //       body: {
  //         "user_id": userCred.getUserId(),
  //         "site_name": site_name,
  //         "project_type": project_type,
  //         "name": name,
  //         "email": email,
  //         "mobile": mobile,
  //         "address": address,
  //         "stateid": stateid,
  //         "cityid": cityid,
  //         "comment": comment
  //       },
  //       Uri.parse("https://vinayakply.in/API/inquiry.php"),
  //     );
  //     if (response.statusCode == 200) {
  //       print(response.body);
  //       return jsonDecode(response.body);
  //     } else {
  //       print('Request failed with status: ${response.statusCode}.');
  //       throw "Somethiing went wrong";
  //     }
  //   } catch (e) {
  //     print(e);
  //     throw "Somethiing went wrong";
  //   } finally {
  //     client.close();
  //   }
  // }

  // Future<dynamic> UpdateProfileApi({
  //   String? email,
  //   name,
  //   site_name,
  //   project_type,
  //   mobile,
  //   address,
  //   stateid,
  //   shopname,
  //   cityid,
  //   anniversary,
  //   user_alt_mobile_no,
  //   gender,
  //   merital_status,
  //   dob,
  // }) async {
  //   var client = http.Client();
  //   try {
  //     final response = await client.post(
  //       body: {
  //         "userid": userCred.getUserId(),
  //         "name": name,
  //         "email": email,
  //         "mobile": mobile,
  //         "street_address": address,
  //         "dob": dob,
  //         "gender": gender,
  //         "state_id": stateid,
  //         "anniversary": anniversary,
  //         "user_alt_mobile_no": user_alt_mobile_no,
  //         "shopname": shopname,
  //         "city_id": cityid,
  //         "city_id": merital_status,
  //       },
  //       Uri.parse(
  //           "https://vinayakply.in/API/updateprofile.php"),
  //     );
  //     if (response.statusCode == 200) {
  //       print(response.body);
  //       return jsonDecode(response.body);
  //     } else {
  //       print('Request failed with status: ${response.statusCode}.');
  //       throw "Somethiing went wrong";
  //     }
  //   } catch (e) {
  //     print(e);
  //     throw "Somethiing went wrong";
  //   } finally {
  //     client.close();
  //   }
  // }

  // Future<dynamic> ChangePassword({String? newpasword, oldpassword}) async {
  //   var client = http.Client();
  //   try {
  //     final response = await client.post(
  //       body: {
  //         "UserId": userCred.getUserId(),
  //         "password": newpasword,
  //         "oldpassword": oldpassword
  //       },
  //       Uri.parse(
  //           "https://vinayakply.in/API/changepassword.php"),
  //     );
  //     if (response.statusCode == 200) {
  //       print(response.body);
  //       return jsonDecode(response.body);
  //     } else {
  //       print('Request failed with status: ${response.statusCode}.');
  //       throw "Somethiing went wrong";
  //     }
  //   } catch (e) {
  //     print(e);
  //     throw "Somethiing went wrong";
  //   } finally {
  //     client.close();
  //   }
  // }

  // Future<dynamic> getProjectApi() async {
  //   var client = http.Client();
  //   try {
  //     final response = await client.post(
  //       Uri.parse("https://vinayakply.in/API/projecttype.php"),
  //     );
  //     if (response.statusCode == 200) {
  //       print(response.body);
  //       return jsonDecode(response.body);
  //     } else {
  //       print('Request failed with status: ${response.statusCode}.');
  //       throw "Somethiing went wrong";
  //     }
  //   } catch (e) {
  //     print(e);
  //     throw "Somethiing went wrong";
  //   } finally {
  //     client.close();
  //   }
  // }

  // Future<dynamic> EditProfileApi({
  //   String? name,
  //   moblie,
  //   email,
  //   dob,
  //   marital,
  //   altmoblie,
  //   address,
  //   stateId,
  //   cityid,
  // }) async {
  //   var client = http.Client();
  //   try {
  //     final response = await client.post(
  //       body: {"newpasword": name},
  //       Uri.parse("https://vinayakply.in/API/inquiry.php"),
  //     );
  //     if (response.statusCode == 200) {
  //       print(response.body);
  //       return jsonDecode(response.body);
  //     } else {
  //       print('Request failed with status: ${response.statusCode}.');
  //       throw "Somethiing went wrong";
  //     }
  //   } catch (e) {
  //     print(e);
  //     throw "Somethiing went wrong";
  //   } finally {
  //     client.close();
  //   }
  // }
}
