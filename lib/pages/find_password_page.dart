import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FindPasswordPage extends StatelessWidget {
  const FindPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('비밀번호 찾기')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '비밀번호를 잊으셨나요?',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                '이메일을 입력하시면 비밀번호 재설정 링크를 보내드립니다.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: '이메일 주소',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  firebaseSignIn(BuildContext context) async {
                    try {
                      await FirebaseAuth.instance.sendPasswordResetEmail(
                        email: emailController.text,
                      );
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'invalid-email') {
                        ScaffoldMessenger.of(context).showSnackBar(
                          snackBar(content: Text('유효하지 않은 이메일입니다.')),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          snackBar(content: Text('이메일 전송 실패: ${e.message}')),
                        );
                      }
                    }
                  }
                },
                child: Text('비밀번호 재설정 이메일 보내기'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
