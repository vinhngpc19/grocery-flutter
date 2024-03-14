import 'package:flutter/material.dart';
import 'package:grocery/models/product_model.dart';
import 'package:grocery/themes/app_theme.dart';
import 'package:grocery/themes/text_theme.dart';
import 'package:intl/intl.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: AppTheme.greyIcon, width: 0.5)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Image.network(productModel.imgUrl!, height: 90),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(productModel.name ?? '',
                    style: MyTextStyle.textStyle(
                        style: const TextStyle(fontSize: 14))),
                const SizedBox(height: 6),
                Text(
                    NumberFormat.simpleCurrency(name: 'VND').format(
                        int.tryParse(productModel.totalPrice!)! *
                            productModel.quantityCart),
                    style: MyTextStyle.textStyle(
                        style: TextStyle(
                            fontSize: 16, color: AppTheme.lightPrimaryColor)))
              ],
            ),
          ),
          SizedBox(
            height: 90,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.remove,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(productModel.quantityCart.toString(),
                        style: const TextStyle(fontSize: 16)),
                    const SizedBox(width: 12),
                    GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.add,
                        size: 20,
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
