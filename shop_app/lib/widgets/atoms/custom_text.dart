import 'package:flutter/material.dart';
import 'package:shop_app/configuration/styles/colors_definitions.dart';

/// Texto plano, hypervinculo y/o capsula de opciones.

/// ```dart
/// CustomText( sentence: "Bienvenide",aligment: Alignment.bottomLeft,onTap: (){print("tap")}), TextStyle: TextStyles.white18BoldText,capsule: false)
/// ```
class CustomText extends StatefulWidget {
  ///Texto que mostrara.
  final String sentence;
  int maxLines;
  final textAlign;

  ///alineamiento del texto.
  final Alignment? aligment;

  ///tipo de estilo aplicado al texto que debe ser tomado de los estilos disponibles en el archivo http://localhost:8080/configurations_styles_text_styles/configurations_styles_text_styles-library.html  ubicado localmente en ...app_uplink\lib\configurations\styles\text_styles.dart.
  ///
  final TextStyle;

  /// encerrar on no en un rectangulo de bordes redondos el texto .
  bool? capsule;
  void Function()? onTap;

  bool? error;

  CustomText(
      {Key? key,
        required this.sentence,
        this.aligment,
        this.maxLines = 6,
        this.textAlign = TextAlign.start,
        this.onTap,
        this.TextStyle,
        this.capsule,
        this.error})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _CustomText();
}

class _CustomText extends State<CustomText> {
  double marginSelect = 0;
  double paddingSelect = 0;
  double borderSelect = 0;
  Color colorSelect = Colors.transparent;
  Color colorBorderSelect = Colors.transparent;
  Alignment aligment = Alignment.centerLeft;
  BorderRadius borderRadius = const BorderRadius.all(Radius.circular(0));

  @override
  Widget build(BuildContext context) {
    if (widget.aligment != null) {
      aligment = widget.aligment!;
    }

    if ((widget.capsule ??= false) == true) {
      marginSelect = 15;
      paddingSelect = 7;
      borderSelect = 0.5;
      colorSelect = Colors.white;
      colorBorderSelect = ColorsDefinitions.placeHolder.withOpacity(1);
      borderRadius = BorderRadius.all(Radius.circular(15));
    }
    if ((widget.error ??= false) == true) {
      borderRadius = const BorderRadius.only(
          bottomRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
          topRight: Radius.circular(10));
      marginSelect = 0;
      paddingSelect = 8;
      borderSelect = 0.5;
      colorSelect = ColorsDefinitions.error2;
      colorBorderSelect = Colors.transparent;
    }

    return Align(
      alignment: aligment,
      child: GestureDetector(
          onTap: widget.onTap,
          child: Container(
            margin: EdgeInsets.all(marginSelect),
            padding: EdgeInsets.all(paddingSelect),
            decoration: BoxDecoration(
              borderRadius: borderRadius,
              border: Border.all(color: colorBorderSelect, width: borderSelect),
              color: colorSelect,
            ),
            child: Text(
              widget.sentence,
              textAlign: widget.textAlign,
              style: widget.TextStyle,
              maxLines: widget.maxLines,
              overflow: TextOverflow.ellipsis,
            ),
          )),
    );
  }
}
