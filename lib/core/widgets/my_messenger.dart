import 'package:flutter/material.dart';

class MyMessenger {
  static messenger(BuildContext context, text, color) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(text),
      backgroundColor: color,
    ));
  }
}
