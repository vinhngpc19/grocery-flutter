import 'package:get/get.dart';
import 'package:grocery/component/smart_scroll/smart_load_list_controller.dart';
import 'package:grocery/models/product_model.dart';
import 'package:grocery/remote_config/api_manager/rest_client.dart';
import 'package:grocery/routes/app_route.dart';

class HomeController extends GetxController with SmartLoadListController {
  final RxList<ProductModel> listProducts = <ProductModel>[].obs;
  final RestClient restClient = RestClient();
  int currenPage = 1;
  @override
  void onInit() async {
    var list = await restClient.getListProducts(pageNumber: currenPage);
    listProducts.value = list.data ?? [];
    super.onInit();
  }

  void onTapItem(String id) {
    Get.toNamed(AppRoute.routerDetail, arguments: [id]);
  }

  @override
  void onLoading() async {
    currenPage++;
    var newList = await restClient.getListProducts(pageNumber: currenPage);
    listProducts.addAll(newList.data ?? []);
    refreshController.loadComplete();
  }

  @override
  void onRefresh() async {
    currenPage = 1;
    listProducts.clear();
    var list = await restClient.getListProducts(pageNumber: currenPage);
    listProducts.value = list.data ?? [];

    refreshController.refreshCompleted();
  }
}
