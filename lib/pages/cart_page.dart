import 'package:HERMESCAFE/Tab/bottom_tab_bar.dart';
import 'package:HERMESCAFE/model/cafe.dart';
import 'package:HERMESCAFE/provider/cart_provider.dart';
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
                // 장바구니 비어있을시 비어있음 텍스트 표시
                value.cart.isEmpty
                    ? Expanded(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.shopping_cart_outlined,
                              size: 80,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 16),
                            Text(
                              '장바구니가 비었습니다',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[700],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                    : Expanded(
                      child: ListView.builder(
                        itemCount: value.cart.length,
                        itemBuilder: (context, index) {
                          final Cafe cafe = value.cart[index];
                          final String image = cafe.imagePath;
                          final String menuName = cafe.name;
                          final String engNmae = cafe.engname;
                          final String menuPrice = cafe.price;

                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            margin: EdgeInsets.only(
                              left: 10,
                              top: 20,
                              right: 10,
                            ),
                            child: ListTile(
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.asset(image, height: 300),
                              ),
                              title: Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      menuName,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                    Text(
                                      engNmae,
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 13,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                    Text(
                                      '$menuPrice원',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 50.0),
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 350,
                          height: 58,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color:
                                value.cart.isEmpty
                                    ? Colors.grey
                                    : Color(0xfff37210),
                          ),
                          child: Text(
                            '결제하기',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
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
          ),
    );
  }
}
