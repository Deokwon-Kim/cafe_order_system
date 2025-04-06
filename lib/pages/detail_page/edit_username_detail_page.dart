import 'package:HERMESCAFE/provider/user_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

  Future<void> _updateUsername() async {
    final newUsername = _usernameController.text.trim();
    final uid = FirebaseAuth.instance.currentUser?.uid;

    if (newUsername.isEmpty) return;

    try {
      await FirebaseFirestore.instance.collection('users').doc(uid).update({
        'username': newUsername,
      });

      Provider.of<UserProvider>(context, listen: false).fetchUsername();

      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('닉네임이 변경되었습니다.')));
        Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('닉네임 변경 실패')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final username = Provider.of<UserProvider>(context).username;

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
                      hintText: "$username",
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _updateUsername();
                    Navigator.pop(context);
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
