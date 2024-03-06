import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery/routes/app_route.dart';
import 'package:grocery/themes/app_theme.dart';
import 'package:grocery/themes/text_theme.dart';

class SearchHomeWidget extends StatefulWidget {
  const SearchHomeWidget({super.key});

  @override
  State<SearchHomeWidget> createState() => _SearchHomeWidgetState();
}

class _SearchHomeWidgetState extends State<SearchHomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 62,
      color: AppTheme.lightPrimaryColor,
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoute.routerSearch);
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 14),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(2))),
                  height: 38,
                  child: Row(children: [
                    const SizedBox(width: 6),
                    const Icon(Icons.search,
                        size: 24, color: Color(0xff868686)),
                    const SizedBox(width: 2),
                    Expanded(
                      child: Text('Tìm kiếm sản phẩm',
                          style: MyTextStyle.textStyle(
                              style: TextStyle(
                                  fontSize: 14, color: AppTheme.greyIcon))),
                    ),
                    const Icon(Icons.camera_alt_outlined,
                        size: 24, color: Color(0xff868686)),
                    const SizedBox(width: 6),
                  ]),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child:
                  Icon(Icons.shopify_outlined, size: 30, color: Colors.white),
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed(AppRoute.routerCart);
              },
              child: const Padding(
                padding: EdgeInsets.only(right: 12),
                child: Icon(Icons.shopping_cart_outlined,
                    size: 28, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
