import 'dart:convert';

import 'package:fake_store/data/models/product.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static var client = http.Client();
  static const String _baseUrl = 'https://fakestoreapi.com/';
  static const String _product = 'products';

  // bool isSuccess = false;

  static Future<List<Product>> fetchProducts() async {
    var response = await client.get(Uri.parse(_baseUrl + _product));

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return productFromJson(jsonString);
    } else {
      // show error message
      throw Exception('Failed to show product list');
    }
  }

  static Future<bool> addProduct(Product data) async {
    var response = await client.post(Uri.parse(_baseUrl + _product),
        headers: {'Content-type': 'application/json'},
        body: jsonEncode(data.toJson()));

    if (response.statusCode == 200) {
      // isSuccess = true;
      return true;
    } else {
      // show error message
      throw Exception('Failed to add product');
    }
  }
}
