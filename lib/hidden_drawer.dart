import 'package:flutter/material.dart';
import 'package:restaurant_app/pages/HomePage.dart';
import 'package:restaurant_app/pages/about.dart';
import 'package:restaurant_app/pages/acceuil.dart';
import 'utils/colors.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';



class HiddenDrawer extends StatefulWidget {
  const HiddenDrawer({super.key});

  @override
  State<HiddenDrawer> createState() => _HiddenDrawerState();
}

class _HiddenDrawerState extends State<HiddenDrawer> {
  List<ScreenHiddenDrawer> _pages = [];
  final mytextBaseStyle=TextStyle(color: AppColors.textLight, fontWeight: FontWeight.bold, fontSize: 16);
  @override
  void initState() {
    super.initState();
    _pages=[
      ScreenHiddenDrawer(ItemHiddenMenu(
        colorLineSelected: AppColors.green,
          name: 'Home Page',
        baseStyle: mytextBaseStyle,
          selectedStyle: TextStyle()
      ), HomePage()),
      ScreenHiddenDrawer(ItemHiddenMenu(
          colorLineSelected: AppColors.green,
          name: 'A propos',
          baseStyle: mytextBaseStyle,
          selectedStyle: TextStyle()
      ), AboutPage()),
      ScreenHiddenDrawer(ItemHiddenMenu(
          colorLineSelected: AppColors.green,
          name: 'Acceuil',
          baseStyle: mytextBaseStyle,
          selectedStyle: TextStyle()
      ), Acceuil(name: "La fourchette d\'or",addresse: "Faculté des sciences",desc: "Un restaurant chaleureux offrant une cuisine locale et internationale raffinée.",telephone: "212 6 00 00 00 00",))

    ];
  }
  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      backgroundColorMenu: AppColors.primary,
      screens:_pages,
      initPositionSelected: 1,
      slidePercent: 40,
      contentCornerRadius: 20,
    );

  }
}



