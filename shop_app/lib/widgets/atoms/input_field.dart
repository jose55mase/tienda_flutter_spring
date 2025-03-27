import 'package:flutter/material.dart';
import 'package:shop_app/configuration/styles/colors_definitions.dart';
import 'package:shop_app/configuration/styles/text_styles.dart';
import 'package:shop_app/widgets/atoms/text_area.dart';
import 'custom_text.dart';

/// input con label.

/// ```dart
/// InputField(labelValue:"Nombre",inputValue: "Maria Tabares",typeKeyboard:1,censored: false)
/// ```

class InputField extends StatefulWidget {
  /// texto sobre el input.
  final String? labelValue;
  final ValueChanged<String>? action;
  final TextInputAction textInputAction;
  final ValueChanged<String>? onFieldSubmitted;
  String? initialValue;
  bool? enabled;

  ///valor default.
  final String? inputValue;
  final TextEditingController textEditingController;

  ///numero entero >= 0 y <= 3.
  final int? typeKeyboard;

  /// texto censurado para contraseñas.
  final bool? censored;

  ///numero de lineas para text areas no especificar si censored es true.
  final int? lines;

  ///label bold o normal
  final int? type;

  ///color del label entero 0 para letra black16SemiLightText y 1 para  letra white16SemiLightText.
  final int? color;

  ///numero entero determina el tipo de validacion a efectuar asi:
  ///-1: no validacion
  ///0: validación para email
  ///1: numero de caracteres
  ///
  final int? validationType;

  final FormFieldValidator? validator;

  ///texto cuando la validación no sea exitosa
  final String? validationError;

  InputField(
      {Key? key,
        this.labelValue,
        this.onFieldSubmitted,this.initialValue,
        this.enabled = true,
        this.validator,
        required this.textEditingController,
        this.textInputAction = TextInputAction.go,
        this.action,
        this.inputValue,
        this.typeKeyboard,
        this.censored,
        this.lines,
        this.type,
        this.color,
        this.validationType,
        this.validationError})
      : super(key: key);

  @override
  State<InputField> createState() => _InputField();
}

class _InputField extends State<InputField> {
  late Widget component;
  late TextStyle typeLabel;

  var types = [
    TextInputType.number,
    TextInputType.text,
    TextInputType.emailAddress,
    TextInputType.datetime,
    TextInputType.number
  ];
  bool error = false;

  // void errorState() {
  //   setState(() {
  //     error = true;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    int typeKeyboard = 1;
    int lines = 1;
    bool? censored = false;
    int? color = 0;
    Widget err() {
      return Padding(
        padding: EdgeInsets.only(left: 40, top: 10),
        child: CustomText(
          sentence: widget.validationError!,
          error: true,
          TextStyle: TextStyles.white15LightText,
        ),
      );
    }

    final RegExp emailRegex = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
    if (widget.typeKeyboard != null) {
      typeKeyboard = widget.typeKeyboard!;
    }
    if (widget.lines != null) {
      lines = widget.lines!;
    }
    if (widget.censored != null) {
      censored = widget.censored!;
    }
    if (widget.color == 0) {
      color = 13;
    } else {
      color = 14;
    }
    if (widget.lines != null) {
      component = TextArea(
        validator: widget.validator,
        textEditingController: widget.textEditingController,
        defaultValue: widget.inputValue!,
        typeKeyboard: typeKeyboard,
        onChanged: widget.action,
        maxLines: lines,
        minLines: lines,
      );
    } else {
      component = Padding(
        padding: const EdgeInsets.only(top: 3.0),
        child: Column(children: [
          TextFormField(
              initialValue: widget.initialValue,
              enabled: widget.enabled,
              autofocus: false,
              onFieldSubmitted: widget.onFieldSubmitted,
              textInputAction: widget.textInputAction,
              controller: widget.textEditingController,
              onChanged: widget.action,
              validator: widget.validator,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                contentPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                fillColor: ColorsDefinitions.white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: const BorderSide(
                      color: ColorsDefinitions.borders, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: const BorderSide(
                      color: ColorsDefinitions.shapeBlue, width: 1),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: const BorderSide(
                      color: Color.fromARGB(255, 155, 172, 5), width: 1),
                ),
                border: const OutlineInputBorder(),
                hintText: widget.inputValue!,
              ),
              // controller: controller,
              keyboardType: types[typeKeyboard],
              autocorrect: true,
              obscureText: censored,
              style:
              const TextStyle(fontSize: 13, fontWeight: FontWeight.normal)
            // maxLines: null,
          ),
          if (error)
            Padding(
              padding: EdgeInsets.only(left: 40, top: 10),
              child: CustomText(
                sentence: widget.validationError!,
                error: true,
                TextStyle: TextStyles.white15LightText,
              ),
            ),

          // err(),

          // Visibility(
          //   visible: error,
          //   child: Padding(
          //     padding: EdgeInsets.only(left: 40, top: 10),
          //     child: CustomText(
          //       sentence: widget.validationError!,
          //       error: true,
          //       TextStyle: TextStyles.white15LightText,
          //     ),
          //   ),
          // )
        ]),
      );
    }

    if (widget.type == 0) {
      typeLabel = TextStyles.titlesOrBody13BoldText;
    } else {
      if (color == 0) {
        typeLabel = TextStyles.black16SemiLightText;
      } else {
        typeLabel = TextStyles.white16SemiLightText;
      }
    }
    List<Widget> input;
    if (widget.labelValue != null) {
      input = [
        CustomText(sentence: widget.labelValue!, TextStyle: typeLabel),
        component
      ];
    } else {
      input = [component];
    }
    return Padding(
        padding:
        const EdgeInsets.only(left: 18.0, right: 18.0, top: 10, bottom: 10),
        child: Column(
          children: input,
        ));
  }
}
