// ignore_for_file: use_build_context_synchronously

import 'package:HERMESCAFE/login/login_page.dart';
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
        '즐겨찾는 메뉴',
        Color(0xfff37210),
        Icon(Icons.star_border),
        'star',
      ),
      //menuItem('전자 내역', Color(0xfff37210), Icon(Icons.receipt_long)),
      menuItem(
        context,
        '주문 내역',
        Color(0xfff37210),
        Icon(Icons.receipt_long),
        '주문내역',
      ),
      // menuItem('개인정보 관리', Color(0xfff37210), Icon(Icons.receipt_long)),
      menuItem(context, '계정정보', Color(0xfff37210), Icon(Icons.person), '개인정보'),
      menuItem(
        context,
        '나의 쿠폰',
        Color(0xfff37210),
        Icon(Icons.airplane_ticket),
        '나의 쿠폰',
      ),
    ];

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 242, 241, 241),
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text('Other'),

        actions: [
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text.rich(
                      TextSpan(
                        text: username,
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xfff37210),
                          fontWeight: FontWeight.bold,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: '님',
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Text('환영합니다!', style: TextStyle(fontSize: 20)),
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
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
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
