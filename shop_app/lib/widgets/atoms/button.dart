import 'package:flutter/material.dart';

import 'package:shop_app/configuration/styles/colors_definitions.dart';
import 'package:shop_app/configuration/styles/text_styles.dart';


class Button extends StatelessWidget {
  final String text;
  final pressedHandler;

  const Button({required this.text, required this.pressedHandler});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ElevatedButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text, style: TextStyles.whiteSubtitle),

          ],
        ),
        style: ElevatedButton.styleFrom(

          fixedSize: Size( 200, 50 ),
          //primary:   ColorsDefinitions.green,
          padding:   EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: pressedHandler,
      ),
    );
  }
}
