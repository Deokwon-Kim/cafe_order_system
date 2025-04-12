import 'package:HERMESCAFE/Tab/custom_bottom_tab_bar.dart';
import 'package:HERMESCAFE/provider/cart_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class PaysuccessPage extends StatelessWidget {
  final Map<String, dynamic> orderData;
  const PaysuccessPage({super.key, required this.orderData});

  String formatAmount(int amount) {
    final formatter = NumberFormat('#,###');
    return formatter.format(amount);
  }

  @override
  Widget build(BuildContext context) {
    final items = orderData['items'] as List;
    final totalAmount = orderData['totalAmount'] as String;
    final orderId = orderData['orderId'] as String;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CartProvider>(context, listen: false).clearCart();
      savePaymentDataToFirestore();
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Column이 최소 크기로 조정되도록 설정
            children: [
              Container(
                width: double.infinity,
                height: 450,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(30, 0, 0, 0), // 그림자 색상
                      offset: Offset(4, 4), // 그림자 위치 (오른쪽 아래로 4px)
                      blurRadius: 10, // 흐림 정도
                      spreadRadius: 2, // 확산 정도
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 60,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '결제가 완료되었습니다.',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      '주문번호: $orderId',
                      style: TextStyle(color: Colors.grey[600], fontSize: 14),
                    ),
                    SizedBox(height: 20),
                    Text(
                      '주문 내역',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: items.length,
                        itemBuilder: (contex, index) {
                          final item = items[index];
                          return Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 16,
                            ),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color:
                                      index == items.length - 1
                                          ? Colors.transparent
                                          : Colors.grey.withAlpha(20),
                                ),
                              ),
                            ),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(25),
                                  child: Image.asset(
                                    item.imagePath,
                                    height: 50,
                                    width: 50,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(width: 12),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            item.name,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                          Text(
                                            item.engname,
                                            style: TextStyle(
                                              color: Colors.grey[600],
                                              fontSize: 13,
                                            ),
                                          ),
                                          Text(
                                            '${item.price}원 ${item.quantity}개',
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey.withAlpha(0),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '총 결제 금액',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            totalAmount,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Color(0xfff37210),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CustomBottomNavigation(),
                    ),
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 58,
                  decoration: BoxDecoration(
                    color: Color(0xfff37210),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '홈 으로',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> savePaymentDataToFirestore() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      print('사용자가 로그인하지 않았습니다.');
      return;
    }

    final userId = user.uid;
    final orderId = orderData['orderId'];
    final totalAmount = orderData['totalAmount'];
    final items = orderData['items'];

    final timestamp = Timestamp.now();

    try {
      await FirebaseFirestore.instance.collection('payments').add({
        'userId': userId,
        'orderId': orderId,
        'totalAmount': totalAmount,
        'timestamp': timestamp,
        'items':
            items
                .map(
                  (item) => {
                    'name': item.name,
                    'engname': item.engname,
                    'price': item.price,
                    'quantity': item.quantity,
                    'imagePath': item.imagePath,
                  },
                )
                .toList(),
      });

      print('결제 정보 저장 완료');
    } catch (e) {
      print('결제 정보 저장 실패');
    }
  }
}
