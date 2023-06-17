import 'package:flutter/material.dart';
import 'package:nufish/theme.dart';
import 'package:nufish/widgets/loading_button.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleSignIn() async {

      setState(() {
        isLoading = true;
      });

      if(await authProvider.loginProvider(
          email: emailController.text,
          password: passwordController.text
      )) {
        if(context.mounted) {
          Navigator.pushNamed(context, '/home');
        }
      } else {
        if(context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.red,
                content: Text(
                  'Gagal Login!',
                  textAlign: TextAlign.center,
                ),
              )
          );
        }
      }

      setState(() {
        isLoading = false;
      });

    }

    Widget header() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Sign In",
            style: secondaryTextStyle.copyWith(
                fontWeight: semiBold,
                fontSize: 24
            )
          ),
          const SizedBox(height: 2),
          Text(
            "Sign In to Continue",
            style: tertiaryTextStyle.copyWith(
                fontWeight: regular,
                fontSize: 14
            )
          )
        ],
      );
    }

    Widget emailInput() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Email Address",
            style: secondaryTextStyle.copyWith(
              fontWeight: medium,
              fontSize: 16
            )
          ),
          const SizedBox(height: 12),
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 17),
            decoration: BoxDecoration(
              color: quaternaryColor,
              borderRadius: BorderRadius.circular(12)
            ),
            child: Center(
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/email_icon.png",
                    width: 17,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                      child: TextFormField(
                        controller: emailController,
                        style: tertiaryTextStyle,
                        decoration: InputDecoration.collapsed(
                          hintText: "Your Email Address",
                          hintStyle: tertiaryTextStyle,
                        ),
                      )
                  )
                ],
              ),
            ),
          ),
        ],
      );
    }

    Widget passwordInput() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              "Password",
              style: secondaryTextStyle.copyWith(
                  fontWeight: medium,
                  fontSize: 16
              )
          ),
          const SizedBox(height: 12),
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 17),
            decoration: BoxDecoration(
                color: quaternaryColor,
                borderRadius: BorderRadius.circular(12)
            ),
            child: Center(
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/password_icon.png",
                    width: 17,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                      child: TextFormField(
                        controller: passwordController,
                        style: tertiaryTextStyle,
                        decoration: InputDecoration.collapsed(
                          hintText: "Your Password",
                          hintStyle: tertiaryTextStyle,
                        ),
                      )
                  )
                ],
              ),
            ),
          ),
        ],
      );
    }

    Widget signInButton() {
      return Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: TextButton(
          onPressed: handleSignIn,
          child: Text(
            "Sign In",
            style: quaternaryTextStyle.copyWith(
              fontWeight: medium,
              fontSize: 16
            ),
          ),
        ),
      );
    }

    Widget footer() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Don't have an account? ",
            style: tertiaryTextStyle.copyWith(
              fontSize: 12,
              fontWeight: regular
            )
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "/sign-up");
            },
            child: Text(
              "Sign Up",
              style: secondaryTextStyle.copyWith(
                fontSize: 12,
                fontWeight: medium
              )
            ),
          )
        ],
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 30
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
              const SizedBox(height: 70),
              emailInput(),
              const SizedBox(height: 20),
              passwordInput(),
              const SizedBox(height: 30),
              isLoading? loadingButton() : signInButton(),
              const Spacer(),
              footer()
            ],
          ),
        ),
      ),
    );
  }
}
