import 'package:flutter/material.dart';

class SignupProvider extends ChangeNotifier {
  String _username = '';
  String _email = '';
  String _password = '';
  String? usernameError;
  String? emailError;
  String? passwordError;

  void updateUserName(String value) {
    _username = value;
    if (_username.length > 5) {
      usernameError = '사용자 명은 5자 이하여야 합니다';
    } else {
      usernameError = null;
    }
    notifyListeners();
  }

  void updateEmail(String value) {
    _email = value;
    if (!_email.contains('@')) {
      emailError = '유효한 이메일을 입력해주세요';
    } else {
      emailError = null;
    }
    notifyListeners();
  }

  void updatePassword(String value) {
    _password = value;
    if (_password.length < 6) {
      passwordError = '비밀번호는 6자 이상이어야 합니다';
    } else {
      passwordError = null;
    }
    notifyListeners();
  }

  bool get isValid =>
      usernameError == null && emailError == null && passwordError == null;
}
