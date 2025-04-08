import 'package:flutter/material.dart';

class SignUpUserNameTextfield extends StatelessWidget {
  final TextEditingController userNameController;
  const SignUpUserNameTextfield({super.key, required this.userNameController});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: userNameController,
      decoration: InputDecoration(
        labelText: "UserName",
        labelStyle: TextStyle(color: Colors.black),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xfff37210)),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty || value.length > 10) {
          return '사용자 이름은 10자 이하여야 합니다.';
        }
        return null;
      },
    );
  }
}

class SignUpEmailTextField extends StatelessWidget {
  final TextEditingController emailController;
  const SignUpEmailTextField({super.key, required this.emailController});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailController,
      decoration: InputDecoration(
        labelText: "Email",
        labelStyle: TextStyle(color: Colors.black),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xfff37210)),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty || !value.contains('@')) {
          return '유효한 이메일을 입력해주세요';
        }
        return null;
      },
    );
  }
}

class SignUpPasswordTextField extends StatelessWidget {
  final TextEditingController passwordController;
  const SignUpPasswordTextField({super.key, required this.passwordController});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: passwordController,
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
        labelStyle: TextStyle(color: Colors.black),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xfff37210)),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty || value.length < 6) {
          return '비밀번호는 6자 이상이어야 합니다';
        }
        return null;
      },
    );
  }
}

class SignUpCheckPasswordTextField extends StatelessWidget {
  final TextEditingController checkpasswordControllet;
  const SignUpCheckPasswordTextField({
    super.key,
    required this.checkpasswordControllet,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: checkpasswordControllet,
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Check Password',
        labelStyle: TextStyle(color: Colors.black),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xfff37210)),
        ),
      ),
    );
  }
}
