import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:grocery/models/product_model.dart';
import 'package:http/http.dart' as http;

String baseUrl = 'http://192.168.1.10:3000/';

class RestClient {
  final dio = Dio();
  Future<ProductModels> getListProducts({required int pageNumber}) async {
    final response = await dio.get('${baseUrl}product/?page=$pageNumber');
    if (response.statusCode == 200) {
      final listProducts = ProductModels.fromJson(response.data);
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
