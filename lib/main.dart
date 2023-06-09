import 'package:flutter/material.dart';
import 'pages/splash_page.dart';
import 'pages/sign_in_page.dart';
import 'pages/sign_up_page.dart';

void main() => runApp(const NuFishApp());

class NuFishApp extends StatelessWidget {
  const NuFishApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/" : (context) => const SplashPage(),
        "/sign-in" : (context) => const SignInPage(),
        "/sign-up" : (context) => const SignUpPage()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
