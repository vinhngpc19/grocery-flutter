import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery/pages/category/category_page.dart';
import 'package:grocery/pages/dashboard/dashboard_controller.dart';
import 'package:grocery/pages/home/home_page.dart';
import 'package:grocery/pages/profile/profile_page.dart';
import 'package:grocery/themes/app_theme.dart';
import 'package:grocery/themes/text_theme.dart';

class DashboardPage extends GetView<DashboardController> {
  DashboardPage({super.key});

  @override
  final DashboardController controller = Get.put(DashboardController());
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
          body: SafeArea(
              child: Column(
            children: [
              Expanded(
                  child: Obx(() => IndexedStack(
                        index: controller.currentIndex.value,
                        children: [
                          HomePage(),
                          CategoryPage(),
                          Container(color: Colors.red),
                          ProfilePage()
                        ],
                      ))),
            ],
          )),
          bottomNavigationBar: Obx(() => SizedBox(
                height: 55,
                child: BottomNavigationBar(
                  iconSize: 22,
                  items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home_outlined),
                      label: 'Trang chủ',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.category_outlined),
                      label: 'Danh mục',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.notifications_active_outlined),
                      label: 'Thông báo',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person_outline_rounded),
                      label: 'Cá nhân',
                    ),
                  ],
                  backgroundColor: Colors.white,
                  selectedItemColor: Colors.red,
                  unselectedItemColor: AppTheme.greyIcon,
                  type: BottomNavigationBarType.fixed,
                  unselectedLabelStyle: MyTextStyle.textStyle(
                      style: const TextStyle(fontSize: 12)),
                  selectedLabelStyle: MyTextStyle.textStyle(
                      style: const TextStyle(fontSize: 13)),
                  // unselectedItemColor: AppTheme.lightSecondaryColor,
                  currentIndex: controller.currentIndex.value,
                  onTap: controller.onTapIndex,
                ),
              ))),
    );
  }
}
