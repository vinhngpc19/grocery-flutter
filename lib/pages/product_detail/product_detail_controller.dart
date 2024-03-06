import 'package:get/get.dart';
import 'package:grocery/models/product_model.dart';
import 'package:grocery/api_manager/rest_client.dart';

class ProductDetailController extends GetxController {
  Rx<ProductModel> productItem = ProductModel().obs;
  late String productId;
  RxInt quantityNumber = 1.obs;
  @override
  void onInit() {
    if (Get.arguments != null) {
      productId = Get.arguments.first.toString();
      getProductItem(productId);
    }
    super.onInit();
  }

  void handlePlusQuantity() {
    if (quantityNumber.value < productItem.value.quantity!) {
      quantityNumber.value++;
    }
  }

  void handleSubtractQuantity() {
    if (quantityNumber.value > 1) {
      quantityNumber.value--;
    }
  }

  Future<void> getProductItem(String id) async {
    productItem.value = await RestClient().getProductDetail(id: id);
  }
}
