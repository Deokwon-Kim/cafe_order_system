// ignore_for_file: unused_field

import 'package:HERMESCAFE/components/suggest_tile.dart';
import 'package:HERMESCAFE/devicetype/device_type_helper.dart';
import 'package:HERMESCAFE/model/cafe.dart';
import 'package:HERMESCAFE/pages/detail_page/menu_detail_page.dart';
import 'package:HERMESCAFE/provider/cafe_provider.dart';
import 'package:HERMESCAFE/provider/cart_provider.dart';
import 'package:HERMESCAFE/provider/suggest_menu_provider.dart';
import 'package:HERMESCAFE/provider/user_provider.dart';
import 'package:HERMESCAFE/utils/responsive_styles.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _current = 0;

  final CarouselSliderController _controller = CarouselSliderController();
  List<Widget> imageList = [
    Image.asset('lib/images/event1.png', fit: BoxFit.cover),
    Image.asset('lib/images/event2.png', fit: BoxFit.cover),
    Image.asset('lib/images/event3.png', fit: BoxFit.cover),
  ];

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    final suggestMenu = Provider.of<SuggestMenuProvider>(
      context,
    ).getSuggestMenu('suggest');

    final deviceType = DeviceTypeHelper.getDeviceType(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 149),
              child: SizedBox(height: 300, child: sliderWidget()),
            ),
            Transform.translate(
              offset: Offset(10, -110),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Consumer<UserProvider>(
                    builder: (context, userProvider, child) {
                      return Transform.translate(
                        offset: Offset(0, -5),
                        child: Text.rich(
                          TextSpan(
                            text: '${user?.displayName}',
                            style: GoogleFonts.roboto(
                              color: Color.fromARGB(255, 243, 80, 16),
                              fontSize: ResponsiveStyles.mainTitleFontSize(
                                deviceType,
                              ),
                            ),

                            children: <TextSpan>[
                              TextSpan(
                                text: ' 고객님',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'HERMES',
                                  fontSize: ResponsiveStyles.mainTitleFontSize(
                                    deviceType,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  Transform.translate(
                    offset: Offset(-10, 0),
                    child: Row(
                      children: [
                        Container(
                          width: 135,
                          height: 110,
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                color: const Color.fromARGB(255, 209, 207, 207),
                              ),
                              right: BorderSide(
                                color: const Color.fromARGB(255, 209, 207, 207),
                              ),
                              bottom: BorderSide(
                                color: const Color.fromARGB(255, 209, 207, 207),
                              ),
                            ),
                          ),
                          child: Column(
                            children: [
                              Consumer<CartProvider>(
                                builder: (context, viewModel, child) {
                                  return badges.Badge(
                                    position: badges.BadgePosition.topEnd(
                                      top: 0,
                                      end: 0,
                                    ),
                                    badgeAnimation:
                                        const badges.BadgeAnimation.slide(
                                          animationDuration: Duration(
                                            milliseconds: 300,
                                          ),
                                        ),
                                    showBadge: viewModel.cartItems.isNotEmpty,
                                    badgeStyle: const badges.BadgeStyle(
                                      badgeColor: Color(0xfff37210),
                                      padding: EdgeInsets.all(5),
                                    ),
                                    badgeContent: Text(
                                      '${viewModel.cartItems.length}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                    ),
                                    child: IconButton(
                                      onPressed: () {
                                        Navigator.pushNamed(context, 'cart');
                                      },
                                      icon: Transform.translate(
                                        offset: Offset(0, 15),
                                        child: const Icon(
                                          Icons.shopping_bag_outlined,
                                          size: 45,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                              Transform.translate(
                                offset: Offset(0, 10),
                                child: Text(
                                  '장바구니',
                                  style: GoogleFonts.notoSansKr(
                                    textStyle: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 139,
                          height: 110,
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                color: const Color.fromARGB(255, 209, 207, 207),
                              ),
                              right: BorderSide(
                                color: const Color.fromARGB(255, 209, 207, 207),
                              ),
                              bottom: BorderSide(
                                color: const Color.fromARGB(255, 209, 207, 207),
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: Column(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.check_circle_outline_sharp,
                                    size: 40,
                                  ),
                                ),
                                Text(
                                  '스탬프',
                                  style: GoogleFonts.roboto(
                                    color: Colors.grey.shade600,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 128,
                          height: 110,
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                color: const Color.fromARGB(255, 209, 207, 207),
                              ),
                              bottom: BorderSide(
                                color: const Color.fromARGB(255, 209, 207, 207),
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Column(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.payment_outlined, size: 45),
                                ),
                                Text(
                                  '금액권 구매',
                                  style: GoogleFonts.roboto(
                                    color: Colors.grey.shade600,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: ResponsiveStyles.suggestTileHeight(deviceType),
                    decoration: BoxDecoration(color: Colors.white),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 5, left: 10),
                              child: Text(
                                '추천메뉴',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                            Row(
                              children: [
                                Transform.translate(
                                  offset: Offset(20, 0),
                                  child: Text(
                                    '전체 메뉴',
                                    style: GoogleFonts.notoSansKr(
                                      textStyle: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                                Transform.translate(
                                  offset: Offset(5, 0),
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.grey,
                                      size: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: suggestMenu.length,
                            itemBuilder:
                                (context, index) => SuggestTile(
                                  cafe: suggestMenu[index],
                                  onTap: () {
                                    Provider.of<CafeViewmodel>(
                                      context,
                                      listen: false,
                                    ).selectCafe(suggestMenu[index]);

                                    final suggestMenuProvider =
                                        Provider.of<SuggestMenuProvider>(
                                          context,
                                          listen: false,
                                        );

                                    final iceMenus = suggestMenuProvider
                                        .getIceMenu('icedsuggest');
                                    Cafe? iceMenu;

                                    final String hotMenuId =
                                        suggestMenu[index].id;
                                    final RegExp regExp = RegExp(r'(\d+)$');
                                    final Match? match = regExp.firstMatch(
                                      hotMenuId,
                                    );

                                    if (match != null) {
                                      final String menuNumber = match.group(1)!;

                                      // 매칭되는 Ice 메뉴 ID 찾기
                                      try {
                                        iceMenu = iceMenus.firstWhere(
                                          (cafe) =>
                                              cafe.id ==
                                              'icedsuggest$menuNumber',
                                        );
                                      } catch (e) {
                                        iceMenu = null;
                                      }
                                    }

                                    // Navigate to the MenuDetailPage
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (context) => MenuDetailPage(
                                              cafeMenu: suggestMenu[index],
                                              iceMenu:
                                                  iceMenu, // Ice메뉴 전달(없으면 null),
                                            ),
                                      ),
                                    );
                                  },
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget sliderWidget() {
    return CarouselSlider(
      carouselController: _controller,
      items:
          imageList.map((item) {
            return Builder(
              builder: (context) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: item,
                );
              },
            );
          }).toList(),
      options: CarouselOptions(
        height: 300,
        viewportFraction: 1.0,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        onPageChanged: (index, reason) {
          setState(() {
            _current = index;
          });
        },
      ),
    );
  }

  // Widget sliderIndicator() {
  //   return Align(
  //     alignment: Alignment.bottomCenter,
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children:
  //           imageList.asMap().entries.map((entry) {
  //             return GestureDetector(
  //               onTap: () => _controller.animateToPage(entry.key),
  //               child: Container(
  //                 width: 12.0,
  //                 height: 12.0,
  //                 margin: const EdgeInsets.symmetric(horizontal: 4.0),
  //                 decoration: BoxDecoration(
  //                   shape: BoxShape.circle,
  //                   color: (Theme.of(context).brightness == Brightness.dark
  //                           ? Colors.white
  //                           : Colors.black)
  //                       .withOpacity(_current == entry.key ? 0.9 : 0.4),
  //                 ),
  //               ),
  //             );
  //           }).toList(),
  //     ),
  //   );
  // }
}
