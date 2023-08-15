import 'package:anime_app/screens/categories_screen.dart';
import 'package:anime_app/screens/explore_screen.dart';
import 'package:anime_app/screens/home_screen.dart';
import 'package:anime_app/utils/themes/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController _pageController = PageController();
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: [
          HomeScreen(),
          ExploreScreen(),
          CategoriesScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Constants.darkPrimary
            : Constants.lightBG,
        selectedItemColor: Theme.of(context).brightness == Brightness.dark
            ? Constants.darkAccent
            : Constants.lightAccent,
        unselectedItemColor: Theme.of(context).brightness == Brightness.dark
            ? Constants.lightBG 
            : Constants.darkPrimary,
        elevation: 20,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              FeatherIcons.home,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FeatherIcons.compass,
            ),
            label: "Explore",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FeatherIcons.grid,
            ),
            label: "Categories",
          ),
        ],
        onTap: navigationTapped,
        currentIndex: _page,
      ),
    );
  }

  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }
}
