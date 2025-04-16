import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:task/navigationbar/Homepage.dart';
class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }
  List<Widget> _buildScreens() {
    return [      const Homepage(),
      const Center(child: Text('coming soon')),
      const Center(child: Text('coming soon')),
      const Center(child: Text('coming soon')),
    ];
  }
  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: ("Home"), textStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w700,
      ),
        activeColorPrimary: const Color(0xff59c1b3),
        inactiveColorPrimary: Colors.grey,
          activeColorSecondary: Colors.white,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.search),
        title: ("Search"), textStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w700,
      ),
        activeColorPrimary: const Color(0xff59c1b3),
        inactiveColorPrimary: Colors.grey,
          activeColorSecondary: Colors.white,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.notifications),
        title: ("location"), textStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w700,
      ),
        activeColorPrimary: const Color(0xff59c1b3),
        inactiveColorPrimary: Colors.grey,
          activeColorSecondary: Colors.white,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person),
        title: ("Profile"), textStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w700,
      ),
        activeColorPrimary: const Color(0xff59c1b3),
        inactiveColorPrimary: Colors.grey,
        activeColorSecondary: Colors.white,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      navBarStyle: NavBarStyle.style10,
      navBarHeight: 80.0,
      backgroundColor: Colors.white,
    );
  }
}