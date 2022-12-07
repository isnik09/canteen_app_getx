import 'package:canteen_app_getx/screens/opt.dart';
import 'package:canteen_app_getx/screens/reg_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/theme_data.dart';
import 'onboarding.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // @override
  final _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(26),
            child: Column(
              children: [
                const Text(
                  "Login",
                  style: TextScheme.largeText,
                ),
                const Text(
                  // "Login with your registered mobile \n number",
                  'Hello there...\nWelcome to canteen app\nWhy to stand in long lines where you\ncan book your appointment. ',
                  style: TextScheme.smallText,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    style: TextScheme.smallText,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      hintStyle: TextScheme.smallText.copyWith(
                        fontWeight: FontWeight.bold,
                        color: ColourScheme.accentBlack,
                      ),
                      hintText: "Enter Your Phone Number",
                    ),
                    controller: _phoneNumberController,
                  ),
                ),
                ElevatedButton(
                  child: const Text("Continue"),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => OTPScreen(
                          _phoneNumberController.text,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
