import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery/pages/profile/profile_controller.dart';
import 'package:grocery/routes/app_route.dart';
import 'package:grocery/themes/app_theme.dart';
import 'package:grocery/themes/text_theme.dart';

class ProfilePage extends GetView<ProfileController> {
  @override
  final controller = Get.put(ProfileController());
  ProfilePage({super.key});
  List textview = ['Xem gần đây', 'Đánh giá của tôi', 'Shop theo dõi'];
  List text2 = [
    'Thông tin của tôi',
    'Thông tin nhận hàng',
    'Ví Senpay',
    'Thẻ và tài khoản liên kết',
    'Lấy mã OTP / Quản lý thiết bị',
    'Cài đặt thông báo',
    'Quét mã QR',
    'Quy chế hoạt động',
    'Giới thiệu Sendo',
    'Yêu cầu xóa tài khoản'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppTheme.lightPrimaryColor,
        title: Center(
            child: Text('Cá nhân',
                style: MyTextStyle.textStyle(
                    style: TextStyle(fontSize: 18, color: Colors.white)))),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 13.0),
          child: Column(
            children: [
              _abc(),
              aaa(),
              _def(),
              GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoute.routerSignIn);
                },
                child: Container(
                  width: 350,
                  height: 40,
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    // border: Border.all(
                    //   color: Colors.grey,
                    //   width: 1,
                    // ),
                    borderRadius: BorderRadius.circular(7),
                    color: const Color.fromARGB(255, 210, 210, 210),
                  ),
                  child: Center(
                      child: Text('Đăng xuất',
                          style: MyTextStyle.textStyle(
                              style: TextStyle(fontWeight: FontWeight.w500)))),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _abc() {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12),
      child: Column(
        children: [
          Row(
            children: [
              Stack(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage('assets/images/none_avt.jpeg')),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    // child: Image.asset('assets/images/none_avt.jpeg'),
                  ),
                  Positioned(
                    right: 4,
                    bottom: 5,
                    child: SizedBox(
                      width: 20,
                      height: 20,
                      child: IconButton(
                          iconSize: 14,
                          onPressed: () => {},
                          icon: Icon(Icons.add_a_photo)),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "autobot",
                    style: MyTextStyle.textStyle(
                        style: TextStyle(fontWeight: FontWeight.w600)),
                  ),
                  Row(
                    children: [
                      Text('Thông tin của tôi',
                          style: MyTextStyle.textStyle(
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w500))),
                      const SizedBox(
                        width: 4,
                      ),
                      SizedBox(
                        width: 13,
                        height: 13,
                        child: InkWell(
                          onTap: () => {},
                          child: const Icon(
                            Icons.pending_outlined,
                            size: 13,
                            color: Colors.grey,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),

          ///
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                textview.length,
                (index) => Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Column(
                    children: [
                      Text('6',
                          style: MyTextStyle.textStyle(
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w800),
                          )),
                      Text(textview[index],
                          style: MyTextStyle.textStyle(
                            style:
                                TextStyle(fontSize: 15, color: Colors.black54),
                          )),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget aaa() {
    return Container(
      height: 10,
      color: Colors.black12,
    );
  }

  Widget _def() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: text2.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
              child: InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.account_circle_outlined, size: 24),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(text2[index],
                            style: MyTextStyle.textStyle(
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400))),
                      ],
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 20,
                    )
                  ],
                ),
              ),
            ),
            text2[index] == 'Lấy mã OTP / Quản lý thiết bị' ||
                    text2[index] == 'Thông tin nhận hàng' ||
                    text2[index] == 'Cài đặt thông báo' ||
                    text2[index] == 'Cài đặt thông báo' ||
                    text2[index] == 'Giới thiệu Sendo'
                ? aaa()
                : Container()
          ],
        );
      },
    );
  }
}
