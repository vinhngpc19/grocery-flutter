import 'package:flutter/material.dart';
import 'package:grocery/themes/app_theme.dart';

class SearchInputWidget extends StatefulWidget {
  const SearchInputWidget({super.key});

  @override
  State<SearchInputWidget> createState() => _SearchInputWidgetState();
}

class _SearchInputWidgetState extends State<SearchInputWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      color: AppTheme.lightPrimaryColor,
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Row(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 14),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(2))),
                height: 38,
                child: Row(children: [
                  const SizedBox(width: 8),
                  const Icon(Icons.search, size: 26, color: Color(0xff868686)),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text('Tìm kiếm sản phẩm',
                        style:
                            TextStyle(fontSize: 14, color: AppTheme.greyIcon)),
                  ),
                  const Icon(Icons.camera_alt_outlined,
                      size: 26, color: Color(0xff868686)),
                  const SizedBox(width: 8),
                ]),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Icon(Icons.notifications_none_outlined,
                  size: 28, color: Colors.white),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 14),
              child: Icon(Icons.shopping_cart_outlined,
                  size: 28, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
