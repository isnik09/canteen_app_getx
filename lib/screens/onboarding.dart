import 'package:canteen_app_getx/constants/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:canteen_app_getx/screens/login_screen.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColourScheme.bgLight,
      appBar: AppBar(
        backgroundColor: ColourScheme.bgLight,
        elevation: 0,
        title: const Text("Onboarding PAGE"),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text("LoginPage"),
          onPressed: () {
            Get.to(
              const LoginScreen(),
            );
          },
        ),
      ),
    );
  }
}
