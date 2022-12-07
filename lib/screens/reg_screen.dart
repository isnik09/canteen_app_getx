import 'package:canteen_app_getx/screens/home.dart';
import 'package:canteen_app_getx/screens/opt.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/theme_data.dart';
import 'onboarding.dart';

class RegistrationScreen extends StatefulWidget {
  final String phoneNumber;

  RegistrationScreen(this.phoneNumber, {super.key});

  @override
  State<RegistrationScreen> createState() => RegistrationScreenState();
}

class RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  // final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _canteenCardNumberController =
      TextEditingController();
  final TextEditingController _rankController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _formKey,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Register",
                style: TextScheme.largeText,
              ),
              Padding(
                padding: const EdgeInsets.all(45 - 8),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Enter your name',
                      ),
                      keyboardType: TextInputType.name,
                      controller: _userNameController,
                    ),
                    // TextFormField(
                    //   decoration: const InputDecoration(
                    //     hintText: 'Phone Number',
                    //     prefix: Padding(
                    //       padding: EdgeInsets.all(4),
                    //       child: Text('+91'),
                    //     ),
                    //   ),
                    //   maxLength: 10,
                    //   keyboardType: TextInputType.number,
                    //   // controller: _phoneNumberController,
                    // ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Canteen Card Number',
                      ),
                      maxLength: 10,
                      keyboardType: TextInputType.number,
                      controller: _canteenCardNumberController,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Your Rank Gonna change it later',
                      ),
                      maxLength: 10,
                      controller: _rankController,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        addUserDetails(
                            _userNameController.text,
                            widget.phoneNumber,
                            _canteenCardNumberController.text,
                            _rankController.text);
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Home(),
                          ),
                        );
                      },
                      child: const Text('Create Account'),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future addUserDetails(String name, String phoneNumber, String canteenCardNumber,
    String rank) async {
  await FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .set(
    {
      'name': name,
      'phone-number': phoneNumber,
      'canteen-card-number': canteenCardNumber,
      'rank': rank,
    },
  );
}
