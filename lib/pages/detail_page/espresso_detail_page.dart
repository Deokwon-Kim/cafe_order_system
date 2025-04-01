import 'package:HERMESCAFE/components/cafe_tile.dart';
import 'package:HERMESCAFE/model/cafe.dart';
import 'package:HERMESCAFE/pages/detail_page/menu_detail_page.dart';
import 'package:HERMESCAFE/provider/cafe_provider.dart';
import 'package:HERMESCAFE/provider/iced_cafe_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EspressoDetailPage extends StatelessWidget {
  const EspressoDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cafeMenu = Provider.of<CafeViewmodel>(context).getMenu('espresso');
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            expandedHeight: 70,
            floating: false,
            pinned: true,
            scrolledUnderElevation: 4.0,
            shadowColor: const Color.fromARGB(91, 158, 158, 158),
            flexibleSpace: LayoutBuilder(
              builder: (context, constraints) {
                // 스크롤 상태에 따라 타이틀을 보이게 설정
                double percent =
                    (constraints.maxHeight - kToolbarHeight) /
                    (200 - kToolbarHeight);
                bool showTitle = percent < 0.5; // 절반 이상 스크롤되면 보이게

                return FlexibleSpaceBar(
                  title:
                      showTitle
                          ? Text(
                            '에스프레소',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          )
                          : null, // 초기에는 타이틀 숨김
                );
              },
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                '에스프레소',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return CafeTile(
                cafe: cafeMenu[index],
                onTap: () {
                  // Set the selected cafe in the provider
                  Provider.of<CafeViewmodel>(
                    context,
                    listen: false,
                  ).selectCafe(cafeMenu[index]);

                  final icedCafeViewModel = Provider.of<IcedCafeViewmodel>(
                    context,
                    listen: false,
                  );

                  final iceMenus = icedCafeViewModel.getIceMenu('icedespresso');
                  Cafe? iceMenu;

                  final String hotMenuId = cafeMenu[index].id;
                  final RegExp regExp = RegExp(r'(\d+)$');
                  final Match? match = regExp.firstMatch(hotMenuId);

                  if (match != null) {
                    final String menuNumber = match.group(1)!;

                    // 매칭되는 Ice 메뉴 ID 찾기
                    try {
                      iceMenu = iceMenus.firstWhere(
                        (cafe) => cafe.id == 'icedespresso$menuNumber',
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
                            cafeMenu: cafeMenu[index],
                            iceMenu: iceMenu, // Ice메뉴 전달(없으면 null),
                          ),
                    ),
                  );
                },
              );
            }, childCount: cafeMenu.length),
          ),
        ],
      ),
    );
  }
}
