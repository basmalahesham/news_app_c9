import 'dart:async';

import 'package:flutter/material.dart';

import '../../layout/home_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  static const String routeName = "splash";

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Timer(
      const Duration(
        seconds: 3,
      ),
      () {
        Navigator.of(context).pushReplacementNamed(HomeLayoutView.routeName);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage('assets/images/pattern.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(child: Image.asset('assets/images/logo.png')),
      ),
    );
  }
}
