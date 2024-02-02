import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery/themes/app_theme.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.title, required this.onTap});
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 46,
        width: Get.width,
        decoration: BoxDecoration(
            color: AppTheme.lightPrimaryColor,
            borderRadius: const BorderRadius.all(Radius.circular(5))),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
