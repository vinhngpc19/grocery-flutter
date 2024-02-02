import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery/pages/product_detail/product_detail_controller.dart';

class ProductDetailPage extends GetView<ProductDetailController> {
  final controller = Get.put(ProductDetailController());
  ProductDetailPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
