import 'dart:io';

import 'package:HERMESCAFE/components/cafe_tile.dart';
import 'package:HERMESCAFE/pages/detail_page/desert_detail_page.dart';
import 'package:HERMESCAFE/provider/desert_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IceCreamDetailPage extends StatelessWidget {
  const IceCreamDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isAndroid = Platform.isAndroid;

    const double expanedHeight = 200;
    final double baseHeight = isAndroid ? expanedHeight - 90 : expanedHeight;
    final desertViewModel = Provider.of<DesertViewmodel>(
      context,
    ).getDesertMenu('icecream');
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            expandedHeight: 70,
            floating: false,
            pinned: true,
            scrolledUnderElevation: 4.0,
            shadowColor: Color.fromARGB(89, 158, 158, 158),
            flexibleSpace: LayoutBuilder(
              builder: (context, constraints) {
                // 스크롤 상태에 따라 타이틀을 보이게 설정
                double percent =
                    (constraints.maxHeight - kToolbarHeight) /
                    (baseHeight - kToolbarHeight);
                bool showTitle = percent < 0.5; // 절반 이상 스크롤 되면 보이게

                return Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Stack(
                    children: [
                      if (showTitle)
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            '아이스크림',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              fontFamily: 'BMJUA',
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                '아이스크림',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'BMJUA',
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return CafeTile(
                cafe: desertViewModel[index],
                onTap: () {
                  Provider.of<DesertViewmodel>(
                    context,
                    listen: false,
                  ).selectCafe(desertViewModel[index]);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => DesertDetailPage(
                            cafeMenu: desertViewModel[index],
                          ),
                    ),
                  );
                },
              );
            }, childCount: desertViewModel.length),
          ),
        ],
      ),
    );
  }
}
