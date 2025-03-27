import 'package:cafe_order_system/components/cafe_tile.dart';
import 'package:cafe_order_system/viewModel/cafe_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cafe_order_system/pages/detail_page/menu_detail_page.dart';

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
            expandedHeight: 70,
            floating: false,
            pinned: true,
            scrolledUnderElevation: 0,
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

                  // Navigate to the MenuDetailPage
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => const MenuDetailPage(cafeMenu: null),
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
