import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery/pages/search/search_controller.dart';

class SearchPage extends GetView<SearchController> {
  SearchPage({super.key});
  @override
  final controller = Get.put(SearchController());
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
