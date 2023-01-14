import 'package:flutter/material.dart';
class Button extends StatelessWidget {
  VoidCallback onpressed;
  final text;
  Button({required this.text, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onpressed,
      child: Text(text),
      color: Colors.yellow,



    );
  }
}
