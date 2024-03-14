import 'package:get/get.dart';
import 'package:grocery/models/product_model.dart';

class DashboardController extends GetxController {
  RxInt currentIndex = 0.obs;
  RxList<ProductModel> listCart = <ProductModel>[].obs;
  void onTapIndex(int index) {
    if (index != 2) {
      currentIndex.value = index;
    }
  }
}
