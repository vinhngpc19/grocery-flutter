import 'dart:convert';

import 'package:grocery/models/product_model.dart';
import 'package:http/http.dart' as http;

String baseUrl = 'http://192.168.1.56:3000/';

class RestClient {
  Future<ProductModels> getListProducts({required int pageNumber}) async {
    final response =
        await http.get(Uri.parse('${baseUrl}product/?page=$pageNumber'));
    if (response.statusCode == 200) {
      var listProducts = ProductModels.fromJson(jsonDecode(response.body));
      return listProducts;
    } else {
      throw Exception('Failed to load album');
    }
  }
}
