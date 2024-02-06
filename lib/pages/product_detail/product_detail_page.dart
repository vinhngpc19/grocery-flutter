import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery/pages/product_detail/product_detail_controller.dart';
import 'package:grocery/r.dart';

class ProductDetailPage extends GetView<ProductDetailController> {
  @override
  final controller = Get.put(ProductDetailController());
  ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics()),
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                (controller.productItem.value.imgUrl != null)
                    ? Image.network(
                        controller.productItem.value.imgUrl!,
                        height: 400,
                        width: Get.width,
                        fit: BoxFit.fill,
                      )
                    : Image.asset(
                        AssetImages.noImage,
                        height: 400,
                        width: Get.width,
                        fit: BoxFit.fill,
                      ),
                _contentWidget()
              ],
            ),
          )),
    );
  }

  Widget _contentWidget() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(controller.productItem.value.name ?? ''),
            Text(controller.productItem.value.currentPrice ?? ''),
            Text(controller.productItem.value.firstPrice ?? ''),
            Text(controller.productItem.value.description ?? ''),
          ],
        ));
  }
}
