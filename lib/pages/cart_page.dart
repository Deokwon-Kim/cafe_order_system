import 'package:cafe_order_system/Tab/bottom_tab_bar.dart';
import 'package:cafe_order_system/model/cafe.dart';
import 'package:cafe_order_system/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void removeFromCart(Cafe cafe, BuildContext context) {
    final viewModel = context.read<CartProvider>();
    viewModel.removeFromCart(cafe);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder:
          (context, value, child) => Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => BottomTabBar()),
                  );
                },
                icon: Icon(Icons.arrow_back_ios_new),
              ),
              backgroundColor: Color(0xfff37210),
              foregroundColor: Colors.white,
              title: Text(
                '장바구니',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: value.cart.length,
                    itemBuilder: (context, index) {
                      final Cafe cafe = value.cart[index];
                      final String image = cafe.imagePath;
                      final String menuName = cafe.name;
                      final String menuPrice = cafe.price;

                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        margin: EdgeInsets.only(left: 10, top: 20, right: 10),
                        child: ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image.asset(image, height: 300),
                          ),
                          title: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              menuName,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              '$menuPrice원',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          trailing: IconButton(
                            onPressed: () => removeFromCart(cafe, context),
                            icon: Icon(Icons.delete),
                            color: Colors.black,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
    );
  }
}
