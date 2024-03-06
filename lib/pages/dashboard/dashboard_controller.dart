import 'package:get/get.dart';

class DashboardController extends GetxController {
  RxInt currentIndex = 0.obs;

  void onTapIndex(int index) {
    if (index != 2) {
      currentIndex.value = index;
    }
  }
}
