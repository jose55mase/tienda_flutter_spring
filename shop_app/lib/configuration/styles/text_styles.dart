import 'package:flutter/material.dart';
import 'package:shop_app/configuration/styles/colors_definitions.dart';



class TextStyles {

  static TextStyle gray = TextStyle(
      fontFamily: "Muli-Medium",
      fontSize: 18.0,
      color: ColorsDefinitions.gray,
      fontWeight: FontWeight.w500);

  static const TextStyle whiteSubtitle = TextStyle(
      fontFamily: "Muli-Medium",
      fontSize: 20.0,
      color: ColorsDefinitions.white,
      // letterSpacing: 1.2,
      fontWeight: FontWeight.w600);

  static const TextStyle blackSubtitle = TextStyle(
      fontFamily: "Muli-Medium",
      fontSize: 20.0,
      color: Colors.black,
      // letterSpacing: 1.2,
      fontWeight: FontWeight.w600);

  static const TextStyle subtitleGreen = TextStyle(
      fontFamily: "Muli-Medium",
      fontSize: 15.0,
      color: ColorsDefinitions.green,
      // letterSpacing: 1.2,
      fontWeight: FontWeight.w600);

  static const TextStyle titleGreen = TextStyle(
      fontFamily: "Muli-Medium",
      fontSize: 20.0,
      color: ColorsDefinitions.green,
      // letterSpacing: 1.2,
      fontWeight: FontWeight.w800);







  static TextStyle whiteAppName = const TextStyle(
    fontWeight: FontWeight.bold,
    color: ColorsDefinitions.white,
    fontSize: 40,
    letterSpacing: 4.5,
    fontFamily: "Josefins Sans - Bold",
  );

  static TextStyle subTitleHeader = const TextStyle(
    color: Colors.white,
    fontSize: 29,
    fontWeight: FontWeight.bold,
    fontFamily: "JosefinSans",
  );

  static TextStyle subTitle = const TextStyle(
    fontWeight: FontWeight.w900,
    color: ColorsDefinitions.white,
    fontSize: 25,
    fontFamily: "JosefinSans",
    wordSpacing: 15,
  );

  static TextStyle subTitleMod = const TextStyle(
      fontWeight: FontWeight.w900,
      color: ColorsDefinitions.white,
      fontSize: 30,
      fontFamily: "JosefinSans");

  static TextStyle subTitleName = const TextStyle(
    fontWeight: FontWeight.w900,
    color: ColorsDefinitions.white,
    fontSize: 20,
    fontFamily: "JosefinSans",
  );

  static TextStyle descriptionTitle = const TextStyle(
    fontWeight: FontWeight.w400,
    color: ColorsDefinitions.white,
    fontSize: 15,
    fontFamily: "JosefinSans",
  );

  static TextStyle Title = const TextStyle(
      fontWeight: FontWeight.w900,
      color: ColorsDefinitions.white,
      fontSize: 40,
      fontFamily: "Josefins Sans - Bold",
      wordSpacing: 10);

  static TextStyle normalText = const TextStyle(
    fontWeight: FontWeight.w900,
    color: ColorsDefinitions.white,
    fontSize: 16,
    fontFamily: "Josefins Sans - Bold",
  );

  static TextStyle normalTextBlack = const TextStyle(
    fontWeight: FontWeight.w900,
    color: ColorsDefinitions.gray,
    fontSize: 16,
    fontFamily: "Josefins Sans - Bold",
  );

  static TextStyle normalText_14 = const TextStyle(
    fontWeight: FontWeight.w900,
    color: ColorsDefinitions.white,
    fontSize: 13,
    fontFamily: "JosefinSans",
  );

  static TextStyle normalText_placeHolder_14 = const TextStyle(
    fontWeight: FontWeight.w300,
    color: ColorsDefinitions.placeHolder,
    fontSize: 14,
    fontFamily: "JosefinSans",
  );

  static TextStyle normalText_placeHolder_16 = const TextStyle(
    fontWeight: FontWeight.w900,
    color: ColorsDefinitions.placeHolder,
    fontSize: 16,
    fontFamily: "JosefinSans",
  );

  static TextStyle normalTextblack = const TextStyle(
    fontWeight: FontWeight.w900,
    color: ColorsDefinitions.placeHolder,
    fontSize: 16,
    fontFamily: "JosefinSans",
  );
//0
  static TextStyle blueGenie30BoldText = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 30,
    color: ColorsDefinitions.blue_genie.withOpacity(1),
    fontStyle: FontStyle.normal,
    fontFamily: 'JosefinSans',
  );
  static TextStyle black23BoldText = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 23,
    color: ColorsDefinitions.black,
    fontStyle: FontStyle.normal,
    fontFamily: 'JosefinSans',
  );
  //1 Cargo
  static TextStyle shapeBlue14Text = TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 14,
      color: ColorsDefinitions.shapeBlue.withOpacity(1),
      fontStyle: FontStyle.normal,
      fontFamily: 'JosefinSans');

  static TextStyle shapeBlue17Text = TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 17,
      color: ColorsDefinitions.shapeBlue.withOpacity(1),
      fontStyle: FontStyle.normal,
      fontFamily: 'JosefinSans');
  static TextStyle shapeBlue14SemiBoldText = TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 14,
      color: ColorsDefinitions.shapeBlue.withOpacity(1),
      fontStyle: FontStyle.normal,
      fontFamily: 'JosefinSans');
  //2 info extra
  static TextStyle blueGenie14LightText = TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14,
      color: ColorsDefinitions.blue_genie.withOpacity(1),
      fontStyle: FontStyle.normal,
      fontFamily: 'JosefinSans');
  static TextStyle blueGenie16normal = TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 16,
      color: ColorsDefinitions.blue_genie.withOpacity(1),
      fontStyle: FontStyle.normal,
      fontFamily: 'JosefinSans');
//MISION
  //6 titulo
  static TextStyle bodyText28BoldText = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: ColorsDefinitions.bodyText.withOpacity(1),
      fontStyle: FontStyle.normal,
      fontFamily: 'JosefinSans');

  static TextStyle bodyText20BoldText = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 17,
      color: ColorsDefinitions.bodyText.withOpacity(1),
      fontStyle: FontStyle.normal,
      fontFamily: 'JosefinSans');

  static TextStyle bodyText20BoldTextUnderline = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 17,
      decoration: TextDecoration.underline,
      color: ColorsDefinitions.bodyText.withOpacity(1),
      fontStyle: FontStyle.normal,
      fontFamily: 'JosefinSans');

  static TextStyle BlueGenieText20BoldTextUnderline = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 17,
      decoration: TextDecoration.underline,
      color: ColorsDefinitions.blue_genie.withOpacity(1),
      fontStyle: FontStyle.normal,
      fontFamily: 'JosefinSans');

  static TextStyle bodyText24BoldText = const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: Colors.black,
      fontStyle: FontStyle.normal,
      fontFamily: 'JosefinSans');
  //3 titulo
  static TextStyle bodyText18BoldText = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18,
      color: ColorsDefinitions.bodyText.withOpacity(1),
      fontStyle: FontStyle.normal,
      fontFamily: 'JosefinSans');

  //4 detalles
  static TextStyle placeHolder15ItalicText = TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 15,
      color: ColorsDefinitions.placeHolder.withOpacity(1),
      fontStyle: FontStyle.italic,
      fontFamily: 'JosefinSans');
  static TextStyle bodyText16ItalicSemiBoldText = TextStyle(
      fontWeight: FontWeight.w900,
      fontSize: 16,
      color: ColorsDefinitions.bodyText2.withOpacity(1),
      fontStyle: FontStyle.italic,
      fontFamily: 'JosefinSans');
  static TextStyle bodyText14ItalicSemiBoldText = TextStyle(
      fontWeight: FontWeight.w900,
      fontSize: 14,
      color: ColorsDefinitions.bodyText2.withOpacity(1),
      fontStyle: FontStyle.italic,
      fontFamily: 'JosefinSans');
  static TextStyle bodyText17BoldText = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 17,
      color: ColorsDefinitions.bodyText2.withOpacity(1),
      fontStyle: FontStyle.normal,
      fontFamily: 'JosefinSans');
//PUBLICACIÓN
  //5 fecha
  static TextStyle placeHolder14LightText = TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14,
      color: ColorsDefinitions.placeHolder.withOpacity(1),
      fontStyle: FontStyle.normal,
      fontFamily: 'JosefinSans');

  //7 tipo
  static TextStyle placeHolder12Text = TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 12,
      color: ColorsDefinitions.placeHolder.withOpacity(1),
      fontStyle: FontStyle.normal,
      fontFamily: 'JosefinSans');
  //12 labels de selection
  static TextStyle placeHolder12SemiLightText = TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 12,
      color: ColorsDefinitions.placeHolder.withOpacity(1),
      fontStyle: FontStyle.normal,
      fontFamily: 'JosefinSans');
//8 TEXT FIELD
  static TextStyle titlesOrBody13BoldText = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 13,
      color: ColorsDefinitions.titlesOrBody.withOpacity(1),
      fontStyle: FontStyle.normal,
      fontFamily: 'JosefinSans');
  static TextStyle titlesOrBody13BoldTextColorWhite = TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 13,
      color: ColorsDefinitions.borders.withOpacity(1),
      fontStyle: FontStyle.normal,
      fontFamily: 'JosefinSans');
  static TextStyle titlesOrBody16normalText = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
      color: ColorsDefinitions.titlesOrBody.withOpacity(1),
      fontStyle: FontStyle.normal,
      fontFamily: 'JosefinSans');
//WHITE TEXT
  //10 subtitle
  static TextStyle white48BoldText = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 48,
      color: ColorsDefinitions.white.withOpacity(1),
      fontStyle: FontStyle.normal,
      fontFamily: 'JosefinSans');
  static TextStyle white40SemiLightText = TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 40,
      color: ColorsDefinitions.white.withOpacity(1),
      fontStyle: FontStyle.normal,
      fontFamily: 'JosefinSans');
  //9 title
  static TextStyle white27BoldText = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 25,
      color: ColorsDefinitions.white.withOpacity(1),
      fontStyle: FontStyle.normal,
      fontFamily: 'JosefinSans');
  static TextStyle white25BoldText = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 25,
      color: ColorsDefinitions.white.withOpacity(1),
      fontStyle: FontStyle.normal,
      fontFamily: 'JosefinSans');
  //15 title Iniciar sesion
  static TextStyle white24BoldText = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: ColorsDefinitions.white.withOpacity(1),
      fontStyle: FontStyle.normal,
      fontFamily: 'JosefinSans');
  static TextStyle white24SemiBoldText = TextStyle(
      fontWeight: FontWeight.w900,
      fontSize: 19,
      color: ColorsDefinitions.white.withOpacity(1),
      fontStyle: FontStyle.normal,
      fontFamily: 'JosefinSans');

  static TextStyle white20LightText = TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 22,
      color: ColorsDefinitions.white.withOpacity(1),
      fontStyle: FontStyle.normal,
      fontFamily: 'JosefinSans');

  static TextStyle white17BoldText = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 17,
      color: ColorsDefinitions.white.withOpacity(1),
      fontStyle: FontStyle.normal,
      fontFamily: 'JosefinSans');
  //14 title labels arma tu tripulacion
  static TextStyle white16SemiLightText = TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 16,
      color: ColorsDefinitions.white.withOpacity(1),
      fontStyle: FontStyle.normal,
      fontFamily: 'JosefinSans');
  //11 description
  static TextStyle white15LightText = TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 15,
      color: ColorsDefinitions.white.withOpacity(1),
      fontStyle: FontStyle.normal,
      fontFamily: 'JosefinSans');

  static TextStyle white18LightText = TextStyle(
    fontWeight: FontWeight.w300,
    fontSize: 16,
    color: ColorsDefinitions.white.withOpacity(1),
    fontStyle: FontStyle.normal,
    fontFamily: 'JosefinSans',
  );
//SELECTION
//link-url

  static TextStyle blue14LightText = TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14,
      color: ColorsDefinitions.shapeBlue.withOpacity(1),
      fontStyle: FontStyle.normal,
      fontFamily: 'JosefinSans');
  static TextStyle bodyText14LightText = TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 14,
      color: ColorsDefinitions.bodyText.withOpacity(1),
      fontStyle: FontStyle.normal,
      fontFamily: 'JosefinSans');
  static TextStyle bodyText14LightTextDos = TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: ColorsDefinitions.bodyText.withOpacity(1),
      fontStyle: FontStyle.normal,
      fontFamily: 'JosefinSans');
  static TextStyle bodyText14BlueGenie = TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 14,
      color: ColorsDefinitions.blue_genie.withOpacity(1),
      fontStyle: FontStyle.normal,
      fontFamily: 'JosefinSans');

  static TextStyle bodyText13LightText = TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 13,
      color: ColorsDefinitions.bodyText2.withOpacity(1),
      fontStyle: FontStyle.normal,
      fontFamily: 'JosefinSans');
  static TextStyle bodyText11ightText = TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 11,
      color: ColorsDefinitions.bodyText2.withOpacity(1),
      fontStyle: FontStyle.normal,
      fontFamily: 'JosefinSans');
  static TextStyle titlesOrBody = TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 13,
      color: ColorsDefinitions.bodyText2.withOpacity(1),
      fontStyle: FontStyle.normal,
      fontFamily: 'JosefinSans');
  //13 title labels arma tu tripulacion
  static TextStyle black16SemiLightText = TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 14,
      color: ColorsDefinitions.black.withOpacity(1),
      fontStyle: FontStyle.normal,
      fontFamily: 'JosefinSans');
  static TextStyle black20BoldText = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: ColorsDefinitions.black.withOpacity(1),
      fontStyle: FontStyle.normal,
      fontFamily: 'JosefinSans');
  static TextStyle error20SemiBoldText = const TextStyle(
      fontWeight: FontWeight.w900,
      color: ColorsDefinitions.error,
      fontSize: 20,
      fontFamily: "Josefins Sans - Bold");
  static TextStyle alert20SemiBoldText = const TextStyle(
      fontWeight: FontWeight.w900,
      color: ColorsDefinitions.alert,
      fontSize: 20,
      fontFamily: "Josefins Sans - Bold");
  static TextStyle info20SemiBoldText = const TextStyle(
      fontWeight: FontWeight.w900,
      color: ColorsDefinitions.informative,
      fontSize: 20,
      fontFamily: "Josefins Sans - Bold");
  static TextStyle succes20SemiBoldText = const TextStyle(
      fontWeight: FontWeight.w900,
      color: ColorsDefinitions.shapeGreen,
      fontSize: 20,
      fontFamily: "Josefins Sans - Bold");

}
