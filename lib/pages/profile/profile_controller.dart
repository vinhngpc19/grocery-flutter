import 'package:get/get.dart';
import 'package:grocery/routes/app_route.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  RxString username = ''.obs;

  @override
  void onInit() async {
    final preferences = await SharedPreferences.getInstance();
    username.value = preferences.getString('username') ?? '';

    super.onInit();
  }

  Future<void> signout() async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.clear();
    Get.offAllNamed(AppRoute.routerSignIn);
  }
}
