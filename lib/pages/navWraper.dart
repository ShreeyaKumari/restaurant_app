import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:restaurant_app/pages/HomePage.dart';
import 'package:restaurant_app/pages/about.dart';
import 'package:restaurant_app/pages/acceuil.dart';
import 'package:restaurant_app/utils/colors.dart';

class NavigationWrapper extends StatefulWidget {
  const NavigationWrapper({super.key});

  @override
  State<NavigationWrapper> createState() => _NavigationWrapperState();
}

class _NavigationWrapperState extends State<NavigationWrapper> {
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  List<Widget> _buildScreens() {
    return [
      HomePage(),
      AboutPage(),
      Acceuil(
        name: "La fourchette d’or",
        addresse: "Faculté des sciences",
        desc: "Un restaurant chaleureux offrant une cuisine locale et internationale raffinée.",
        telephone: "212 6 00 00 00 00",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    List<PersistentBottomNavBarItem> _navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          icon: Icon(Icons.home,color: Theme.of(context).colorScheme.secondary),
          title: ("Accueil"),
          activeColorPrimary: Theme.of(context).colorScheme.primary,
          inactiveColorPrimary: Colors.grey,
          activeColorSecondary: AppColors.primary,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.info_outline,color: Theme.of(context).colorScheme.secondary),
          title: ("À propos"),
          activeColorPrimary: Theme.of(context).colorScheme.primary,
          inactiveColorPrimary: Colors.grey,
          activeColorSecondary: AppColors.primary,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.restaurant_menu,color: Theme.of(context).colorScheme.secondary,),
          title: ("Restaurant"),
          activeColorPrimary: Theme.of(context).colorScheme.primary,
          inactiveColorPrimary: Colors.grey,
          activeColorSecondary: AppColors.primary,
        ),
      ];
    }

    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      backgroundColor: Theme.of(context).colorScheme.background,
      navBarStyle: NavBarStyle.style7,
      decoration: NavBarDecoration(

        useBackdropFilter: true,
        borderRadius: BorderRadius.circular(20),
        colorBehindNavBar: Colors.transparent,
      ),
      confineToSafeArea: true,
    );
  }

}
