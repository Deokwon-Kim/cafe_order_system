import 'package:HERMESCAFE/Tab/custom_bottom_tab_bar.dart';
import 'package:HERMESCAFE/login/login_page.dart';
import 'package:HERMESCAFE/provider/signup_provider.dart';
import 'package:HERMESCAFE/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _checkpasswordControllet =
      TextEditingController();

  SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: size.height * 0.10),
                child: Image.asset('lib/images/logo2.png', height: 240),
              ),
              SizedBox(height: 10),
              Consumer2<SignupProvider, UserProvider>(
                builder: (context, provider, userProvider, child) {
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        TextField(
                          controller: _usernameController,
                          onChanged: provider.updateUserName,
                          decoration: InputDecoration(
                            labelText: '사용자 명',
                            errorText: provider.usernameError,
                          ),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          controller: _emailController,
                          onChanged: provider.updateEmail,
                          decoration: InputDecoration(
                            labelText: '이메일',
                            errorText: provider.emailError,
                          ),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          controller: _passwordController,
                          obscureText: true,
                          onChanged: provider.updatePassword,
                          decoration: InputDecoration(
                            labelText: '비밀번호',
                            errorText: provider.passwordError,
                          ),
                        ),
                        TextField(
                          controller: _checkpasswordControllet,
                          obscureText: true,
                          onChanged: provider.updatePassword,
                          decoration: InputDecoration(
                            labelText: '비밀번호 확인',
                            errorText: provider.passwordError,
                          ),
                        ),
                        SizedBox(height: 40),
                        GestureDetector(
                          onTap:
                              userProvider.isLoading
                                  ? null
                                  : () async {
                                    bool success = await userProvider.signUp(
                                      email: _emailController.text,
                                      password: _passwordController.text,
                                      username: _usernameController.text,
                                      checkPassword:
                                          _checkpasswordControllet.text,
                                    );
                                    ScaffoldMessenger.of(
                                      context,
                                    ).hideCurrentSnackBar();

                                    if (success) {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            '회원가입 성공! 이름: ${userProvider.currentUser?.displayName}',
                                          ),
                                        ),
                                      );
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder:
                                              (context) =>
                                                  CustomBottomNavigation(),
                                        ),
                                      );
                                    } else {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(
                                          backgroundColor: Colors.red,
                                          content: Text(
                                            '회원가입 실패!${userProvider.errorMessage ?? '알 수 없는 오류'}',
                                          ),
                                        ),
                                      );
                                    }
                                  },

                          child: Container(
                            alignment: Alignment.center,
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xfff37210),
                            ),
                            child: Text(
                              "회원가입",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '이미 회원이신가요?',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(width: 10),
                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginPage(),
                                  ),
                                );
                              },
                              child: Text(
                                '로그인',
                                style: TextStyle(
                                  color: Color(0xfff37210),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
