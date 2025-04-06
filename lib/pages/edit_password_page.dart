import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EditPasswordPage extends StatefulWidget {
  const EditPasswordPage({super.key});

  @override
  State<EditPasswordPage> createState() => _EditPasswordPageState();
}

class _EditPasswordPageState extends State<EditPasswordPage> {
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();

  Future<void> _changePassword() async {
    final currentPassword = _currentPasswordController.text.trim();
    final newPassword = _newPasswordController.text.trim();
    final user = FirebaseAuth.instance.currentUser;
  }

  if (currentPassword.isEmpty || newPas || user == null) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("모든 필드를 입력하세요.")),
    );
    return;
  }

  try {
    // 현재 비밀번호로 재인증
    final credential = EmailAuthProvider.credential(
      email: user.email!,
      password: currentPassword,
    );
    await user.reauthenticateWithCredential(credential);

    // 비밀번호 변경
    await user.updatePassword(newPassword);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("비밀번호가 변경되었습니다.")),
    );
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("비밀번호 변경 실패")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('비밀번호 변경'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("현재 비밀번호를 입력해주세요"),
            SizedBox(height: 10),
            TextField(
              controller: _currentPasswordController,
              decoration: InputDecoration(
                hintText: '현재 비밀번호',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xfff37210)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            Text("새 비밀번호를 입력해주세요 (8자 이상)"),
            SizedBox(height: 10),
            TextField(
              controller: _newPasswordController,
              decoration: InputDecoration(
                hintText: '새 비밀번호',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xfff37210)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
              obscureText: true,
            ),
            SizedBox(height: 10),
            TextField(
              controller: _newPasswordController,
              decoration: InputDecoration(
                hintText: '새 비밀번호 확인',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xfff37210)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.center,
                  width: 100,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Color(0xfff37210),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    '변경하기',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
