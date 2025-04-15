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
    User? user = FirebaseAuth.instance.currentUser;
    final username = Provider.of<UserProvider>(context, listen: false);
    final size = MediaQuery.of(context).size;

    final List<Widget> gridItems = [
      menuItem(
        context,
        '즐겨찾는 메뉴',
        Color(0xfff37210),
        Icon(Icons.star_border),
        'star',
      ),

      menuItem(
        context,
        '결제내역',
        Color(0xfff37210),
        Icon(Icons.receipt_long),
        '주문내역',
      ),
      menuItem(context, '계정정보', Color(0xfff37210), Icon(Icons.person), '개인정보'),
      menuItem(
        context,
        '개인정보 관리',
        Color(0xfff37210),
        Icon(Icons.receipt_long),
        '개인정보 보호호',
      ),

      menuItem(
        context,
        '나의 쿠폰',
        Color(0xfff37210),
        Icon(Icons.airplane_ticket),
        '나의 쿠폰',
      ),
      menuItem(
        context,
        '고객의 소리',
        Color(0xfff37210),
        Icon(Icons.surround_sound),
        '고객의 소리',
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
            onPressed: () {
              username.signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
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
                          text: user?.displayName,
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xfff37210),
                            fontWeight: FontWeight.bold,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: '님',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
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
                      physics: NeverScrollableScrollPhysics(),
                      children: gridItems,
                    ),
                  ),

                  Transform.translate(
                    offset: Offset(0, 5),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Pay',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Icon(Icons.payment, color: Color(0xfff37210)),
                                  SizedBox(width: 10),
                                  Text(
                                    '에르메스 카드 등록',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xfff37210),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 40),

                            TextButton(
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Icon(Icons.sd_card, color: Color(0xfff37210)),

                                  SizedBox(width: 10),
                                  Text(
                                    '카드 교환권 등록',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xfff37210),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.credit_card,
                                    color: Color(0xfff37210),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    '결제수단 관리',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xfff37210),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 72),
                            TextButton(
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.receipt_long,
                                    color: Color(0xfff37210),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    '모바일 상품권 등록',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xfff37210),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Delivers',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Row(
                              children: [
                                Icon(Icons.payment, color: Color(0xfff37210)),
                                SizedBox(width: 10),
                                Text(
                                  '주문하기',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xfff37210),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 105),

                          TextButton(
                            onPressed: () {},
                            child: Row(
                              children: [
                                Icon(Icons.sd_card, color: Color(0xfff37210)),

                                SizedBox(width: 10),
                                Text(
                                  '장바구니',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xfff37210),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Row(
                              children: [
                                Icon(
                                  Icons.credit_card,
                                  color: Color(0xfff37210),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  '히스토리',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xfff37210),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
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
