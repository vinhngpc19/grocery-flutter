import 'package:get/get.dart';
import 'package:grocery/models/product_model.dart';
import 'package:grocery/remote_config/api_manager/rest_client.dart';

class HomeController extends GetxController {
  final RxList<ProductModel> listProducts = <ProductModel>[].obs;
  final RestClient restClient = RestClient();
  @override
  void onInit() async {
    var list = await restClient.getListProducts(pageNumber: 2);
    listProducts.value = list.data ?? [];
    super.onInit();
  }
}
