import 'package:HERMESCAFE/devicetype/device_type_helper.dart';
import 'package:HERMESCAFE/pages/home_page.dart';
import 'package:HERMESCAFE/pages/order_page.dart';
import 'package:HERMESCAFE/pages/other_page.dart';
import 'package:HERMESCAFE/pages/ticket_page.dart';
import 'package:HERMESCAFE/utils/responsive_styles.dart';
import 'package:flutter/material.dart';

class BottomTabBar extends StatefulWidget {
  const BottomTabBar({super.key});

  @override
  State<BottomTabBar> createState() => _BottomTabBarState();
}

class _BottomTabBarState extends State<BottomTabBar> {
  final List<Widget> _pages = [
    HomePage(),
    TicketPage(),
    OrderPage(),
    OtherPage(),
  ];
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final deviceType = DeviceTypeHelper.getDeviceType(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: _pages[_selectedIndex],
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: ResponsiveStyles.bottomTapBarHeight(deviceType),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(80),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: IconTheme(
              data: IconThemeData(size: 44.0),
              child: BottomNavigationBar(
                onTap: _onItemTapped,
                selectedIconTheme: IconThemeData(size: 23),
                unselectedIconTheme: IconThemeData(size: 23),
                selectedLabelStyle: TextStyle(fontSize: 12),
                unselectedLabelStyle: TextStyle(fontSize: 12),
                unselectedItemColor: Colors.grey,
                items: [
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(top: 13.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ImageIcon(
                            AssetImage('lib/images/home.png'),
                            color:
                                _selectedIndex == 0
                                    ? Color(0xfff37210)
                                    : Colors.grey,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Text(
                              'Home',
                              style: TextStyle(
                                fontSize: 12,
                                color:
                                    _selectedIndex == 0
                                        ? Color(0xfff37210)
                                        : Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: _selectedTabItem(
                      Icon(
                        Icons.payment,
                        color:
                            _selectedIndex == 1
                                ? Color(0xfff37210)
                                : Colors.grey,
                      ),
                      'Pay',
                      1,
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: _selectedTabItem(
                      ImageIcon(
                        AssetImage('lib/images/coffee-cup3.png'),
                        color:
                            _selectedIndex == 2
                                ? Color(0xfff37210)
                                : Colors.grey,
                      ),
                      'Order',
                      2,
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: _selectedTabItem(
                      Icon(
                        Icons.more_horiz_outlined,
                        color:
                            _selectedIndex == 3
                                ? Color(0xfff37210)
                                : Colors.grey,
                      ),
                      'Other',
                      3,
                    ),
                    label: '',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _selectedTabItem(Widget iconWidget, String label, int index) {
    final isSelected = _selectedIndex == index;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 24, width: 24, child: Center(child: iconWidget)),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: isSelected ? Color(0xfff37210) : Colors.grey,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
