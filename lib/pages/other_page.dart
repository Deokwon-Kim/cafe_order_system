import 'package:HERMESCAFE/provider/user_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OtherPage extends StatelessWidget {
  const OtherPage({super.key});

  @override
  Widget build(BuildContext context) {
    final username = Provider.of<UserProvider>(context).username;

    final List<Widget> gridItems = [
      menuItem(
        context,
        '별 히스토리',
        Color(0xfff37210),
        Icon(Icons.star_border),
        'star_detail',
      ),
      //menuItem('전자 내역', Color(0xfff37210), Icon(Icons.receipt_long)),
      menuItem(
        context,
        '주문 내역',
        Color(0xfff37210),
        Icon(Icons.receipt_long),
        'order_history',
      ),
      // menuItem('개인정보 관리', Color(0xfff37210), Icon(Icons.receipt_long)),
      menuItem(
        context,
        '계정정보',
        Color(0xfff37210),
        Icon(Icons.person),
        'personal_info',
      ),
      //menuItem('나만의 메뉴', Color(0xfff37210), Icon(Icons.notifications)),
    ];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Other'),

        actions: [
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              Text(
                "$username님 \n환영합니다!",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30),
              SizedBox(
                height: 300,
                child: GridView.count(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: gridItems,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget menuItem(
  BuildContext context,
  String title,
  Color color,
  Icon icon,
  String routeName,
) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, routeName);
    },
    child: Container(
      decoration: BoxDecoration(color: Colors.white),
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon.icon, color: color, size: 50),
          Text(
            title,
            style: TextStyle(fontSize: 13, color: Color(0xfff37210)),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
  );
}
