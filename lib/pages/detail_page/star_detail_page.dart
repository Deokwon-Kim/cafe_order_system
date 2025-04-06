import 'package:flutter/material.dart';

class StarDetailPage extends StatelessWidget {
  const StarDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("즐겨찾기")),
      body: Center(
        child: Text("즐겨찾기 메뉴가 없습니다.", style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
