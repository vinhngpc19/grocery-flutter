import 'package:flutter/material.dart';

class CustomLoginFbGg extends StatelessWidget {
  const CustomLoginFbGg({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/google.png',
              height: 32,
              width: 32,
            ),
            const SizedBox(
              width: 20,
            ),
            Image.asset(
              'assets/images/facebook.png',
              height: 32,
              width: 32,
            ),
          ],
        ),
      ],
    );
  }
}
