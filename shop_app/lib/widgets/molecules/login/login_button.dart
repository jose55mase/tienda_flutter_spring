
import 'package:flutter/material.dart';
import 'package:shop_app/widgets/atoms/button_normal.dart';

class LoginButton extends StatelessWidget {
  final pressedHandler;
  final text;
  const LoginButton({required this.text, required this.pressedHandler});

  @override
  Widget build(BuildContext context) {
    return ButtonNormal(
      text: text,
      pressendHandler: pressedHandler,
      type: 0,
    );
  }
}
