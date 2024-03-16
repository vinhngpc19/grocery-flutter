import 'package:get/get.dart';
import 'package:grocery/routes/app_route.dart';

class CategoryController extends GetxController {
  void onTapItem(int index) {
    Get.toNamed(AppRoute.routerSearch, arguments: index.toString());
  }
}
