// ignore_for_file: avoid_print
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String _username = '';
  String get username => _username;

  // Firestore에서 username 가져오기
  Future<void> fetchUsername() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;

    if (uid == null) return;

    try {
      final doc =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();

      _username = doc.data()?['username'] ?? '';
      notifyListeners();
    } catch (e) {
      print('유저네임 가져오기 실패: $e');
    }
  }

  void clearUserData() {
    _username = '';
    notifyListeners();
  }

  void signOut() async {
    await FirebaseAuth.instance.signOut();
    notifyListeners();
  }
}
