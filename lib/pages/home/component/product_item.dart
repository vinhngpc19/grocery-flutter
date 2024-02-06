import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery/models/product_model.dart';
import 'package:grocery/themes/app_theme.dart';
import 'package:intl/intl.dart';

class ProductItem extends StatelessWidget {
  const ProductItem(
      {super.key, required this.productModel, required this.onTapItem});
  final ProductModel productModel;
  final Function(String) onTapItem;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        onTapItem(productModel.id!);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              child: Image.network(
                productModel.imgUrl ?? '',
                fit: BoxFit.cover,
                height: 150,
                width: Get.width,
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(productModel.name ?? '-',
                      style: const TextStyle(overflow: TextOverflow.ellipsis),
                      maxLines: 2),
                  const SizedBox(height: 6),
                  Text(
                      (productModel.currentPrice != null)
                          ? NumberFormat.simpleCurrency(name: 'VND')
                              .format(int.tryParse(productModel.currentPrice!))
                          : '-',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.lightPrimaryColor)),
                  const SizedBox(height: 2),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.orange[50],
                        borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.monetization_on_sharp,
                              color: Colors.orange[700], size: 12),
                          const Text('Mua trước chả sau',
                              style:
                                  TextStyle(fontSize: 10, color: Colors.orange))
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text('Số lượng ${productModel.quantity}',
                      style: const TextStyle(fontSize: 11)),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            const Text('5/5', style: TextStyle(fontSize: 11)),
                            Icon(Icons.star, color: Colors.amber[400], size: 11)
                          ],
                        ),
                      ),
                      const Text('Hà Nội', style: TextStyle(fontSize: 11))
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
