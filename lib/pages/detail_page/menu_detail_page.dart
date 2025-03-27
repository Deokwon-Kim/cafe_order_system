import 'package:cafe_order_system/model/cafe.dart';
import 'package:cafe_order_system/viewModel/cafe_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuDetailPage extends StatelessWidget {
  final Cafe? cafeMenu;
  const MenuDetailPage({super.key, required this.cafeMenu});

  @override
  Widget build(BuildContext context) {
    final Cafe displayCafe =
        cafeMenu ?? Provider.of<CafeViewmodel>(context).selectedCafe!;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Image.asset(displayCafe.imagePath, fit: BoxFit.cover),
          Positioned(
            top: 50,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50.0, left: 20),
                child: Text(
                  displayCafe.name,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100.0, left: 20),
                child: Text(
                  displayCafe.engname,
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 200.0, left: 20),
                child: Text(
                  displayCafe.discription,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Color(0xffa2a2a2),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 350.0, left: 20),
                child: Text(
                  '${displayCafe.price}원',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 750.0,
                    left: 20,
                    right: 20,
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 58,
                    decoration: BoxDecoration(
                      color: Color(0xfff37210),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      '주문하기',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
