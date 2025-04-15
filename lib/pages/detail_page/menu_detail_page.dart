import 'package:HERMESCAFE/devicetype/device_type_helper.dart';
import 'package:HERMESCAFE/model/cafe.dart';
import 'package:HERMESCAFE/pages/cart/cart_page.dart';
import 'package:HERMESCAFE/provider/cart_provider.dart';
import 'package:HERMESCAFE/provider/menu_detail_provider.dart';
import 'package:HERMESCAFE/utils/responsive_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
        case 'hotonly':
          menuDetailProvider.toggleOption(false);
          break;
        case 'iceonly':
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
          backgroundColor: const Color.fromARGB(255, 247, 247, 247),
          body: Stack(
            children: [
              Positioned.fill(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Image.asset(
                            currentMenu!.imagePath,
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            top: 50,
                            left: 10,
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
                                  icon: Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: Icon(
                                      Icons.arrow_back_ios,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 430, left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  currentMenu.name,
                                  style: GoogleFonts.notoSansKr(
                                    fontSize:
                                        ResponsiveStyles.detailPageNameFontSize(
                                          deviceType,
                                        ),
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  currentMenu.engname,
                                  style: GoogleFonts.roboto(
                                    color: Colors.grey,
                                    fontSize:
                                        ResponsiveStyles.detailPageEngNameFontSize(
                                          deviceType,
                                        ),
                                  ),
                                ),
                                Text(
                                  currentMenu.discription,
                                  style: GoogleFonts.notoSansKr(
                                    color: Colors.grey.shade600,
                                    fontSize:
                                        ResponsiveStyles.detailPageenDescFontSize(
                                          deviceType,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 280.0),
                                  child: Transform.translate(
                                    offset: Offset(0, -30),
                                    child: Text(
                                      '${currentMenu.price}원',
                                      style: GoogleFonts.notoSansKr(
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
                              ],
                            ),
                          ),
                          // HOT/ICE 선택 버튼
                          Padding(
                            padding: EdgeInsets.only(),
                            child: Builder(
                              builder: (context) {
                                // temperatureOption 값에 따라 버튼 표시
                                switch (widget.cafeMenu.temperatureOption) {
                                  case 'hotonly':
                                    return Padding(
                                      padding: EdgeInsets.only(),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal:
                                                  ResponsiveStyles.detailPageTempContainerSize(
                                                    deviceType,
                                                  ),
                                              vertical: 15,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
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
                                        top:
                                            ResponsiveStyles.detailPageTempLocation(
                                              deviceType,
                                            ),
                                        right:
                                            ResponsiveStyles.detailPageTempHotandIceContainerLocation(
                                              deviceType,
                                            ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal:
                                                  ResponsiveStyles.detailPageTempHotandIceContainerSize(
                                                    deviceType,
                                                  ),
                                              vertical: 15,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.white,

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
                                              'ICE ONLY',
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
                                        top:
                                            ResponsiveStyles.detailPageTempLocation(
                                              deviceType,
                                            ),
                                        right:
                                            ResponsiveStyles.detailPageTempLeftLocation(
                                              deviceType,
                                            ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          // Hot버튼
                                          GestureDetector(
                                            onTap:
                                                () => menuDetailProvider
                                                    .toggleOption(false),
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                horizontal:
                                                    ResponsiveStyles.detailPageTempContainerSize(
                                                      deviceType,
                                                    ),
                                                vertical: 15,
                                              ),
                                              decoration: BoxDecoration(
                                                color:
                                                    menuDetailProvider.isIce
                                                        ? Colors.white
                                                        : Color(0xfff37210),

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
                                                          : Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                  fontFamily: 'BMHANNA',
                                                ),
                                              ),
                                            ),
                                          ),

                                          // Ice버튼
                                          GestureDetector(
                                            onTap:
                                                () => menuDetailProvider
                                                    .toggleOption(true),
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                horizontal:
                                                    ResponsiveStyles.detailPageTempContainerSize(
                                                      deviceType,
                                                    ),
                                                vertical: 15,
                                              ),
                                              decoration: BoxDecoration(
                                                color:
                                                    menuDetailProvider.isIce
                                                        ? Color(0xfff37210)
                                                        : Colors.white,
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
                                                'ICE',
                                                style: TextStyle(
                                                  color:
                                                      menuDetailProvider.isIce
                                                          ? Colors.white
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
                              top: ResponsiveStyles.detailPageQuantityLocation(
                                deviceType,
                              ),
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
                                    onPressed:
                                        () =>
                                            menuDetailProvider.removeQuantity(),
                                    icon: Icon(
                                      Icons.remove,
                                      color: Colors.black,
                                      size:
                                          ResponsiveStyles.detailPageQuantityIconSize(
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
                                    color: Colors.grey.withAlpha(20),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: IconButton(
                                    onPressed:
                                        () => menuDetailProvider.addQuantity(),
                                    icon: Icon(
                                      Icons.add,
                                      color: Colors.black,
                                      size:
                                          ResponsiveStyles.detailPageQuantityIconSize(
                                            deviceType,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 22,
                  ),
                  color: Colors.white,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.favorite_border),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.shopping_bag_outlined),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            addToCart();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 58,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              '주문하기',
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
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
