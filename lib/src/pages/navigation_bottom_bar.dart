import 'package:flutter/material.dart';
import 'package:life_goals_pdm/src/app/app_colors.dart';
import 'package:life_goals_pdm/src/app/app_text_styles.dart';
import 'package:life_goals_pdm/src/pages/config_page.dart';
import 'package:life_goals_pdm/src/pages/home_page.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class NavigationBottomBar extends StatefulWidget {
  const NavigationBottomBar({Key? key}) : super(key: key);

  @override
  _NavigationBottomBarState createState() => _NavigationBottomBarState();
}

class _NavigationBottomBarState extends State<NavigationBottomBar> {
  int _pageIndex = 0;
  late PageController _pageController;

  List<Widget> tabPages = [
    const HomePage(),
    const ConfigPage(),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _pageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: AppColors.shadow,
              blurRadius: 10,
            ),
          ],
        ),
        child: SizedBox(
          height: 65,
          child: BottomNavigationBar(
            fixedColor: AppColors.primary,
            unselectedItemColor: AppColors.black,
            selectedLabelStyle: AppTextStyles.labelTabBar,
            unselectedLabelStyle: AppTextStyles.labelTabBar,
            currentIndex: _pageIndex,
            onTap: onTabTapped,
            backgroundColor: AppColors.white,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 3),
                  child: Icon(Entypo.home),
                ),
                label: ("Home"),
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 3),
                  child: Icon(Entypo.cog),
                ),
                label: ("Configurações"),
              ),
            ],
          ),
        ),
      ),
      body: PageView(
        children: tabPages,
        onPageChanged: onPageChanged,
        controller: _pageController,
      ),
    );
  }

  void onPageChanged(int page) {
    setState(() {
      _pageIndex = page;
    });
  }

  void onTabTapped(int index) {
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);
  }
}
