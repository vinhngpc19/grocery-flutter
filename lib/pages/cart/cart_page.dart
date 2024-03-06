import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery/themes/app_theme.dart';
import 'package:grocery/themes/text_theme.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

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
                  // child: ListView.builder(itemBuilder: itemBuilder),
                  ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              child: Container(
                  height: 44,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: AppTheme.lightPrimaryColor,
                      borderRadius: const BorderRadius.all(Radius.circular(5))),
                  child: Text('Thanh toán',
                      style: MyTextStyle.textStyle(
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500)))),
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
