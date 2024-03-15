import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery/component/smart_scroll/smart_load_list.dart';
import 'package:grocery/pages/home/component/product_item.dart';
import 'package:grocery/component/search_home_item.dart';
import 'package:grocery/r.dart';
import 'package:grocery/themes/app_theme.dart';
import 'package:grocery/themes/text_theme.dart';

import 'home_controller.dart';

class HomePage extends GetView<HomeController> with SmartLoadListWidget {
  @override
  final controller = Get.put(HomeController());
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.grey,
      body: LayoutBuilder(
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
                    Obx(() => SearchHomeWidget()),
                    Expanded(child: _gridProductsWidget())
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _gridProductsWidget() {
    return Obx(() => smartLoadList(controller,
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              _homeTabbar(),
              // _buildFakeImg(AssetImages.fakeImg1),
              _buildFakeImg(AssetImages.fakeImg2),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
                    mainAxisExtent: 285,
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
                ),
              ),
            ],
          ),
        )));
  }

  Widget _homeTabbar() {
    return Container(
      height: 36,
      color: AppTheme.lightPrimaryColor,
      child: DefaultTabController(
        length: 6,
        child: TabBar(
            indicatorWeight: 2,
            indicatorColor: Colors.white,
            isScrollable: true,
            labelStyle: MyTextStyle.textStyle(
                style: const TextStyle(fontWeight: FontWeight.bold)),
            unselectedLabelStyle:
                MyTextStyle.textStyle(style: TextStyle(color: AppTheme.grey)),
            tabs: const [
              Tab(
                text: 'Cho bạn',
              ),
              Tab(
                text: 'Đồ dùng nhà bếp',
              ),
              Tab(
                text: 'Rau củ sạch',
              ),
              Tab(
                text: 'Vệ sinh, chăm sóc nhà cửa',
              ),
              Tab(
                text: 'Đồ dùng phòng ăn, uống',
              ),
              Tab(
                text: 'Đồ dùng sinh hoạt',
              ),
            ]),
      ),
    );
  }

  Widget _buildFakeImg(String imgAsset) {
    return Image.asset(imgAsset);
  }
}
