import 'dart:convert';

import 'package:grocery/models/product_model.dart';
import 'package:http/http.dart' as http;

String baseUrl = 'http://192.168.1.7:3000/';

class RestClient {
  Future<ProductModels> getListProducts({required int pageNumber}) async {
    final response =
        await http.get(Uri.parse('${baseUrl}product/?page=$pageNumber'));
    if (response.statusCode == 200) {
      final listProducts = ProductModels.fromJson(jsonDecode(response.body));
      return listProducts;
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<ProductModel> getProductDetail({required String id}) async {
    final response = await http.get(Uri.parse('${baseUrl}product/detail/$id'));
    if (response.statusCode == 200) {
      final product = ProductModel.fromJson(jsonDecode(response.body));
      return product;
    } else {
      throw Exception('Failed to load album');
    }
  }
}
