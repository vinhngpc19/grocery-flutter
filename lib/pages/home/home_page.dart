import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery/pages/home/component/product_item.dart';

import 'home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Scaffold(
        body: Column(children: [
      Expanded(
          child: Obx(() => GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                ),
                itemCount: controller.listProducts.length,
                itemBuilder: (BuildContext context, int index) {
                  final listProducts = controller.listProducts;
                  return ProductItem(
                    productModel: listProducts[index],
                  );
                },
              ))),
    ]));
  }
}
