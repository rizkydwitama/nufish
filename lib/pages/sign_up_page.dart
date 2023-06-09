import 'package:flutter/material.dart';
import 'package:nufish/theme.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              "Sign Up",
              style: secondaryTextStyle.copyWith(
                  fontWeight: semiBold,
                  fontSize: 24
              )
          ),
          const SizedBox(height: 2),
          Text(
              "Sign Up and Happy Shopping",
              style: tertiaryTextStyle.copyWith(
                  fontWeight: regular,
                  fontSize: 14
              )
          )
        ],
      );
    }

    Widget fullNameInput() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              "Full Name",
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
                    "assets/images/full_name_icon.png",
                    width: 17,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                      child: TextFormField(
                        style: tertiaryTextStyle,
                        decoration: InputDecoration.collapsed(
                          hintText: "Your Full Name",
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

    Widget usernameInput() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              "Username",
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
                    "assets/images/username_icon.png",
                    width: 17,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                      child: TextFormField(
                        style: tertiaryTextStyle,
                        decoration: InputDecoration.collapsed(
                          hintText: "Your Username",
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

    Widget signUpButton() {
      return Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: TextButton(
          onPressed: () {},
          child: Text(
            "Sign Up",
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
              "Already have an account? ",
              style: tertiaryTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: regular
              )
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "/sign-in");
            },
            child: Text(
                "Sign In",
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
              fullNameInput(),
              const SizedBox(height: 20),
              usernameInput(),
              const SizedBox(height: 20),
              emailInput(),
              const SizedBox(height: 20),
              passwordInput(),
              const SizedBox(height: 30),
              signUpButton(),
              const Spacer(),
              footer()
            ],
          ),
        ),
      ),
    );
  }
}
