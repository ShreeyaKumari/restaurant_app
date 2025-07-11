import 'package:flutter/material.dart';
import 'package:restaurant_app/pages/navWraper.dart';
import 'package:restaurant_app/utils/colors.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/utils/theme_provider.dart';
import 'package:google_fonts/google_fonts.dart';

import 'pages/HomePage.dart';
import 'pages/SplashScreen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.light(
            primary: AppColors.background,
            secondary: AppColors.yellow,
            background: AppColors.textLight,
            surface: Colors.grey.shade100,
            onPrimary: Colors.white,
            onSecondary: Colors.black,
          ),
            textTheme: TextTheme(
                bodyLarge: GoogleFonts.dancingScript(
                  fontSize: 24,
                  color: AppColors.brown,
                  fontWeight: FontWeight.w600,
                ),
                bodySmall : TextStyle(
                    fontSize : 12
                )
            )
        ),
        darkTheme: ThemeData(
          colorScheme: ColorScheme.dark(
            primary: Colors.white,
            secondary: AppColors.yellow,
            background: AppColors.textDark,
            surface: Colors.grey.shade900,
            onPrimary: Colors.black,
            onSecondary: Colors.white,
          ),
          textTheme: TextTheme(
            bodyLarge: GoogleFonts.dancingScript(
              fontSize: 24,
              color: AppColors.yellow,
              fontWeight: FontWeight.w600,
            ),
            bodySmall : TextStyle(
              fontSize : 12
            )
          ),
        ),
      themeMode: themeProvider.themeMode,
      title: "La fourchette d\'or",
      debugShowCheckedModeBanner: false,

      routes: {
          '/': (context) => SplashScreen(),
        '/home': (context) => NavigationWrapper()
      },
    );
  }
}
