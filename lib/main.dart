import 'package:HERMESCAFE/Tab/bottom_tab_bar.dart';
import 'package:HERMESCAFE/pages/cart_page.dart';
import 'package:HERMESCAFE/pages/detail_page/coldbrew_detail_page.dart';
import 'package:HERMESCAFE/pages/detail_page/espresso_detail_page.dart';
import 'package:HERMESCAFE/pages/detail_page/frappu_detail_page.dart';
import 'package:HERMESCAFE/pages/detail_page/teabana_detail_page.dart';
import 'package:HERMESCAFE/provider/cart_provider.dart';
import 'package:HERMESCAFE/provider/menu_detail_provider.dart';
import 'package:HERMESCAFE/viewModel/cafe_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CafeViewmodel()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => MenuDetailProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo2222',
      home: const BottomTabBar(),
      routes: {
        'espresso': (context) => const EspressoDetailPage(),
        'coldbrew': (context) => const ColdbrewDetailPage(),
        'frappuchino': (context) => const FrappuDetailPage(),
        'teabana': (context) => const TeabanaDetailPage(),
        'cart': (context) => const CartPage(),
      },
    );
  }
}
