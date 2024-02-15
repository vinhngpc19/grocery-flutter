import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  FocusNode focusNode = FocusNode();

  @override
  void onInit() {
    focusNode.requestFocus();
    super.onInit();
  }
}
