import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery/pages/home/component/product_item.dart';
import 'package:grocery/pages/home/component/search_home_item.dart';
import 'package:grocery/themes/app_theme.dart';

import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  @override
  final controller = Get.put(HomeController());
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.grey,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: SizedBox(
                height: Get.height -
                    MediaQuery.of(context).viewPadding.top -
                    MediaQuery.of(context).viewPadding.bottom -
                    kToolbarHeight -
                    22,
                width: Get.width,
                child: IntrinsicHeight(
                  child: Column(
                    children: <Widget>[
                      const SearchHomeWidget(),
                      Expanded(child: _gridProductsWidget())
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _gridProductsWidget() {
    return SingleChildScrollView(
      physics:
          const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
      child: Column(
        children: [
          Container(
            height: 40,
            color: Colors.yellow,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            child: Obx(() => GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
                    mainAxisExtent: 270,
                  ),
                  itemCount: controller.listProducts.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    final listProducts = controller.listProducts;
                    return ProductItem(
                        productModel: listProducts[index],
                        onTapItem: controller.onTapItem);
                  },
                )),
          ),
        ],
      ),
    );
  }
}
