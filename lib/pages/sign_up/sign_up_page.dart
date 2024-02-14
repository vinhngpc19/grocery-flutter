import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery/component/custom_button.dart';
import 'package:grocery/component/custom_input_text.dart';
import 'package:grocery/component/custom_login_fb_gg.dart';
import 'package:grocery/pages/sign_up/sign_up_controller.dart';
import 'package:grocery/routes/app_route.dart';

class SignUpPage extends GetView<SignUpController> {
  SignUpPage({super.key});

  @override
  final controller = Get.put(SignUpController());

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
                          const Text('Tạo tài khoản mới',
                              style: TextStyle(
                                  fontSize: 24, fontStyle: FontStyle.italic)),
                          const SizedBox(height: 30),
                          const CustomInputText(hintText: 'Nhập tên tài khoản'),
                          const SizedBox(height: 10),
                          const CustomInputText(hintText: 'Nhập địa chỉ Email'),
                          const SizedBox(height: 10),
                          const CustomInputText(
                              hintText: 'Nhập mật khẩu',
                              type: TextInputType.visiblePassword,
                              isPassword: true),
                          const SizedBox(height: 10),
                          const CustomInputText(
                              hintText: 'Xác nhận mật khẩu',
                              type: TextInputType.visiblePassword,
                              isPassword: true),
                          const SizedBox(height: 30),
                          CustomButton(
                            title: 'Đăng ký',
                            onTap: () {},
                          ),
                          const SizedBox(height: 30),
                          const CustomLoginFbGg(title: 'Hoặc đăng nhập bằng'),
                          const SizedBox(height: 30),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('Bạn đã có tài khoản? '),
                                Padding(
                                  padding: const EdgeInsets.only(left: 6),
                                  child: GestureDetector(
                                      onTap: () {
                                        Get.toNamed(AppRoute.routerSignIn);
                                      },
                                      child: const Text('Đăng nhập ngay',
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
