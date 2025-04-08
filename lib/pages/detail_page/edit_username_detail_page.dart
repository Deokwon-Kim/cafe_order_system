// ignore_for_file: use_build_context_synchronously
import 'package:HERMESCAFE/login/login_page.dart';
import 'package:HERMESCAFE/provider/user_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditUsernameDetailPage extends StatefulWidget {
  const EditUsernameDetailPage({super.key});

  @override
  State<EditUsernameDetailPage> createState() => _EditUsernameDetailPageState();
}

class _EditUsernameDetailPageState extends State<EditUsernameDetailPage> {
  final _usernameController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(title: Text('닉네임 설정'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("닉네임을 입력해주세요. (한글 최대 ?자)"),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xfff37210)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      hintText: '현재 닉네임:${user?.displayName}',
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    await userProvider.updateDisplayName(
                      _usernameController.text,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          '닉네임 변경 성공! 재로그인 해주세요!',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        backgroundColor: Colors.blueAccent,
                      ),
                    );
                    userProvider.signOut();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Container(
                      alignment: Alignment.center,
                      width: 80,
                      height: 57,
                      decoration: BoxDecoration(
                        color: Color(0xfff37210),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        "저장하기",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
