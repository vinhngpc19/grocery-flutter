import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery/pages/category/category_controller.dart';
import 'package:grocery/r.dart';
import 'package:grocery/themes/app_theme.dart';
import 'package:grocery/themes/text_theme.dart';

class CategoryPage extends GetView<CategoryController> {
  CategoryPage({super.key});

  @override
  final controller = Get.put(CategoryController());
  final List<String> listCategoryUrl = [
    AssetImages.dauan,
    AssetImages.ca,
    AssetImages.raucu,
    AssetImages.thit,
    AssetImages.gao
  ];
  final List<String> listCategoryName = [
    'Dầu ăn',
    'Các loại cá',
    'Rau củ',
    'Các loại thịt',
    'Các loại gạo'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBar(
          backgroundColor: AppTheme.lightPrimaryColor,
          automaticallyImplyLeading: false,
          title: Center(
              child: Text('Tất cả danh mục',
                  style: MyTextStyle.textStyle(
                      style: const TextStyle(fontSize: 18)))),
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(80),
              child: _searchCategory()),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        child: Column(
          children: [
            Expanded(
              child: _listCategory(),
            ),
          ],
        ),
      )),
    );
  }

  Widget _listCategory() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: listCategoryUrl.length,
        physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics()),
        itemBuilder: (_, index) {
          return _buildCategoryItem(
              listCategoryUrl[index], listCategoryName[index]);
        });
  }

  Widget _buildCategoryItem(String categoryImgUrl, String categoryName) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(categoryImgUrl, width: Get.width, fit: BoxFit.cover),
            Positioned(
              left: 10,
              top: 6,
              child: Text(categoryName,
                  style: MyTextStyle.textStyle(
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontStyle: FontStyle.italic))),
            )
          ],
        ),
        const SizedBox(height: 14)
      ],
    );
  }

  Widget _searchCategory() {
    return Container(
      height: 48,
      color: AppTheme.lightPrimaryColor,
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.only(left: 14, right: 14, bottom: 8),
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(2))),
                height: 38,
                child: Row(children: [
                  const SizedBox(width: 8),
                  const Icon(Icons.search, size: 24, color: Color(0xff868686)),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text('Tìm kiếm sản phẩm',
                        style: MyTextStyle.textStyle(
                            style: TextStyle(
                                fontSize: 14, color: AppTheme.greyIcon))),
                  ),
                  const Icon(Icons.camera_alt_outlined,
                      size: 24, color: Color(0xff868686)),
                  const SizedBox(width: 8),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
