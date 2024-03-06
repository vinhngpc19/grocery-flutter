import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery/api_manager/rest_client.dart';

class SignUpController extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  Future<void> handleSignUp() async {
    await RestClient().signUp(
        usernameController.text, passwordController.text, emailController.text);
  }
}
