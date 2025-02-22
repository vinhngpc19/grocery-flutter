import 'package:flutter/material.dart';
import 'package:grocery/r.dart';
import 'package:grocery/themes/text_theme.dart';

class CustomLoginFbGg extends StatelessWidget {
  const CustomLoginFbGg({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: MyTextStyle.textStyle(style: TextStyle())),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AssetImages.google,
              height: 32,
              width: 32,
            ),
            const SizedBox(
              width: 20,
            ),
            Image.asset(
              AssetImages.facebook,
              height: 32,
              width: 32,
            ),
          ],
        ),
      ],
    );
  }
}
