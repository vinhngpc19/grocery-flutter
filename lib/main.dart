import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:grocery/routes/app_route.dart';
import 'package:grocery/themes/app_theme.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

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
      localizationsDelegates: const [
        RefreshLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('uk'),
      ],
      locale: const Locale('en'),
      theme: AppTheme.lightTheme,
      getPages: AppRoute.pages,
      initialRoute: AppRoute.routerDashboard,
      debugShowCheckedModeBanner: false,
    );
  }
}
