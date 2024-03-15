import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery/models/product_model.dart';
import 'package:grocery/api_manager/rest_client.dart';
import 'package:grocery/pages/dashboard/dashboard_controller.dart';

class ProductDetailController extends GetxController {
  Rx<ProductModel> productItem = ProductModel().obs;
  late String productId;
  RxInt quantityNumber = 1.obs;
  RxString totalPrice = ''.obs;
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
      totalPrice.value =
          (quantityNumber.value * int.parse(productItem.value.currentPrice!))
              .toString();
    }
  }

  void handleSubtractQuantity() {
    if (quantityNumber.value > 1) {
      quantityNumber.value--;
      totalPrice.value =
          (quantityNumber.value * int.parse(productItem.value.currentPrice!))
              .toString();
    }
  }

  Future<void> getProductItem(String id) async {
    productItem.value = await RestClient().getProductDetail(id: id);
    totalPrice.value = productItem.value.currentPrice ?? '';
  }

  void handleAddCart() {
    bool isNew = false;
    productItem.value.quantityCart = quantityNumber.value;
    productItem.value.totalPrice = totalPrice.value;

    final tempList = Get.find<DashboardController>().listCart.value;
    for (int i = 0; i < tempList.length; i++) {
      if (tempList[i].id == productId) {
        Get.find<DashboardController>().listCart.value[i].quantityCart +=
            quantityNumber.value;
        isNew = false;
        break;
      } else {
        isNew = true;
      }
    }
    if (tempList.isEmpty || isNew) {
      Get.find<DashboardController>().listCart.add(productItem.value);
    }

    Get.back();
    ScaffoldMessenger.of(Get.context!).showSnackBar(const SnackBar(
      content: Text('Thêm vào giỏ hàng thành công'),
    ));
  }
}
