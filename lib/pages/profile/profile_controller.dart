import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:grocery/routes/app_route.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  Future<void> signout() async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.clear();
    Get.offAllNamed(AppRoute.routerSignIn);
  }
}
