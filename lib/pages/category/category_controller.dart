import 'package:get/get.dart';
import 'package:grocery/routes/app_route.dart';

class CategoryController extends GetxController {
  final List<String> listCategoryName = [
    'Dầu ăn',
    'Các loại cá',
    'Rau củ',
    'Các loại thịt',
    'Các loại gạo'
  ];

  void onTapItem(int index) {
    Get.toNamed(
      AppRoute.routerSearch,
      arguments: {index.toString(), listCategoryName[index]},
    );
  }
}
