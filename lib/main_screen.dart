import 'package:flutter/material.dart';
import 'package:timo_stores/home/screens/homescreen.dart';
import 'package:timo_stores/widgets/general_appbar.dart';
import 'package:timo_stores/widgets/general_widget_holder.dart';

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
      const GeneralWidgetHolder(text: 'No favorite added yet, coming soon..'),
      const CartScreen(),
      const GeneralWidgetHolder(text: 'No Profile logged in yet, coming soon..'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final List<PreferredSizeWidget> appBars = [
      homeAppBar(context),
      generalAppBar(context: context, title: 'favourite'),
      generalAppBar(context: context, title: 'Checkout'),
      generalAppBar(context: context, title: 'Profile')
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
          NavBarData(icon: Icons.favorite),
          NavBarData(icon: Icons.shopping_basket),
          NavBarData(icon: Icons.person),
        ],
      ),
    );
  }
}
