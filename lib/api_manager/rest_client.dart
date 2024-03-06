import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:grocery/models/product_model.dart';
import 'package:grocery/routes/app_route.dart';

const String baseUrl = 'http://192.168.1.56:3000/';

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
    final response = await dio.get('${baseUrl}product/detail/$id');
    if (response.statusCode == 200) {
      final product = ProductModel.fromJson(response.data);
      return product;
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<void> logIn(String username, String password) async {
    final response = await dio.post('${baseUrl}login',
        data: {username: username, password: password});
    if (response.statusCode == 200) {
      Get.toNamed(AppRoute.routerDashboard);
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<void> signUp(String username, String password, String email) async {
    String nickname = '';
    final response = await dio.post('${baseUrl}account', data: {
      username: username,
      password: password,
      email: email,
      nickname: nickname
    });
    if (response.statusCode == 200) {
      Get.toNamed(AppRoute.routerSignIn);
    } else {
      throw Exception('Failed to load album');
    }
  }
}
