import 'package:fake_store/data/models/product.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static var client = http.Client();
  static const String _baseUrl = 'https://fakestoreapi.com/';
  static const String _product = 'products';

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
}
