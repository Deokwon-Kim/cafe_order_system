import 'package:flutter/material.dart';

class PersonSecurityPage extends StatelessWidget {
  const PersonSecurityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('개인정보 보호')),
      body: Column(children: [Center(child: Text('개인정보 보호'))]),
    );
  }
}
