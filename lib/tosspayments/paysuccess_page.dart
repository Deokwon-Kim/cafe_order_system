import 'package:HERMESCAFE/Tab/bottom_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PaysuccessPage extends StatelessWidget {
  const PaysuccessPage({super.key});

  String formatAmount(int amount) {
    final formatter = NumberFormat('#,###');
    return formatter.format(amount);
  }

  // Format amount with commas

  @override
  Widget build(BuildContext context) {
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
                height: 200,
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.check_circle, color: Colors.green, size: 80),
                    SizedBox(height: 20),
                    Text(
                      '결제가 완료되었습니다.',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 100),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => BottomTabBar()),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
