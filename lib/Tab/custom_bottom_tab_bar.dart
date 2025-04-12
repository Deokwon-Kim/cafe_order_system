import 'package:HERMESCAFE/pages/home_page.dart';
import 'package:HERMESCAFE/pages/order_page.dart';
import 'package:HERMESCAFE/pages/other_page.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigation extends StatefulWidget {
  const CustomBottomNavigation({super.key});

  @override
  State<CustomBottomNavigation> createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [HomePage(), OrderPage(), OtherPage()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white.withAlpha(5),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, -2),
            ),
          ],
        ),

        child: BottomAppBar(
          height: 70,
          color: const Color.fromARGB(255, 255, 254, 254),
          shape: CircularNotchedRectangle(),
          notchMargin: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(Icons.home, "홈", 0),
              Transform.translate(
                offset: Offset(0, 30),
                child: Text(
                  '오더',
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                ),
              ),
              // SizedBox(width: 48), // 중앙자리
              _buildNavItem(Icons.more_horiz, "전체메뉴", 2),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent,
        elevation: 6,
        onPressed: () => _onItemTapped(1),
        child: CircleAvatar(
          radius: 32,
          backgroundColor: Color(0xfff37210),
          child: Icon(Icons.coffee_outlined, size: 40, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: SizedBox(
        height: 60,
        width: 60,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: isSelected ? Color(0xfff37210) : Colors.grey),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: isSelected ? Color(0xfff37210) : Colors.grey,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
