import 'package:cafe_order_system/model/cafe.dart';
import 'package:cafe_order_system/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuDetailPage extends StatefulWidget {
  final Cafe cafeMenu;
  const MenuDetailPage({super.key, required this.cafeMenu});

  @override
  State<MenuDetailPage> createState() => _MenuDetailPageState();
}

class _MenuDetailPageState extends State<MenuDetailPage> {
  final viewModel = CartProvider();

  void addToCart() {
    if (viewModel.quantityCount > 0) {
      final viewModel = context.read<CartProvider>();
      viewModel.addToCart(widget.cafeMenu, viewModel.quantityCount);

      showDialog(
        context: context,
        builder:
            (context) => AlertDialog(
              backgroundColor: Colors.white,
              content: Text(
                '장바구니 추가완료',
                style: TextStyle(color: Colors.black),
                textAlign: TextAlign.center,
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'cart');
                  },
                  icon: Icon(Icons.done, color: Colors.black),
                ),
              ],
            ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, viewModel, child) {
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
                      onPressed: viewModel.decrementQuantity,
                      icon: Icon(Icons.remove, color: Colors.black),
                    ),
                    SizedBox(
                      width: 40,
                      child: Center(
                        child: Text(
                          viewModel.quantityCount.toString(),
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
                        onPressed: viewModel.incrementQuantity,
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
      },
    );
  }
}
