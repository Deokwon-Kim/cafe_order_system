import 'package:HERMESCAFE/Tab/bottom_tab_bar.dart';
import 'package:HERMESCAFE/notifications/noti_service.dart';
import 'package:HERMESCAFE/pages/cart_page.dart';
import 'package:HERMESCAFE/pages/detail_page/cake_detail_page.dart';
import 'package:HERMESCAFE/pages/detail_page/coldbrew_detail_page.dart';
import 'package:HERMESCAFE/pages/detail_page/espresso_detail_page.dart';
import 'package:HERMESCAFE/pages/detail_page/frappu_detail_page.dart';
import 'package:HERMESCAFE/pages/detail_page/icecream_detail_page.dart';
import 'package:HERMESCAFE/pages/detail_page/teabana_detail_page.dart';
import 'package:HERMESCAFE/provider/cart_provider.dart';
import 'package:HERMESCAFE/provider/menu_detail_provider.dart';
import 'package:HERMESCAFE/tosspayments/payments_page.dart';
import 'package:HERMESCAFE/provider/cafe_provider.dart';
import 'package:HERMESCAFE/provider/desert_provider.dart';
import 'package:HERMESCAFE/provider/iced_cafe_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await NotiService().initNotification();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CafeViewmodel()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => MenuDetailProvider()),
        ChangeNotifierProvider(create: (context) => IcedCafeViewmodel()),
        ChangeNotifierProvider(create: (context) => DesertViewmodel()),
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
        'cake': (context) => const CakeDetailPage(),
        'icecream': (context) => const IceCreamDetailPage(),
        'cart': (context) => const CartPage(),
        'payment': (context) => const PaymentsPage(),
      },
    );
  }
}
