import 'package:flutter/material.dart';

class PersonSecurityPage extends StatelessWidget {
  const PersonSecurityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('개인정보 보호')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              '개인정보 보호 정책',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text('여기에 개인정보 보호 정책 내용을 입력하세요.', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
