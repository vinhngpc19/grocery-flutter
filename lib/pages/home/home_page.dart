import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery/pages/home/component/product_item.dart';
import 'package:grocery/pages/home/component/search_home_item.dart';
import 'package:grocery/themes/app_theme.dart';

import 'home_controller.dart';

class HomePage extends StatelessWidget {
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
              // physics: NeverScrollableScrollPhysics(),
              child: SizedBox(
                height: Get.height -
                    MediaQuery.of(context).viewPadding.top -
                    MediaQuery.of(context).viewPadding.bottom -
                    kToolbarHeight,
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
    return Padding(
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
            physics: const AlwaysScrollableScrollPhysics(
                parent: BouncingScrollPhysics()),
            itemBuilder: (BuildContext context, int index) {
              final listProducts = controller.listProducts;
              return ProductItem(
                productModel: listProducts[index],
              );
            },
          )),
    );
  }
}
