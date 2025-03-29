import 'package:HERMESCAFE/Tab/bottom_tab_bar.dart';
import 'package:HERMESCAFE/provider/cart_provider.dart';
import 'package:HERMESCAFE/provider/menu_detail_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    // final menuDetail = Provider.of<MenuDetailProvider>(context);
    final items = cart.cartItems.values.toList();

    return Consumer2<CartProvider, MenuDetailProvider>(
      builder:
          (context, cart, menuDetail, child) => Scaffold(
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
                cart.cartItems.isEmpty
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
                        itemCount: cart.cartItems.length,
                        itemBuilder: (context, index) {
                          final item = items[index];

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
                                child: Image.asset(item.imagePath, height: 300),
                              ),
                              title: Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.name,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                    Text(
                                      item.engname,
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 13,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                    Text(
                                      '${item.price}원',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),

                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    onPressed:
                                        () => cart.decrementQuantity(item.id),
                                    icon: Icon(Icons.remove),
                                  ),
                                  Text(
                                    '${item.quantity}',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  IconButton(
                                    onPressed:
                                        () => cart.incrementQuantity(item.id),
                                    icon: Icon(Icons.add),
                                  ),
                                ],
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
                                cart.cartItems.isEmpty
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
