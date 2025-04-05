import 'package:HERMESCAFE/Tab/bottom_tab_bar.dart';
import 'package:HERMESCAFE/provider/cart_provider.dart';
import 'package:HERMESCAFE/provider/menu_detail_provider.dart';
import 'package:HERMESCAFE/provider/ticket_provider.dart';
import 'package:HERMESCAFE/tosspayments/payments_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  // Make the ticket parameter optional - it's not directly used in the page
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    // final menuDetail = Provider.of<MenuDetailProvider>(context);
    final items = cart.cartItems.values.toList();

    return Consumer3<CartProvider, MenuDetailProvider, TicketProvider>(
      builder:
          (context, cart, menuDetail, ticketProvider, child) => Scaffold(
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
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'BMHANNA',
                ),
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
                                fontFamily: 'BMHANNA',
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
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: const Color.fromARGB(
                                    70,
                                    158,
                                    158,
                                    158,
                                  ),
                                  blurRadius: 4,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            margin: EdgeInsets.only(
                              left: 10,
                              top: 20,
                              right: 10,
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 10,
                            ),
                            child: Row(
                              children: [
                                // Product image
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.asset(
                                    item.imagePath,
                                    height: 70,
                                    width: 70,
                                    fit: BoxFit.cover,
                                  ),
                                ),

                                // Product info
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item.name,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            fontFamily: 'BMJUA',
                                          ),
                                          textAlign: TextAlign.start,
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          item.engname,
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 13,
                                            fontFamily: 'BMHANNA',
                                          ),
                                          textAlign: TextAlign.start,
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          '${item.price}원',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'BMHANNA',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                // Quantity controls
                                Container(
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                      52,
                                      158,
                                      158,
                                      158,
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 4,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      InkWell(
                                        onTap:
                                            () =>
                                                cart.decrementQuantity(item.id),
                                        child: Container(
                                          padding: EdgeInsets.all(4),
                                          child: Icon(Icons.remove, size: 20),
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        '${item.quantity}',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      InkWell(
                                        onTap:
                                            () =>
                                                cart.incrementQuantity(item.id),
                                        child: Container(
                                          padding: EdgeInsets.all(4),
                                          child: Icon(Icons.add, size: 20),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                // Total price display
                if (cart.cartItems.isNotEmpty)
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    decoration: BoxDecoration(
                      color: Colors.grey.withAlpha(10),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.withAlpha(20)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '총 금액',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                            fontFamily: 'BMHANNA',
                          ),
                        ),
                        Text(
                          cart.totalAmount,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'BMHANNA',
                            color: Color(0xfff37210),
                          ),
                        ),
                      ],
                    ),
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 50.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PaymentsPage(),
                            ),
                          );
                        },
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
                              fontWeight: FontWeight.w500,
                              fontFamily: 'BMHANNA',
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
