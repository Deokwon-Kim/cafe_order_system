import 'package:HERMESCAFE/devicetype/device_type_helper.dart';
import 'package:HERMESCAFE/model/cafe.dart';
import 'package:HERMESCAFE/provider/cart_provider.dart';
import 'package:HERMESCAFE/provider/menu_detail_provider.dart';
import 'package:HERMESCAFE/utils/responsive_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
                          fontFamily: 'BMHANNA',
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
              Padding(
                padding: EdgeInsets.only(
                  top: ResponsiveStyles.detailPageFontNameLocation(deviceType),
                  left: 10,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.cafeMenu.name,
                      style: GoogleFonts.notoSansKr(
                        textStyle: TextStyle(
                          fontSize: ResponsiveStyles.detailPageNameFontSize(
                            deviceType,
                          ),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      widget.cafeMenu.engname,
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                        fontSize: ResponsiveStyles.detailPageEngNameFontSize(
                          deviceType,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      widget.cafeMenu.discription,
                      textAlign: TextAlign.start,
                      style: GoogleFonts.notoSansKr(
                        textStyle: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: ResponsiveStyles.detailPageenDescFontSize(
                            deviceType,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 295.0),
                      child: Transform.translate(
                        offset: Offset(0, -30),
                        child: Text(
                          '${widget.cafeMenu.price}원',
                          style: GoogleFonts.notoSansKr(
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontSize:
                                  ResponsiveStyles.detailPagePriceFontSize(
                                    deviceType,
                                  ),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.only(
                  top: ResponsiveStyles.detailPageQuantityLocation(deviceType),
                  right: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () => menuDetailProvider.removeQuantity(),
                      icon: Icon(
                        Icons.remove,
                        color: Colors.black,
                        size: ResponsiveStyles.detailPageQuantityIconSize(
                          deviceType,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 40,
                      child: Center(
                        child: Text(
                          menuDetailProvider.quantity.toString(),
                          style: TextStyle(
                            fontSize:
                                ResponsiveStyles.detailPageQuantityfontSize(
                                  deviceType,
                                ),
                            color: Colors.black,
                            fontFamily: 'BMHANNA',
                          ),
                        ),
                      ),
                    ),

                    IconButton(
                      onPressed: () => menuDetailProvider.addQuantity(),
                      icon: Icon(
                        Icons.add,
                        color: Colors.black,
                        size: ResponsiveStyles.detailPageQuantityIconSize(
                          deviceType,
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
                        height: ResponsiveStyles.detailPageButtonHeight(
                          deviceType,
                        ),
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
