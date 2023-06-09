import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nufish/theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    Timer(
        const Duration(seconds: 3),
            () => Navigator.pushNamed(context, "/sign-in")
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
          child: Center(
            child: Container(
              width: 150,
              height: 61.71,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/nufish_logo.png")
                )
              ),
            ),
          )
      ),
    );
  }
}
