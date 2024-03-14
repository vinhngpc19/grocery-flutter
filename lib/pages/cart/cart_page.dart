import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery/models/product_model.dart';
import 'package:grocery/pages/cart/component/cart_item.dart';
import 'package:grocery/pages/dashboard/dashboard_controller.dart';
import 'package:grocery/pages/payment/my_payment_page.dart';
import 'package:grocery/themes/app_theme.dart';
import 'package:grocery/themes/text_theme.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<ProductModel> listCarts = [];
  @override
  void initState() {
    getinitCart();

    super.initState();
  }

  Future<void> getinitCart() async {
    listCarts.addAll(Get.find<DashboardController>().listCart);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _searchWidget(),
            Expanded(
              child: SingleChildScrollView(
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: listCarts.length,
                    itemBuilder: (context, index) =>
                        CartItem(productModel: listCarts[index])),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyPaymentPage()));
                },
                child: Container(
                    height: 44,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: AppTheme.lightPrimaryColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5))),
                    child: Text('Thanh toán',
                        style: MyTextStyle.textStyle(
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500)))),
              ),
            ),
          ],
        ),
      ),
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
            Expanded(
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(Icons.arrow_back,
                          color: AppTheme.greyIcon, size: 28)),
                ],
              ),
            ),
            Text(
              'Giỏ hàng của bạn',
              style: MyTextStyle.textStyle(
                  style: TextStyle(
                      fontSize: 18, color: AppTheme.lightPrimaryColor)),
            ),
            Expanded(
              child: SizedBox(),
            )
          ],
        ),
      ),
    );
  }
}
