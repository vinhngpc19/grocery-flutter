import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery/api_manager/rest_client.dart';

class SignInController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passWordController = TextEditingController();

  Future<void> handleSignIn() async {
    await RestClient().logIn(emailController.text, passWordController.text);
  }
}
