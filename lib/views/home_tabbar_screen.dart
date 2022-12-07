import 'package:flutter/material.dart';

import 'bookmark_screen.dart';
import 'home_screen.dart';
import 'search_screen.dart';
import 'setting_screen.dart';

class HomeTabbarScreen extends StatefulWidget {
  const HomeTabbarScreen({Key? key}) : super(key: key);

  @override
  State<HomeTabbarScreen> createState() => _HomeTabbarScreenState();
}

class _HomeTabbarScreenState extends State<HomeTabbarScreen> {
  int selectedindex = 0;
  PageController pageController = PageController();

  void onTapped(int index){
    setState(() {
      selectedindex = index;
    });
    pageController.jumpToPage(index);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: [
          HomeScreen(),
          SearchScreen(),
          BookMarksScreen(),
          SettingScreen(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(width: 1.5, color: Colors.grey.shade500),
          ),
        ),
        child: BottomNavigationBar(
          items: <BottomNavigationBarItem> [
            BottomNavigationBarItem(icon: Icon(Icons.home),label: "",backgroundColor: Colors.white),
            BottomNavigationBarItem(icon: Icon(Icons.search),label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.bookmark),label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.settings),label: ""),
          ],
          currentIndex: selectedindex,
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: onTapped,
        ),
      ),
    );
  }
}
