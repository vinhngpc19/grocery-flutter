import 'package:flutter/material.dart';
import 'package:grocery/models/product_model.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          Expanded(
            child: Image.network(
              productModel.imgUrl ?? '',
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          Text(productModel.name ?? '-',
              style: const TextStyle(overflow: TextOverflow.ellipsis),
              maxLines: 2),
          Text(productModel.currentPrice ?? '-'),
        ],
      ),
    );
  }
}
