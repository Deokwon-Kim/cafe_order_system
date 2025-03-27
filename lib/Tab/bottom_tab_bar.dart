import 'package:cafe_order_system/pages/home_page.dart';
import 'package:cafe_order_system/pages/order_page.dart';
import 'package:cafe_order_system/pages/other_page.dart';
import 'package:flutter/material.dart';

class BottomTabBar extends StatefulWidget {
  const BottomTabBar({super.key});

  @override
  State<BottomTabBar> createState() => _BottomTabBarState();
}

class _BottomTabBarState extends State<BottomTabBar> {
  final List<Widget> _pages = [HomePage(), OrderPage(), OtherPage()];
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
            height: 110,
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
                selectedItemColor: Color(0xffd84040),
                unselectedItemColor: Colors.grey,
                backgroundColor: Colors.white,
                items: [
                  BottomNavigationBarItem(
                    icon: _selectedImageTabItem(
                      'lib/images/home.png',
                      'Home',
                      0,
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: _selectedImageTabItem(
                      'lib/images/coffee-cup3.png',
                      'Order',
                      1,
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: _selectedTabItem(
                      Icons.more_horiz_outlined,
                      'Other',
                      2,
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

  Widget _selectedTabItem(
    IconData icon,
    String label,
    int index, {
    bool isActive = false,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
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
        // SizedBox(height: 4),
        // if (_selectedIndex == index)
        //   Container(width: 45, height: 2, color: Color(0xfff37210))
        // else
        //   SizedBox(height: 2),
      ],
    );
  }

  Widget _selectedImageTabItem(
    String imagePath,
    String label,
    int index, {
    bool isActive = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Column(
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
      ),
    );
  }
}
