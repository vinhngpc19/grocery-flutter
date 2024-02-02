import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery/pages/profile/profile_controller.dart';
import 'package:grocery/routes/app_route.dart';
import 'package:grocery/themes/app_theme.dart';

class ProfilePage extends GetView<ProfileController> {
  @override
  final controller = Get.put(ProfileController());
  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.lightPrimaryColor,
        title: const Center(
            child: Text('Cá nhân', style: TextStyle(fontSize: 18))),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                Get.toNamed(AppRoute.routerSignIn);
              },
              child: Text('sign out'))
        ],
      ),
    );
  }
}
