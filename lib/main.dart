import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:grocery/routes/app_route.dart';
import 'package:grocery/themes/app_theme.dart';

void main() {
  // change status appbar status color(time, baterry ...)
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // set appbar status color
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: AppTheme.lightPrimaryColor));
    return GetMaterialApp(
      theme: AppTheme.lightTheme,
      getPages: AppRoute.pages,
      initialRoute: AppRoute.routerDashboard,
      debugShowCheckedModeBanner: false,
    );
  }
}
