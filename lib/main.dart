import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:grocery/routes/app_route.dart';
import 'package:grocery/themes/app_theme.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppTheme.setStatusBarAndNavigationBarColors(ThemeMode.dark);
  // change status appbar status color(time, baterry ...)
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  final preferences = await SharedPreferences.getInstance();

  runApp(MyApp(pref: preferences));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key, required this.pref});
  final SharedPreferences pref;
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLogin = false;
  @override
  void initState() {
    if (widget.pref.getString('username') != null) {
      isLogin = true;
    } else {
      isLogin = false;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // set appbar status color

    return RefreshConfiguration(
      maxOverScrollExtent:
          100, //The maximum dragging range of the head. Set this property if a rush out of the view area occurs
      maxUnderScrollExtent: 0, // Maximum dragging range at the bottom
      enableScrollWhenRefreshCompleted:
          true, //This property is incompatible with PageView and TabBarView. If you need TabBarView to slide left and right, you need to set it to true.
      enableLoadingWhenFailed:
          true, //In the case of load failure, users can still trigger more loads by gesture pull-up.
      hideFooterWhenNotFull:
          false, // Disable pull-up to load more functionality when Viewport is less than one screen
      enableBallisticLoad: true, // tri
      child: GetMaterialApp(
        scrollBehavior: const ScrollBehavior().copyWith(overscroll: false),
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
        initialRoute:
            isLogin ? AppRoute.routerDashboard : AppRoute.routerSignIn,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
