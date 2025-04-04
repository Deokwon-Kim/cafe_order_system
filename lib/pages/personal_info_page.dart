import 'package:HERMESCAFE/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PersonalInfoPage extends StatelessWidget {
  const PersonalInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final username = Provider.of<UserProvider>(context).username;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text("계정 정보"),
            backgroundColor: Colors.white,
            shadowColor: Color.fromARGB(91, 158, 158, 158),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '닉네임 설정');
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("닉네임 설정", style: TextStyle(fontSize: 17)),
                        Row(
                          children: [
                            Text(
                              "$username",
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(width: 15),
                            Icon(Icons.chevron_right, size: 30),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("비밀번호 변경", style: TextStyle(fontSize: 17)),
                        Row(
                          children: [
                            SizedBox(width: 15),
                            Icon(Icons.chevron_right, size: 30),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("결제 인증 및 보안 설정", style: TextStyle(fontSize: 17)),
                        Row(
                          children: [
                            SizedBox(width: 15),
                            Icon(Icons.chevron_right, size: 30),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("임직원 번호 설정", style: TextStyle(fontSize: 17)),
                        Row(
                          children: [
                            SizedBox(width: 15),
                            Icon(Icons.chevron_right, size: 30),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("연결된 서비스 관리", style: TextStyle(fontSize: 17)),
                        Row(
                          children: [
                            SizedBox(width: 15),
                            Icon(Icons.chevron_right, size: 30),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
