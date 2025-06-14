import 'dart:async';
import 'package:flutter/material.dart';
import 'package:restaurant_app/HomePage.dart';
import 'utils/colors.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:http/http.dart' as http;


class HiddenDrawer extends StatefulWidget {
  const HiddenDrawer({super.key});

  @override
  State<HiddenDrawer> createState() => _HiddenDrawerState();
}

class _HiddenDrawerState extends State<HiddenDrawer> {
  List<ScreenHiddenDrawer> _pages = [];

  @override
  void initState() {
    super.initState();
    _pages=[
      ScreenHiddenDrawer(ItemHiddenMenu(
          name: 'Home Page',
        baseStyle: TextStyle(color: AppColors.textLight),
          selectedStyle: TextStyle()
      ), HomePage())
    ];
  }
  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      backgroundColorMenu: AppColors.primary,
      screens:_pages,
      initPositionSelected: 0,
    );

  }
}



