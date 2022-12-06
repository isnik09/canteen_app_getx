import 'package:canteen_app_getx/screens/reg_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/theme_data.dart';
import 'onboarding.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                  "Login with your registered mobile \n number",
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
                    onChanged: (value) {
                      // phoneNumber = value;
                    },
                  ),
                ),
                ElevatedButton(
                  child: const Text("Continue"),
                  onPressed: () {
                    Get.to(const Onboarding());
                  },
                ),
                const Text("Don’t have registered yet?"),
                ElevatedButton(
                  child: const Text("Register here"),
                  onPressed: () {
                    Get.to(const RegistrationScreen());
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
