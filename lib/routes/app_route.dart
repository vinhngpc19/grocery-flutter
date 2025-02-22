import 'package:get/route_manager.dart';
import 'package:grocery/pages/cart/cart_page.dart';
import 'package:grocery/pages/category/category_page.dart';
import 'package:grocery/pages/dashboard/dashboard_page.dart';
import 'package:grocery/pages/home/home_page.dart';
import 'package:grocery/pages/product_detail/product_detail_page.dart';
import 'package:grocery/pages/profile/profile_page.dart';
import 'package:grocery/pages/search/search_page.dart';
import 'package:grocery/pages/sign_in/sign_in_page.dart';
import 'package:grocery/pages/sign_up/sign_up_page.dart';

class AppRoute {
  static const String routerDashboard = '/dashboard';
  static const String routerSignIn = '/sign_in';
  static const String routerSignUp = '/sign_up';
  static const String routerHome = '/home';
  static const String routerProfile = '/profile';
  static const String routerSearch = '/search';
  static const String routerDetail = '/detail';
  static const String routerCategory = '/category';
  static const String routerCart = '/cart';

  static List<GetPage> pages = [
    GetPage(name: routerDashboard, page: () => DashboardPage()),
    GetPage(name: routerHome, page: () => HomePage()),
    GetPage(name: routerProfile, page: () => ProfilePage()),
    GetPage(name: routerSearch, page: () => SearchPage()),
    GetPage(name: routerSignIn, page: () => SignInPage()),
    GetPage(name: routerSignUp, page: () => SignUpPage()),
    GetPage(name: routerDetail, page: () => ProductDetailPage()),
    GetPage(name: routerCategory, page: () => CategoryPage()),
    GetPage(name: routerCart, page: () => CartPage()),
  ];
}
