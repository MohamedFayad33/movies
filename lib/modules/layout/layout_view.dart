import 'package:flutter/material.dart';
import 'package:movies_app/core/constant/assets/assets.dart';
import 'package:movies_app/modules/layout/browse/browse_view.dart';
import 'package:movies_app/modules/layout/home/presentation/view/home_view.dart';
import 'package:movies_app/modules/layout/profile/profile_view.dart';
import 'package:movies_app/modules/layout/search/search_view.dart';

class LayoutView extends StatefulWidget {
  const LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  List<Widget> screens = [
    const HomeView(),
    const SearchView(),
    BrowseView(),
    const ProfileView(),
  ];
  int selectedScreen = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedScreen],
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: BottomNavigationBar(
              showSelectedLabels: false,
              showUnselectedLabels: false,
              type: BottomNavigationBarType.fixed,
              currentIndex: selectedScreen,
              onTap: (index) {
                selectedScreen = index;
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(Assets.homeIcon)),
                  label: 'home',
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(Assets.searchIcon)),
                  label: 'search',
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(Assets.browseIcon)),
                  label: 'browse',
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(Assets.profileIcon)),
                  label: 'profile',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
