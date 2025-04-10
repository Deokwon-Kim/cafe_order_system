import 'package:HERMESCAFE/devicetype/device_type_helper.dart';
import 'package:HERMESCAFE/model/cafe.dart';
import 'package:HERMESCAFE/pages/cart/cart_page.dart';
import 'package:HERMESCAFE/provider/cart_provider.dart';
import 'package:HERMESCAFE/provider/menu_detail_provider.dart';
import 'package:HERMESCAFE/utils/responsive_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuDetailPage extends StatefulWidget {
  final Cafe cafeMenu;
  final Cafe? iceMenu;
  const MenuDetailPage({super.key, required this.cafeMenu, this.iceMenu});

  @override
  State<MenuDetailPage> createState() => _MenuDetailPageState();
}

class _MenuDetailPageState extends State<MenuDetailPage> {
  @override
  void initState() {
    super.initState();
    // 페이지가 생성될 때 수량 초기화 및 온도 옵션 설정
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final menuDetailProvider = context.read<MenuDetailProvider>();
      menuDetailProvider.resetQuantity();

      // temperatureOption 값에 따라 isIce 초기화
      switch (widget.cafeMenu.temperatureOption) {
        case "hotonly":
          menuDetailProvider.toggleOption(false);
          break;
        case "iceonly":
          menuDetailProvider.toggleOption(true);
          break;
        default:
          menuDetailProvider.toggleOption(false);
          break;
      }
    });
  }

  void addToCart() {
    final menuDetailProvider = context.read<MenuDetailProvider>();
    if (menuDetailProvider.quantity > 0) {
      final cartProvider = context.read<CartProvider>();

      // 현재 선택된 메뉴 결정
      // temperatureOption 값과 isIce 값에 따라 메뉴 결정
      Cafe? currentMenu;

      switch (widget.cafeMenu.temperatureOption) {
        case 'hotonly':
          currentMenu = widget.cafeMenu;
          break;
        case 'iceonly':
          currentMenu = widget.iceMenu ?? widget.cafeMenu;
          break;
        default:
          currentMenu =
              menuDetailProvider.isIce ? widget.iceMenu : widget.cafeMenu;
          break;
      }
      // Set the quantity from MenuDetailProvider to the selected menu item
      currentMenu?.quantity = menuDetailProvider.quantity;
      cartProvider.addToCart(currentMenu!);

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
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => CartPage()),
                    );
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
    final deviceType = DeviceTypeHelper.getDeviceType(context);
    return Consumer2<MenuDetailProvider, CartProvider>(
      builder: (context, menuDetailProvider, cartProvider, child) {
        // 현재 표시할 메뉴 결정 (Hot 또는 Ice)
        Cafe? currentMenu;

        switch (widget.cafeMenu.temperatureOption) {
          case 'hotonly':
            currentMenu = widget.cafeMenu;
            break;
          case 'iceonly':
            currentMenu = widget.iceMenu ?? widget.cafeMenu;
            break;
          default:
            currentMenu =
                menuDetailProvider.isIce ? widget.iceMenu : widget.cafeMenu;
            break;
        }

        return Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              Image.asset(currentMenu!.imagePath, fit: BoxFit.cover),
              Positioned(
                top: 50,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey.withAlpha(20),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 20,
                      top: ResponsiveStyles.detailPageFontNameLocation(
                        deviceType,
                      ),
                    ),
                    child: Text(
                      currentMenu.name,
                      style: TextStyle(
                        fontSize: ResponsiveStyles.detailPageNameFontSize(
                          deviceType,
                        ),
                        fontWeight: FontWeight.bold,
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
                    padding: EdgeInsets.only(
                      left: 20,
                      top: ResponsiveStyles.detailPageFontEngNameLocation(
                        deviceType,
                      ),
                    ),
                    child: Text(
                      currentMenu.engname,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: ResponsiveStyles.detailPageEngNameFontSize(
                          deviceType,
                        ),
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
                    padding: EdgeInsets.only(
                      top: ResponsiveStyles.detailPageFontDescLocation(
                        deviceType,
                      ),
                      left: 20,
                    ),
                    child: Text(
                      currentMenu.discription,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Color(0xffa2a2a2),
                        fontSize: ResponsiveStyles.detailPageenDescFontSize(
                          deviceType,
                        ),
                        fontWeight: FontWeight.w600,
                        // fontFamily: 'BMJUA',
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
                    padding: EdgeInsets.only(
                      top: ResponsiveStyles.detailPageFontPriceLocation(
                        deviceType,
                      ),
                      left: 20,
                    ),
                    child: Text(
                      '${currentMenu.price}원',
                      style: TextStyle(
                        color: Color(0xfff37210),
                        fontSize: ResponsiveStyles.detailPagePriceFontSize(
                          deviceType,
                        ),
                        fontWeight: FontWeight.w600,
                        // fontFamily: 'BMJUA',
                        fontFamily: 'BMHANNA',
                      ),
                    ),
                  ),
                ],
              ),
              // HOT/ICE 버튼 선택 UI
              Padding(
                padding: EdgeInsets.only(),
                child: Builder(
                  builder: (context) {
                    // temperatureOption 값에 따라 버튼 표시
                    switch (widget.cafeMenu.temperatureOption) {
                      case 'hotonly':
                        return Padding(
                          padding: EdgeInsets.only(
                            top: ResponsiveStyles.detailPageTempLocation(
                              deviceType,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 130,
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color.fromARGB(
                                        147,
                                        158,
                                        158,
                                        158,
                                      ),
                                      blurRadius: 4,
                                      offset: Offset(1, 2),
                                    ),
                                  ],
                                ),
                                child: Text(
                                  'HOT ONLY',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    fontFamily: 'BMHANNA',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );

                      case 'iceonly':
                        return Padding(
                          padding: EdgeInsets.only(
                            top: ResponsiveStyles.detailPageTempLocation(
                              deviceType,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 130,
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color.fromARGB(
                                        147,
                                        158,
                                        158,
                                        158,
                                      ),
                                      blurRadius: 4,
                                      offset: Offset(1, 2),
                                    ),
                                  ],
                                ),
                                child: Text(
                                  'ICED ONLY',
                                  style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    fontFamily: 'BMHANNA',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      default:
                        return Padding(
                          padding: EdgeInsets.only(
                            top: ResponsiveStyles.detailPageTempLocation(
                              deviceType,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Hot버튼
                              GestureDetector(
                                onTap:
                                    () =>
                                        menuDetailProvider.toggleOption(false),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal:
                                        ResponsiveStyles.detailPageTempContainerSize(
                                          deviceType,
                                        ),
                                    vertical: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color.fromARGB(
                                          147,
                                          158,
                                          158,
                                          158,
                                        ),
                                        blurRadius: 4,
                                        offset: Offset(1, 2),
                                      ),
                                    ],
                                  ),
                                  child: Text(
                                    'HOT',
                                    style: TextStyle(
                                      color:
                                          menuDetailProvider.isIce
                                              ? Colors.grey
                                              : Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      fontFamily: 'BMHANNA',
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 5),
                              // Ice버튼
                              GestureDetector(
                                onTap:
                                    () => menuDetailProvider.toggleOption(true),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal:
                                        ResponsiveStyles.detailPageTempContainerSize(
                                          deviceType,
                                        ),
                                    vertical: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color.fromARGB(
                                          147,
                                          158,
                                          158,
                                          158,
                                        ),
                                        blurRadius: 4,
                                        offset: Offset(1, 2),
                                      ),
                                    ],
                                  ),
                                  child: Text(
                                    'ICED',
                                    style: TextStyle(
                                      color:
                                          menuDetailProvider.isIce
                                              ? Colors.blueAccent
                                              : Colors.grey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      fontFamily: 'BMHANNA',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                    }
                  },
                ),
              ),
              // 수량선택 버튼
              Padding(
                padding: EdgeInsets.only(
                  top: ResponsiveStyles.detailPageQuantityLocation(deviceType),
                  right: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.grey.withAlpha(20),
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

                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),

                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.withAlpha(20),
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
                        left: 30,
                        right: 30,
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
