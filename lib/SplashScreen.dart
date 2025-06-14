import 'dart:async';
import 'package:flutter/material.dart';
import 'package:restaurant_app/utils/colors.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _progress = 0.0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();

    // Timer to increment progress every 100ms over 3 seconds
    _timer = Timer.periodic(Duration(milliseconds: 10), (timer) {
      setState(() {
        _progress += 1 / 30; // ~3 seconds
        if (_progress >= 1.0) {
          _progress = 1.0;
          _timer.cancel();
          Navigator.pushReplacementNamed(context, '/home');
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // prevent memory leak
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset('assets/images/logo.png', width: 300)),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: LinearProgressIndicator(
              value: _progress,
              backgroundColor: Colors.grey[300],
              color: AppColors.green,
              minHeight: 6,
            ),
          ),
        ],
      ),
    );
  }
}
