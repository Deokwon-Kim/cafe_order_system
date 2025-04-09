import 'package:HERMESCAFE/components/suggest_tile.dart';
import 'package:HERMESCAFE/devicetype/device_type_helper.dart';
import 'package:HERMESCAFE/model/cafe.dart';
import 'package:HERMESCAFE/pages/detail_page/menu_detail_page.dart';
import 'package:HERMESCAFE/provider/cafe_provider.dart';
import 'package:HERMESCAFE/provider/cart_provider.dart';
import 'package:HERMESCAFE/provider/suggest_menu_provider.dart';
import 'package:HERMESCAFE/provider/user_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    final suggestMenu = Provider.of<SuggestMenuProvider>(
      context,
    ).getSuggestMenu('suggest');
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final deviceType = DeviceTypeHelper.getDeviceType(context);

    double cardHeight;
    switch (deviceType) {
      case DeviceType.small:
        cardHeight = 106;
        break;
      case DeviceType.medium:
        cardHeight = 120;
        break;
      case DeviceType.large:
        cardHeight = 160;
        break;
    }

    double card2Height; 
    switch (deviceType) {
      case DeviceType
    }
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 236, 236),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 237, 236, 236),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Consumer<CartProvider>(
              builder: (context, viewModel, child) {
                return badges.Badge(
                  position: badges.BadgePosition.topEnd(top: 0, end: 0),
                  badgeAnimation: const badges.BadgeAnimation.slide(
                    animationDuration: Duration(milliseconds: 300),
                  ),
                  showBadge: viewModel.cartItems.isNotEmpty,
                  badgeStyle: const badges.BadgeStyle(
                    badgeColor: Color(0xfff37210),
                    padding: EdgeInsets.all(5),
                  ),
                  badgeContent: Text(
                    '${viewModel.cartItems.length}',
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'cart');
                    },
                    icon: const Icon(Icons.shopping_cart_outlined),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Consumer<UserProvider>(
                  builder: (context, userProvider, child) {
                    return Text.rich(
                      TextSpan(
                        text: '${user?.displayName} 님 \n환영합니다',
                        style: TextStyle(fontSize: 20),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'HERMES COFFEE',
                            style: TextStyle(
                              color: Color(0xfff37210),
                              fontFamily: 'HERMES',
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: ' 입니다.',
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: Container(
              width: double.infinity,
              height: cardHeight,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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

                              final iceMenus = suggestMenuProvider.getIceMenu(
                                'icedsuggest',
                              );
                              Cafe? iceMenu;

                              final String hotMenuId = suggestMenu[index].id;
                              final RegExp regExp = RegExp(r'(\d+)$');
                              final Match? match = regExp.firstMatch(hotMenuId);

                              if (match != null) {
                                final String menuNumber = match.group(1)!;

                                // 매칭되는 Ice 메뉴 ID 찾기
                                try {
                                  iceMenu = iceMenus.firstWhere(
                                    (cafe) =>
                                        cafe.id == 'icedsuggest$menuNumber',
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
                                        iceMenu: iceMenu, // Ice메뉴 전달(없으면 null),
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
          ),
          SizedBox(height: 10),
          Container(
            width: screenWidth * 0.9,
            height: screenHeight * 0.40,
            color: Color(0xfff37210),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('lib/images/coffee-cup2.png'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '사용가능 카드 없음',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
