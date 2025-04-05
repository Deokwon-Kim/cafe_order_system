import 'package:HERMESCAFE/Tab/bottom_tab_bar.dart';
import 'package:HERMESCAFE/firebase_options.dart';
import 'package:HERMESCAFE/login/login_page.dart';
import 'package:HERMESCAFE/pages/detail_page/star_detail_page.dart';
import 'package:HERMESCAFE/pages/order_history_page.dart';
import 'package:HERMESCAFE/pages/personal_info_page.dart';
import 'package:HERMESCAFE/provider/ticket_provider.dart';
import 'package:HERMESCAFE/provider/user_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
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
import 'package:HERMESCAFE/provider/cafe_provider.dart';
import 'package:HERMESCAFE/provider/desert_provider.dart';
import 'package:HERMESCAFE/provider/iced_cafe_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await NotiService().initNotification();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CafeViewmodel()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => MenuDetailProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => IcedCafeViewmodel()),
        ChangeNotifierProvider(create: (context) => DesertViewmodel()),
        ChangeNotifierProvider(create: (context) => TicketProvider()),
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
      home: AuthWrapper(),
      routes: {
        'espresso': (context) => const EspressoDetailPage(),
        'coldbrew': (context) => const ColdbrewDetailPage(),
        'frappuchino': (context) => const FrappuDetailPage(),
        'teabana': (context) => const TeabanaDetailPage(),
        'cake': (context) => const CakeDetailPage(),
        'icecream': (context) => const IceCreamDetailPage(),
        'cart': (context) => const CartPage(),
        'star': (context) => const StarDetailPage(),
        '주문내역': (context) => const OrderHistoryPage(),
        '개인정보': (context) => const PersonalInfoPage(),
      },
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('에러가 발생하였습니다.'));
        } else if (snapshot.hasData) {
          Future.microtask(() {
            Provider.of<UserProvider>(context, listen: false).fetchUsername();
          });
          return const BottomTabBar(); // 로그인된 경우
        } else {
          return const LoginPage(); // 로그인되지 않은 경우
        }
      },
    );
  }
}
