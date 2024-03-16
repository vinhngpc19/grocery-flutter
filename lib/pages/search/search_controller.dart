import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery/api_manager/rest_client.dart';
import 'package:grocery/component/smart_scroll/smart_load_list_controller.dart';
import 'package:grocery/models/product_model.dart';

import '../../routes/app_route.dart';

class SearchListController extends GetxController with SmartLoadListController {
  FocusNode focusNode = FocusNode();
  final textController = TextEditingController();
  final RxList<ProductModel> listProducts = <ProductModel>[].obs;
  final RestClient restClient = RestClient();
  int currenPage = 1;

  @override
  void onInit() async {
    focusNode.requestFocus();
    if (Get.arguments != null) {
      var list = await restClient.getListCategory(
          pageNumber: currenPage, category: Get.arguments.first);

      listProducts.value = list.data ?? [];
    } else {
      var list = await restClient.getListProducts(pageNumber: currenPage);

      listProducts.value = list.data ?? [];
    }
    super.onInit();
  }

  void onTapItem(String id) {
    Get.toNamed(AppRoute.routerDetail, arguments: [id]);
  }

  @override
  void onLoading() async {
    currenPage++;
    var newList = await restClient.getListProducts(pageNumber: currenPage);
    listProducts.addAll(newList.data ?? []);
    refreshController.loadComplete();
  }

  @override
  void onRefresh() async {
    currenPage = 1;
    listProducts.clear();
    var list = await restClient.getListProducts(pageNumber: currenPage);
    listProducts.value = list.data ?? [];
    refreshController.refreshCompleted();
  }

  void search() async {
    currenPage = 1;
    var list = await restClient.getListSearchProducts(
        pageNumber: currenPage, keyword: textController.text);
    listProducts.value = list.data ?? [];
  }
}
