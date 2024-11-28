import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static const String routeName = '/splash';
  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(
        seconds: 3,
      ),
      () {
        Navigator.pushReplacementNamed(
          context,
          '/intro',
        );
      },
    );
    return Scaffold(
      backgroundColor: const Color(
        0XFF121312,
      ),
      body: Center(
        child: Image.asset(
          'assets/images/movies.png',
        ),
      ),
    );
  }
}
