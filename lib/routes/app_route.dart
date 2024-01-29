import 'package:get/route_manager.dart';
import 'package:grocery/pages/dashboard/dashboard_page.dart';
import 'package:grocery/pages/home/home_page.dart';

class AppRoute {
  static const String routerDashboard = '/dashboard';
  static const String routerSignIn = '/sign_in';
  static const String routerHome = '/home';

  static List<GetPage> pages = [
    GetPage(name: routerDashboard, page: () => const DashboardPage()),
    GetPage(name: routerHome, page: () => const HomePage()),
  ];
}
