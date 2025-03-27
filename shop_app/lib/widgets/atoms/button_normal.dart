
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/configuration/styles/colors_definitions.dart';
import 'package:shop_app/configuration/styles/text_styles.dart';
import 'package:shop_app/widgets/atoms/custom_text.dart';

class ButtonNormal extends StatelessWidget {
  final pressendHandler;
  final String? text;
  final int type;
  String? svgIcon;
  final Icon iconButton;
  Color? colorSvgIcon;
  Color? colorBackground;
  double? heightSvgIcon;

  ButtonNormal(
      {this.text,
        required this.pressendHandler,
        required this.type,
        this.svgIcon,
        this.iconButton = const Icon(Icons.account_box_sharp),
        this.colorSvgIcon,
        this.colorBackground,
        this.heightSvgIcon});

  @override
  Widget build(BuildContext context) {
    Widget button = CustomText(
        sentence: "Button", TextStyle: TextStyles.titlesOrBody13BoldText);
    //standar button
    if (type == 0) {
      button = ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            //primary: colorBackground ??= ColorsDefinitions.orange
        ),
        onPressed: pressendHandler,
        child: SizedBox(

          width: double.infinity,
          child: Text(
            text!,
            textAlign: TextAlign.center,
            style: const TextStyle(color: ColorsDefinitions.red, fontSize: 17,
              fontFamily: "JosefinSans",),
          ),
        ),
      );
    }
    //icon button
    if (type == 1) {
      button = IconButton(
        icon: Icon(Icons.arrow_back_ios), /*SvgPicture.asset(
          svgIcon ??= ImageUrl.arrow,
          color: colorSvgIcon ??= ColorsDefinitions.white,
          height: heightSvgIcon ??= 20,
        ),*/
        onPressed: pressendHandler,
      );
    }
    //svg button
    if (type == 2) {
      ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              //primary: ColorsDefinitions.orange
          ),
          onPressed: pressendHandler,
          child: Row(
            children: [
              iconButton,
              Text(text!,
                  style: const TextStyle(
                      color: ColorsDefinitions.white, fontSize: 17)),
            ],
          )
      );
    }
    return button;
  }
}
