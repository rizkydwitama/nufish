import 'package:flutter/material.dart';
import 'package:nufish/providers/auth_provider.dart';
import 'package:nufish/theme.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController usernameController = TextEditingController(text: '');
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {

    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleSignUp() async {
      if (await authProvider.registerProvider(
          name: nameController.text,
          username: usernameController.text,
          email: emailController.text,
          password: passwordController.text
      )) {
        if (context.mounted) {
          Navigator.pushNamed(context, '/sign-in');
        }
      } else {
        if (context.mounted) {
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
    }

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
                            controller: nameController,
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
                            controller: usernameController,
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

        Widget signUpButton() {
          return Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: TextButton(
              onPressed: () {
                handleSignUp();
              },
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
