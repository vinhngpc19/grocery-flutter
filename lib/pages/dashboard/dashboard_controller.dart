import 'package:get/get.dart';
import '../../remote_config/api_manager/rest_client.dart';

class DashboardController extends GetxController {
  RxInt currentIndex = 0.obs;

  void onTapIndex(int index) {
    currentIndex.value = index;
    if (index == 2) {
      RestClient().getListProducts(pageNumber: 2);
    }
  }
}
