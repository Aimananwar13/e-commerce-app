import 'dart:convert';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  String baseUrl = 'https://fakestoreapi.com';

  Future<List<Product>> getAllProducts() async {
    final response = await http.get(Uri.parse('$baseUrl/products'));
    print('statusCode: ${response.statusCode}');
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((product) => Product.fromJson(product)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
