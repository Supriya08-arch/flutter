import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:motion_toast/motion_toast.dart';
import 'package:myapp/constants.dart';
import 'package:myapp/http/httpuser.dart';
import 'package:myapp/model/clothes.dart';
import 'package:myapp/model/products.dart';
import 'package:myapp/response/getproduct_resp.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HttpConnectProduct {
  final baseurl = 'http://$ip2:3001/api/products/';

  Future<bool> addProducts(Product newproduct, File? file) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    String? mytoken = sharedPreferences.getString("token");
    bool result = false;
    Map<String, dynamic> product = {
      'name': newproduct.name,
      'price': newproduct.price.toString(),
      'category': newproduct.category,
      'description': newproduct.description,
      'imageurl': newproduct.imageUrl,
    };
    String tok = 'Bearer $mytoken';
    try {
      final response = await http
          .post(Uri.parse(baseurl + 'addproduct/'), body: product, headers: {
        'Authorization': tok,
      });

      if (response.statusCode == 200) {
        result = true;
        Fluttertoast.showToast(msg: "Product Added uploaded successfully");

        return result;
      }
    } catch (err) {
     print("eror");
      log('$err');
    }
    return result;
  }

  Future<List<Product>> getProducts() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    String? mytoken = sharedPreferences.getString("token");
    String tok = 'Bearer $mytoken';
    final response =
        await http.get(Uri.parse(baseurl + "getallproducts/"), headers: {
      'Authorization': tok,
    });
    if (response.statusCode == 200) {
      var a = ResponseGetProduct.fromJson(jsonDecode(response.body));

      return a.data;
    } else {
      throw Exception('Failed to load Products');
    }
  }
}
