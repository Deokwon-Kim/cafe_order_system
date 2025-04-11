import 'dart:io';

import 'package:flutter/material.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isAndroid = Platform.isAndroid;

    const double expanedHeight = 200;
    final double baseHeight = isAndroid ? expanedHeight - 90 : expanedHeight;
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            automaticallyImplyLeading: false,
            expandedHeight: 70,
            floating: false,
            pinned: true,
            scrolledUnderElevation: 4.0,
            shadowColor: Color.fromARGB(91, 158, 158, 158),
            flexibleSpace: LayoutBuilder(
              builder: (context, constraints) {
                // 스크롤 상태에 따라 타이틀을 보이게 설정
                double percent =
                    (constraints.maxHeight - kToolbarHeight) /
                    (baseHeight - kToolbarHeight);
                bool showTitle = percent < 0.5;

                return Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Stack(
                    children: [
                      if (showTitle)
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Order',
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
            child: Transform.translate(
              offset: Offset(0, -10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, bottom: 20),
                    child: Text(
                      'Order',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'BMHANNA',
                      ),
                    ),
                  ),
                  Divider(height: 1),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, 'espresso');
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset(
                              'lib/images/espresso/iceAmericano.jpg',
                              height: 100,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 20,
                                left: 40.0,
                              ),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, 'espresso');
                                },
                                child: Text(
                                  '에스프레소',
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'BMHANNA',
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 40.0),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, 'espresso');
                                },
                                child: Transform.translate(
                                  offset: Offset(0, -25),
                                  child: Text(
                                    'Espresso',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'BMHANNA',
                                      color: Colors.grey[400],
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
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, 'coldbrew');
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset(
                              'lib/images/coldbrew/ColdBrew.jpg',
                              height: 100,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 20,
                                left: 40.0,
                              ),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, 'coldbrew');
                                },
                                child: Text(
                                  '콜드브루',
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'BMHANNA',
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 40.0),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, 'coldbrew');
                                },
                                child: Transform.translate(
                                  offset: Offset(0, -25),
                                  child: Text(
                                    'Cold Brew',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'BMHANNA',
                                      color: Colors.grey[400],
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
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, 'frappuchino');
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset(
                              'lib/images/frappuchino/Java_Chip.jpg',
                              height: 100,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 20,
                                left: 40.0,
                              ),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, 'frappuchino');
                                },
                                child: Text(
                                  '프라푸치노',
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'BMHANNA',
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 40.0),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, 'frappuchino');
                                },
                                child: Transform.translate(
                                  offset: Offset(0, -25),
                                  child: Text(
                                    'Frappuchino',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'BMHANNA',
                                      color: Colors.grey[400],
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
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, 'teabana');
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset(
                              'lib/images/tea/Malcha_Latte.jpg',
                              height: 100,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 20,
                                left: 40.0,
                              ),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, 'teabana');
                                },
                                child: Text(
                                  '티바나',
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'BMHANNA',
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 40.0),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, 'teabana');
                                },
                                child: Transform.translate(
                                  offset: Offset(0, -25),
                                  child: Text(
                                    'Teabana',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'BMHANNA',
                                      color: Colors.grey[400],
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
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, 'cake');
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset(
                              'lib/images/cake/Mugwor_RedBean_Roll_Cake.jpg',
                              height: 100,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 20,
                                left: 40.0,
                              ),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, 'cake');
                                },
                                child: Text(
                                  '케이크',
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'BMHANNA',
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 40.0),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, 'cake');
                                },
                                child: Transform.translate(
                                  offset: Offset(0, -25),
                                  child: Text(
                                    'Cake',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'BMHANNA',
                                      color: Colors.grey[400],
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
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, 'icecream');
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset(
                              'lib/images/icecream/Vanilla Bean Gelato.jpg',
                              height: 100,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 20,
                                left: 40.0,
                              ),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, 'icecream');
                                },
                                child: Text(
                                  '아이스크림',
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'BMHANNA',
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 40.0),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, 'icecream');
                                },
                                child: Transform.translate(
                                  offset: Offset(0, -25),
                                  child: Text(
                                    'IceCream',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'BMHANNA',
                                      color: Colors.grey[400],
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
