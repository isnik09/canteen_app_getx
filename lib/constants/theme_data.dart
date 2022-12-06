import 'package:flutter/material.dart';

class ColourScheme {
  static const bgLight = Color.fromARGB(255, 226, 218, 188);
  static const black = Color.fromARGB(204, 0, 0, 0);
  static const accentBlack = Color.fromARGB(50, 0, 0, 0);
}

class TextScheme {
  static const largeText = TextStyle(
    color: ColourScheme.black,
    fontWeight: FontWeight.bold,
    fontSize: 64,
  );
  static const smallText = TextStyle(
    color: ColourScheme.black,
    fontWeight: FontWeight.w500,
    fontSize: 18,
  );
}
