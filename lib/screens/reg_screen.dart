import 'package:canteen_app_getx/screens/opt.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/theme_data.dart';
import 'onboarding.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => RegistrationScreenState();
}

class RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _phoneNumberController = TextEditingController();
  final _userNameController = TextEditingController();
  final _canteenCardNumberController = TextEditingController();
  final _rankController = TextEditingController();

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
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Phone Number',
                        prefix: Padding(
                          padding: EdgeInsets.all(4),
                          child: Text('+91'),
                        ),
                      ),
                      maxLength: 10,
                      keyboardType: TextInputType.number,
                      controller: _phoneNumberController,
                    ),
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
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => OTPScreen(
                              _phoneNumberController.text,
                              _userNameController.text,
                              _canteenCardNumberController.text,
                              _rankController.text,
                            ),
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










//  crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 "Register",
//                 style: TextScheme.largeText,
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(45 - 8),
//                 child: Column(
//                   children: [
//                     TextFormField(
//                       decoration: const InputDecoration(
//                         hintText: 'Enter your name',
//                       ),
//                     ),
//                     TextFormField(
//                       decoration: const InputDecoration(
//                         hintText: 'Mobile Number',
//                       ),
//                     ),
//                     TextFormField(
//                       decoration: const InputDecoration(
//                         hintText: 'Canteen Card Number',
//                       ),
//                     ),
//                     ElevatedButton(
//                       onPressed: () {},
//                       child: const Text('Create Account'),
//                     )
//                   ],
//                 ),
//               )
//             ],