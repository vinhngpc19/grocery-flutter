import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery/models/product_model.dart';
import 'package:grocery/pages/cart/component/cart_item.dart';
import 'package:grocery/pages/dashboard/dashboard_controller.dart';
import 'package:grocery/themes/app_theme.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';

class Product {
  final String name;
  final double price;
  final String imageUrl;

  Product({required this.name, required this.price, required this.imageUrl});
}

class MyPaymentPage extends StatefulWidget {
  const MyPaymentPage({super.key});
  @override
  _MyPaymentPageState createState() => _MyPaymentPageState();
}

class _MyPaymentPageState extends State<MyPaymentPage> {
  List<ProductModel> listCarts = [];

  int _totalPrice = 0;
  String _customerName = '';
  String _customerPhone = '';
  String _customerAddress = '';

  @override
  void initState() {
    listCarts.addAll(Get.find<DashboardController>().listCart);

    _calculateTotalPrice();
    super.initState();
  }

  void _calculateTotalPrice() {
    int totalPrice = 0;

    for (ProductModel item in listCarts) {
      var total = int.tryParse(item.totalPrice!)! * item.quantityCart;
      totalPrice = totalPrice + total;
    }
    setState(() {
      _totalPrice = totalPrice;
    });
  }

  void _updateCustomerInfo(String name, String phone, String address) {
    setState(() {
      _customerName = name;
      _customerPhone = phone;
      _customerAddress = address;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Thanh toán đơn hàng',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppTheme.lightPrimaryColor),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'THÔNG TIN KHÁCH HÀNG:',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Autobot1 - 0123456789',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      TextButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Thay đổi'),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextField(
                                      decoration: const InputDecoration(
                                          labelText: 'Họ và tên'),
                                      onChanged: (value) {
                                        _customerName = value;
                                      },
                                    ),
                                    TextField(
                                      decoration: const InputDecoration(
                                          labelText: 'Số điện thoại'),
                                      onChanged: (value) {
                                        _customerPhone = value;
                                      },
                                    ),
                                    Row(
                                      children: [
                                        TextField(
                                          decoration: const InputDecoration(
                                              labelText: 'Địa chỉ'),
                                          onChanged: (value) {
                                            _customerAddress = value;
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      _updateCustomerInfo(_customerName,
                                          _customerPhone, _customerAddress);
                                    },
                                    child: const Text('Thay đổi'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: const Text(
                          'Thay đổi',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    'Địa chỉ: Tố Hữu, P.Yên Nghĩa, Q.Hà Đông, Hà Nội',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'SẢN PHẨM:',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
            ),
            Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: listCarts.length,
                    itemBuilder: (context, index) =>
                        CartItem(productModel: listCarts[index]))),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Text(
                    'THANH TOÁN',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Chọn phương thức',
                    style: TextStyle(fontSize: 16, color: Colors.blueAccent),
                  ),
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  const Text(
                    'CHI TIẾT THANH TOÁN',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Text(
                        'Tiền hàng: ',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      const Spacer(),
                      Text(
                        NumberFormat.simpleCurrency(name: 'VND')
                            .format(_totalPrice),
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  const Row(
                    children: [
                      Text(
                        'Phí giao hàng: ',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      Spacer(),
                      Text(
                        'Miễn phí',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.green),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(), // Đường phân cách
            // Nút thanh toán
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tổng tiền:  ${NumberFormat.simpleCurrency(name: 'VND').format(_totalPrice)}',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      showCupertinoModalPopup<void>(
                        context: context,
                        builder: (BuildContext context) => CupertinoAlertDialog(
                          title: const Text('Xác nhận mua hàng'),
                          content: const Text(
                              'Bạn có muốn thanh toán những sản phẩm này?'),
                          actions: <CupertinoDialogAction>[
                            CupertinoDialogAction(
                              /// This parameter indicates this action is the default,
                              /// and turns the action's text to bold text.
                              isDefaultAction: true,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Quay lại',
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 20, 127, 214))),
                            ),
                            CupertinoDialogAction(
                              /// This parameter indicates the action would perform
                              /// a destructive action such as deletion, and turns
                              /// the action's text color to red.
                              isDestructiveAction: true,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Đặt mua'),
                            ),
                          ],
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.lightPrimaryColor,
                        shape: const BeveledRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(2))),
                        foregroundColor: Colors.white),
                    child: const Text(
                      'Thanh toán',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
