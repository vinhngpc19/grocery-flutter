import 'package:get/get.dart';
import 'package:grocery/models/product_model.dart';
import 'package:grocery/remote_config/api_manager/rest_client.dart';

class ProductDetailController extends GetxController {
  Rx<ProductModel> productItem = ProductModel().obs;
  late String productId;

  @override
  void onInit() {
    if (Get.arguments != null) {
      productId = Get.arguments.first.toString();
      getProductItem(productId);
    }
    super.onInit();
  }

  Future<void> getProductItem(String id) async {
    productItem.value = await RestClient().getProductDetail(id: id);
  }
}
