import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery/pages/product_detail/product_detail_controller.dart';
import 'package:grocery/r.dart';
import 'package:grocery/themes/app_theme.dart';
import 'package:grocery/themes/text_theme.dart';
import 'package:intl/intl.dart';

class ProductDetailPage extends GetView<ProductDetailController> {
  @override
  final controller = Get.put(ProductDetailController());
  ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _searchWidget(),
              Expanded(
                  child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(
                    parent: BouncingScrollPhysics()),
                child: Column(
                  children: [
                    (controller.productItem.value.imgUrl != null)
                        ? Image.network(
                            controller.productItem.value.imgUrl!,
                            height: MediaQuery.of(context).size.height * .45,
                            width: Get.width,
                            fit: BoxFit.fitHeight,
                          )
                        : Image.asset(
                            AssetImages.noImage,
                            height: 400,
                            width: Get.width,
                            fit: BoxFit.cover,
                          ),
                    _contentWidget()
                  ],
                ),
              )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    _buildBottomIcon(Icons.home_outlined),
                    _buildBottomIcon(Icons.chat_outlined),
                    _buildBuyButton('Mua ngay'),
                    _buildAddCartButton('Thêm vào giỏ')
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _contentWidget() {
    return Container(
      padding: const EdgeInsets.only(top: 40, right: 14, left: 14),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            controller.productItem.value.name ?? '',
            style: MyTextStyle.textStyle(
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          ),
          const SizedBox(height: 12),
          Text('Loại: Thực phẩm',
              style: MyTextStyle.textStyle(
                  style: const TextStyle(
                fontSize: 15,
              ))),
          const SizedBox(height: 12),
          Text('Kho: ${controller.productItem.value.quantity}',
              style: MyTextStyle.textStyle(
                  style: const TextStyle(
                fontSize: 15,
              ))),
          const SizedBox(height: 12),
          if (controller.productItem.value.currentPrice != null)
            Text(
                NumberFormat.simpleCurrency(name: 'VND').format(
                    int.tryParse(controller.productItem.value.currentPrice!)),
                style: MyTextStyle.textStyle(
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                )),
          const SizedBox(height: 12),
          if (controller.productItem.value.firstPrice != null)
            Text(
                NumberFormat.simpleCurrency(name: 'VND').format(
                    int.tryParse(controller.productItem.value.firstPrice!)),
                style: MyTextStyle.textStyle(
                  style: TextStyle(
                    fontSize: 12,
                    color: AppTheme.greyIcon,
                    decoration: TextDecoration.lineThrough,
                    fontWeight: FontWeight.w600,
                  ),
                )),
          const SizedBox(height: 12),
          Text(controller.productItem.value.description ?? '',
              style: MyTextStyle.textStyle(style: TextStyle(fontSize: 15))),
          const SizedBox(height: 12),
          Text('Sản phẩm liên quan',
              style: MyTextStyle.textStyle(
                  style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ))),
          const SizedBox(height: 10),
          SizedBox(
            height: 110,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.only(right: 6),
                width: 110,
                height: 110,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Image(
                    height: 70,
                    image: AssetImage(AssetImages.noImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildBottomIcon(IconData icon) {
    return Container(
      height: 44,
      width: 44,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
          color: AppTheme.grey,
          borderRadius: const BorderRadius.all(Radius.circular(5))),
      child: Icon(icon, size: 24, color: const Color.fromARGB(255, 68, 68, 68)),
    );
  }

  Widget _buildAddCartButton(String title) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet<void>(
            context: Get.context!,
            builder: (BuildContext context) {
              return SizedBox(
                height: 244,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const SizedBox(width: 14),
                        Image.network(
                          controller.productItem.value.imgUrl!,
                          height: 140,
                          fit: BoxFit.fitHeight,
                        ),
                        const SizedBox(width: 10),
                        Column(
                          children: [
                            if (controller.productItem.value.currentPrice !=
                                null)
                              Text(
                                  NumberFormat.simpleCurrency(name: 'VND')
                                      .format(int.tryParse(controller
                                          .productItem.value.currentPrice!)),
                                  style: MyTextStyle.textStyle(
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )),
                            Text(
                                'Kho: ${controller.productItem.value.quantity}',
                                style: MyTextStyle.textStyle(
                                    style: const TextStyle(
                                  fontSize: 15,
                                ))),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text('Số lượng:',
                                style: MyTextStyle.textStyle(
                                    style: const TextStyle(
                                  fontSize: 15,
                                ))),
                          ),
                          _buildAdjustQuantity(),
                        ],
                      ),
                    ),
                    const SizedBox(height: 18),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: Container(
                          height: 44,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: AppTheme.lightPrimaryColor,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5))),
                          child: Text(title,
                              style: MyTextStyle.textStyle(
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500)))),
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: Container(
            height: 44,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: AppTheme.lightPrimaryColor,
                borderRadius: const BorderRadius.all(Radius.circular(5))),
            child: Text(title,
                style: MyTextStyle.textStyle(
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500)))),
      ),
    );
  }

  Widget _buildBuyButton(String title) {
    return Expanded(
      child: Container(
        height: 44,
        alignment: Alignment.center,
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: AppTheme.lightPrimaryColor, width: 0.5),
            borderRadius: const BorderRadius.all(Radius.circular(5))),
        child: Text(title,
            style: MyTextStyle.textStyle(
                style: TextStyle(
                    color: AppTheme.lightPrimaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500))),
      ),
    );
  }

  Widget _buildAdjustQuantity() {
    return Obx(
      () {
        return Row(
          children: [
            GestureDetector(
              onTap: controller.handleSubtractQuantity,
              child: const Icon(
                Icons.remove,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            Text(controller.quantityNumber.value.toString(),
                style: const TextStyle(fontSize: 16)),
            const SizedBox(width: 12),
            GestureDetector(
              onTap: controller.handlePlusQuantity,
              child: const Icon(
                Icons.add,
                size: 20,
              ),
            )
          ],
        );
      },
    );
  }

  Widget _searchWidget() {
    return Container(
      height: 50,
      color: Colors.white,
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(top: 6, bottom: 6),
        child: Row(
          children: [
            IconButton(
                onPressed: () {
                  Get.back();
                },
                icon:
                    Icon(Icons.arrow_back, color: AppTheme.greyIcon, size: 28)),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: AppTheme.greyIcon, width: 0.5),
                    borderRadius: const BorderRadius.all(Radius.circular(5))),
                height: 40,
                child: Row(children: [
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text('Tìm kiếm sản phẩm',
                        style: MyTextStyle.textStyle(
                            style: TextStyle(
                                fontSize: 14, color: AppTheme.greyIcon))),
                  ),
                  const SizedBox(width: 8),
                ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Icon(Icons.notifications_none_outlined,
                  size: 26, color: AppTheme.greyIcon),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 14),
              child: Icon(Icons.shopping_cart_outlined,
                  size: 26, color: AppTheme.greyIcon),
            ),
          ],
        ),
      ),
    );
  }
}
