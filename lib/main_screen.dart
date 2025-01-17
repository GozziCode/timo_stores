import 'package:flutter/material.dart';
import 'package:timo_stores/home/screens/homescreen.dart';
import 'package:timo_stores/widgets/general_appbar.dart';

import 'cart/screens/cart_screen.dart';
import 'home/widgets/home_appbar.dart';
import 'widgets/bottom_nav_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;

  late List<Widget> _screens;

  @override
  void initState() {
    super.initState();

    _screens = [
      const HomeScreen(),
      const CartScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final List<PreferredSizeWidget> appBars = [
      homeAppBar(context),
      generalAppBar(context: context, title: 'Checkout'),
    ];
    return Scaffold(
      backgroundColor: Colors.grey[200],
      extendBody: true,
      appBar: appBars[_currentIndex],
      body: PageView(
        children: [
          GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: ListView(children: [_screens[_currentIndex]]),
          ),
        ],
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onItemChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        navBarItems: [
          NavBarData(icon: Icons.home),
          NavBarData(icon: Icons.shopping_basket),
        ],
      ),
    );
  }
}
