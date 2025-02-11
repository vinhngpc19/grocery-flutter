import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery/component/smart_scroll/smart_load_list.dart';
import 'package:grocery/pages/home/component/product_item.dart';
import 'package:grocery/pages/search/search_controller.dart';
import 'package:grocery/themes/app_theme.dart';
import 'package:grocery/themes/text_theme.dart';

class SearchPage extends GetView<SearchListController>
    with SmartLoadListWidget {
  SearchPage({super.key});
  @override
  final controller = Get.put(SearchListController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.grey,
      body: SafeArea(
          child: Column(
        children: [
          _searchWidget(),
          _buildList(),
        ],
      )),
    );
  }

  Widget _searchWidget() {
    return Container(
      height: 64,
      color: AppTheme.lightPrimaryColor,
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(top: 6, bottom: 6),
        child: Row(
          children: [
            IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.arrow_back,
                    color: Colors.white, size: 28)),
            Expanded(child: _searchInput()),
          ],
        ),
      ),
    );
  }

  Widget _searchInput() {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(2))),
      height: 38,
      margin: const EdgeInsets.only(right: 20, left: 4),
      child: Obx(() => TextFormField(
            onTapOutside: (event) {
              controller.focusNode.unfocus();
            },
            onEditingComplete: () {
              controller.search();
              controller.focusNode.unfocus();
            },
            textInputAction: TextInputAction.go,
            controller: controller.textController,
            style: MyTextStyle.textStyle(style: const TextStyle()),
            focusNode: controller.focusNode,
            cursorColor: const Color.fromARGB(255, 33, 133, 220),
            decoration: InputDecoration(
              hintText: controller.categoryName.value == ''
                  ? 'Tìm kiếm sản phẩm'
                  : 'Tìm kiếm ${controller.categoryName}',
              hintStyle: MyTextStyle.textStyle(
                  style: TextStyle(color: AppTheme.greyIcon)),
              focusedBorder: InputBorder.none,
              border: InputBorder.none,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
              prefixIcon:
                  const Icon(Icons.search, size: 24, color: Color(0xff868686)),
            ),
          )),
    );
  }

  Widget _buildList() {
    return Expanded(
      child: Obx(
        () => smartLoadList(
          enablePullDown: true,
          controller,
          child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
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
              )),
        ),
      ),
    );
  }
}
