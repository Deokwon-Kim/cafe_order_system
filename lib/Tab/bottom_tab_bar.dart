import 'package:HERMESCAFE/pages/home_page.dart';
import 'package:HERMESCAFE/pages/order_page.dart';
import 'package:HERMESCAFE/pages/other_page.dart';
import 'package:HERMESCAFE/pages/ticket_page.dart';
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
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 115,
            decoration: BoxDecoration(
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
              data: IconThemeData(size: 40.0),
              child: BottomNavigationBar(
                onTap: _onItemTapped,
                selectedIconTheme: IconThemeData(size: 24),
                unselectedIconTheme: IconThemeData(size: 24),
                selectedLabelStyle: TextStyle(fontSize: 12),
                unselectedLabelStyle: TextStyle(fontSize: 12),
                unselectedItemColor: Colors.grey,
                backgroundColor: Colors.white,
                items: [
                  BottomNavigationBarItem(
                    icon: _selectedTabItem(
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Icon(
                          Icons.home,
                          color:
                              _selectedIndex == 0
                                  ? Color(0xfff37210)
                                  : Colors.grey,
                        ),
                      ),
                      'Home',
                      0,
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

  Widget _selectedImageTabItem(
    String imagePath,
    String label,
    int index, {
    // ignore: unused_element_parameter
    bool isActive = false,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ImageIcon(
          AssetImage(imagePath),
          color: _selectedIndex == index ? Color(0xfff37210) : Colors.grey,
          size: 20,
        ),
        Text(
          label,
          style: TextStyle(
            color: _selectedIndex == index ? Color(0xfff37210) : Colors.grey,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
