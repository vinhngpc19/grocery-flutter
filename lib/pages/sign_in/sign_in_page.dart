import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery/component/custom_button.dart';
import 'package:grocery/component/custom_input_text.dart';
import 'package:grocery/component/custom_login_fb_gg.dart';
import 'package:grocery/pages/sign_in/sign_in_controller.dart';

class SignInPage extends GetView<SignInController> {
  @override
  final controller = Get.put(SignInController());
  SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: LayoutBuilder(builder:
                  (BuildContext context, BoxConstraints viewportConstraints) {
                return SingleChildScrollView(
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: viewportConstraints.maxHeight,
                    ),
                    child: IntrinsicHeight(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Đăng nhập tài khoản',
                              style: TextStyle(
                                  fontSize: 24, fontStyle: FontStyle.italic)),
                          const SizedBox(height: 30),
                          const CustomInputText(hintText: 'Nhập địa chỉ Email'),
                          const SizedBox(height: 10),
                          const CustomInputText(
                              hintText: 'Nhập mật khẩu',
                              type: TextInputType.visiblePassword,
                              isPassword: true),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text('Quên mật khẩu',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontStyle: FontStyle.italic,
                                        color: const Color(0xff000000)
                                            .withOpacity(0.6))),
                              ],
                            ),
                          ),
                          const SizedBox(height: 30),
                          CustomButton(
                            title: 'Đăng nhập',
                            onTap: () {},
                          ),
                          const SizedBox(height: 30),
                          const CustomLoginFbGg(title: 'Hoặc đăng nhập bằng'),
                          const SizedBox(height: 30),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('Bạn chưa có tài khoản?'),
                                Padding(
                                  padding: const EdgeInsets.only(left: 6),
                                  child: GestureDetector(
                                      onTap: () {
                                        // Get.toNamed(AppRoute.signUp);
                                      },
                                      child: const Text('Đăng ký ngay',
                                          style: TextStyle(
                                              decoration:
                                                  TextDecoration.underline))),
                                )
                              ])
                        ],
                      ),
                    ),
                  ),
                );
              }))),
    );
  }
}
