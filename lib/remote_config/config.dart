import 'package:grocery/models/product_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

String baseUrl = 'https://fashionzones23.000webhostapp.com/api/';

class Config {
  static Future<void> getListProducts() async {
    final response = await http.get(Uri.parse('${baseUrl}product.php'));
    print(response.body);
  }
}
