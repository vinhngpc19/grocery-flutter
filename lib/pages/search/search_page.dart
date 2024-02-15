import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery/pages/search/search_controller.dart';
import 'package:grocery/themes/app_theme.dart';

class SearchPage extends GetView<SearchController> {
  SearchPage({super.key});
  @override
  final controller = Get.put(SearchController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [_searchWidget()],
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
      height: 40,
      margin: const EdgeInsets.only(right: 20, left: 4),
      child: TextFormField(
        focusNode: controller.focusNode,
        cursorColor: Colors.blue[600],
        decoration: InputDecoration(
          hintText: 'Tìm kiếm sản phẩm',
          hintStyle: TextStyle(color: AppTheme.greyIcon),
          focusedBorder: InputBorder.none,
          border: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
          prefixIcon:
              const Icon(Icons.search, size: 26, color: Color(0xff868686)),
        ),
      ),
    );
  }
}
