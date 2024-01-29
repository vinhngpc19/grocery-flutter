import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:grocery/routes/app_route.dart';
import 'package:grocery/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: AppTheme.lightTheme,
      getPages: AppRoute.pages,
      initialRoute: AppRoute.routerDashboard,
      debugShowCheckedModeBanner: false,
    );
  }
}
