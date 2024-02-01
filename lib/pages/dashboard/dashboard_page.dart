import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery/pages/dashboard/dashboard_controller.dart';
import 'package:grocery/pages/home/home_page.dart';
import 'package:grocery/themes/app_theme.dart';

class DashboardPage extends GetView<DashboardController> {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final DashboardController controller = Get.put(DashboardController());
    return Scaffold(
        body: SafeArea(
            child: Column(
          children: [
            Expanded(
                child: Obx(() => IndexedStack(
                      index: controller.currentIndex.value,
                      children: [
                        HomePage(),
                        Container(color: Colors.yellow),
                        Container(color: Colors.green),
                        Container(color: Colors.red),
                        Container(color: Colors.blue),
                      ],
                    ))),
          ],
        )),
        bottomNavigationBar: Obx(() => BottomNavigationBar(
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
                  icon: Icon(Icons.messenger_outline_outlined),
                  label: 'Tin nhắn',
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
              type: BottomNavigationBarType.fixed,
              selectedLabelStyle: const TextStyle(fontSize: 12),
              unselectedItemColor: AppTheme.lightSecondaryColor,
              currentIndex: controller.currentIndex.value,
              onTap: controller.onTapIndex,
            )));
  }
}
