import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 236, 236),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 120.0, left: 20),
                child: Text.rich(
                  TextSpan(
                    text: '닉네임 님\n환영합니다 ',
                    style: TextStyle(fontSize: 20),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'HERMES COFFEE',
                        style: TextStyle(
                          color: Color(0xfff37210),
                          fontFamily: 'HERMES',
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' 입니다.',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          Container(
            width: 320,
            height: 500,
            color: Color(0xfff37210),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('lib/images/coffee-cup2.png'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '사용가능 카드 없음',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
