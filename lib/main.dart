import 'package:flutter/material.dart';
import 'package:nufish/providers/auth_provider.dart';
import 'package:provider/provider.dart';
import 'pages/splash_page.dart';
import 'pages/sign_in_page.dart';
import 'pages/sign_up_page.dart';
import 'pages/home_page.dart';

void main() => runApp(const NuFishApp());

class NuFishApp extends StatelessWidget {
  const NuFishApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => AuthProvider()
        ),
      ],
      child: MaterialApp(
        routes: {
          "/" : (context) => const SplashPage(),
          "/sign-in" : (context) => const SignInPage(),
          "/sign-up" : (context) => const SignUpPage(),
          "/home" : (context) => const HomePage(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
