// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:HERMESCAFE/Tab/bottom_tab_bar.dart';
import 'package:HERMESCAFE/login/auth_textfield.dart';
import 'package:HERMESCAFE/login/login_page.dart';
import 'package:HERMESCAFE/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _checkpasswordControllet =
      TextEditingController();

  SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
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
              Form(
                key: _formKey,
                child: Wrap(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: SignUpUserNameTextfield(
                        userNameController: _usernameController,
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: SignUpEmailTextField(
                        emailController: _emailController,
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: SignUpPasswordTextField(
                        passwordController: _passwordController,
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: SignUpCheckPasswordTextField(
                        checkpasswordControllet: _checkpasswordControllet,
                      ),
                    ),
                    SizedBox(height: 10),
                    GestureDetector(
                      onTap:
                          userProvider.isLoading
                              ? null
                              : () async {
                                if (_formKey.currentState!.validate()) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('회원가입 처리 중...'),
                                      duration: Duration(seconds: 1),
                                    ),
                                  );

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
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          '회원가입 성공! 이름: ${userProvider.currentUser?.displayName}',
                                        ),
                                      ),
                                    );
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => BottomTabBar(),
                                      ),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor: Colors.red,
                                        content: Text(
                                          '회원가입 실패!${userProvider.errorMessage ?? '알 수 없는 오류'}',
                                        ),
                                      ),
                                    );
                                  }
                                }
                              },
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
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
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '이미 회원이신가요?',
                          style: TextStyle(color: Colors.grey, fontSize: 15),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
