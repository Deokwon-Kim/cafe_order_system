import 'package:HERMESCAFE/model/cafe.dart';
import 'package:HERMESCAFE/provider/cart_provider.dart';
import 'package:HERMESCAFE/provider/menu_detail_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DesertDetailPage extends StatefulWidget {
  final Cafe cafeMenu;
  const DesertDetailPage({super.key, required this.cafeMenu});

  @override
  State<DesertDetailPage> createState() => _DesertDetailPageState();
}

class _DesertDetailPageState extends State<DesertDetailPage> {
  @override
  void initState() {
    super.initState();
    // 페이지가 생성될 때 수량 초기화 및 온도 옵션 설정
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final menuDetailProvider = context.read<MenuDetailProvider>();
      menuDetailProvider.resetQuantity();
    });
  }

  void addToCart() {
    final menuDetailProvider = context.read<MenuDetailProvider>();
    if (menuDetailProvider.quantity > 0) {
      final cartProvider = context.read<CartProvider>();
      // Set the quantity from MenuDetailProvider to the cafe menu item
      widget.cafeMenu.quantity = menuDetailProvider.quantity;
      cartProvider.addToCart(widget.cafeMenu);

      showDialog(
        context: context,
        builder:
            (context) => AlertDialog(
              backgroundColor: Colors.white,
              content: Container(
                alignment: Alignment.center,
                width: 200,
                height: 50,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 23.0),
                      child: Text(
                        '장바구니 추가완료',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'cart');
                  },
                  child: Text(
                    '장바구니로 이동',
                    style: TextStyle(
                      color: Color(0xfff37210),
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<MenuDetailProvider, CartProvider>(
      builder: (context, menuDetailProvider, cartProvider, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              Image.asset(widget.cafeMenu.imagePath, fit: BoxFit.cover),
              Positioned(
                top: 50,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0, left: 20),
                    child: Text(
                      widget.cafeMenu.name,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
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
                      widget.cafeMenu.engname,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 200.0,
                      left: 20,
                      right: 20,
                    ),
                    child: Text(
                      widget.cafeMenu.discription,
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
                    padding: const EdgeInsets.only(top: 320.0, left: 20),
                    child: Text(
                      '${widget.cafeMenu.price}원',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 550.0, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () => menuDetailProvider.removeQuantity(),
                      icon: Icon(Icons.remove, color: Colors.black),
                    ),
                    SizedBox(
                      width: 40,
                      child: Center(
                        child: Text(
                          menuDetailProvider.quantity.toString(),
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ),
                    ),

                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),

                      child: IconButton(
                        onPressed: () => menuDetailProvider.addQuantity(),
                        icon: Icon(Icons.add, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      addToCart();
                    },
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
                          '장바구니에 담기',
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
      },
    );
  }
}
