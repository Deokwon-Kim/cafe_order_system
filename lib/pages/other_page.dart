import 'package:HERMESCAFE/login/login_page.dart';
import 'package:HERMESCAFE/provider/user_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OtherPage extends StatelessWidget {
  const OtherPage({super.key});

  @override
  Widget build(BuildContext context) {
    final username = Provider.of<UserProvider>(context).username;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Other'),

        actions: [
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              Text(
                "$username님 \n환영합니다!",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30),
              Container(
                color: Colors.grey,
                width: size.width * 0.9,
                height: size.height * 0.4,
                child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  children: [
                    Container(
                      width: size.width * 0.8,
                      height: size.height * 0.9,
                      color: Colors.red,
                    ),
                    SizedBox(width: 50),
                    Container(
                      width: size.width * 0.5,
                      height: size.height * 0.5,
                      color: Colors.blue,
                    ),
                    SizedBox(height: 30),
                    Container(
                      width: size.width * 0.5,
                      height: size.height * 0.5,
                      color: Colors.blue,
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
