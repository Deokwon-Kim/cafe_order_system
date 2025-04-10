import 'package:HERMESCAFE/devicetype/device_type_helper.dart';
import 'package:HERMESCAFE/model/cafe.dart';
import 'package:HERMESCAFE/provider/cart_provider.dart';
import 'package:HERMESCAFE/provider/menu_detail_provider.dart';
import 'package:HERMESCAFE/utils/responsive_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TicketDetailPage extends StatefulWidget {
  final Cafe cafeMenu;
  const TicketDetailPage({super.key, required this.cafeMenu});

  @override
  State<TicketDetailPage> createState() => _TicketDetailPageState();
}

class _TicketDetailPageState extends State<TicketDetailPage> {
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
              title: Padding(
                padding: const EdgeInsets.only(top: 23.0),
                child: Text(
                  '장바구니 추가완료',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'BMHANNA',
                  ),
                  textAlign: TextAlign.center,
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
                      fontFamily: 'BMHANNA',
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
    final deviceType = DeviceTypeHelper.getDeviceType(context);

    return Consumer2<MenuDetailProvider, CartProvider>(
      builder: (context, menuDetailProvider, cartProvider, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                child: Image.asset(
                  widget.cafeMenu.imagePath,
                  height: ResponsiveStyles.gitcardPageImageHeight(deviceType),
                ),
              ),
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
                    padding: const EdgeInsets.only(top: 20.0, left: 20),
                    child: Text(
                      widget.cafeMenu.name,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'BMJUA',
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 80.0, left: 20),
                    child: Text(
                      widget.cafeMenu.engname,
                      style: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'BMHANNA',
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 150.0,
                      left: 20,
                      right: 20,
                    ),
                    child: Text(
                      widget.cafeMenu.discription,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Color(0xffa2a2a2),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'BMHANNA',
                      ),
                    ),
                  ),
                ],
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 230.0, left: 20),
                    child: Text(
                      '${widget.cafeMenu.price}원',
                      style: TextStyle(
                        color: Color(0xfff37210),
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'BMHANNA',
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: ResponsiveStyles.detailPageQuantityLocation(deviceType),
                  right: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.withAlpha(30),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: IconButton(
                        onPressed: () => menuDetailProvider.removeQuantity(),
                        icon: Icon(
                          Icons.remove,
                          color: Colors.black,
                          size: ResponsiveStyles.detailPageQuantityIconSize(
                            deviceType,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 40,
                      child: Center(
                        child: Text(
                          menuDetailProvider.quantity.toString(),
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontFamily: 'BMHANNA',
                          ),
                        ),
                      ),
                    ),

                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.withAlpha(30),
                        borderRadius: BorderRadius.circular(30),
                      ),

                      child: IconButton(
                        onPressed: () => menuDetailProvider.addQuantity(),
                        icon: Icon(
                          Icons.add,
                          color: Colors.black,
                          size: ResponsiveStyles.detailPageQuantityIconSize(
                            deviceType,
                          ),
                        ),
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
                      padding: EdgeInsets.only(
                        top: ResponsiveStyles.detailPagePriceButtonLocation(
                          deviceType,
                        ),
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
        );
      },
    );
  }
}
