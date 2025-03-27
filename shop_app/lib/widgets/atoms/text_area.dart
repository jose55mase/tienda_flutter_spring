import 'package:flutter/material.dart';
import 'package:shop_app/configuration/styles/colors_definitions.dart';

/// text area, debe ser usado desde el widget InputField.

/// ```dart
/// TextArea(minLines:2,maxLines: 5,defaultValue:"Describa detalladamente",typeKeyboard: 0)
/// ```

class TextArea extends StatefulWidget {
  ///lineas con las que se muestra inicialmente
  final int minLines;
  final TextEditingController textEditingController;
  final ValueChanged<String>? onChanged;

  /// si es null crece infinitamente.
  final int maxLines;
  final String defaultValue;
  final validator;

  ///numero entero >= 0 y <= 3.
  final int typeKeyboard;
  const TextArea(
      {Key? key,
        required this.textEditingController,
        required this.minLines,
        required this.defaultValue,
        required this.typeKeyboard,required this.validator,
        required this.maxLines, this.onChanged})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _TextArea();
}

class _TextArea extends State<TextArea> {
  var types = [
    TextInputType.number,
    TextInputType.text,
    TextInputType.emailAddress,
    TextInputType.datetime,
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 7.0),
        child: TextFormField(
          validator: widget.validator,
          onChanged: widget.onChanged,
          controller: widget.textEditingController,
          autovalidateMode: AutovalidateMode.always,
          decoration: InputDecoration(
            filled: true,
            fillColor: ColorsDefinitions.white,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: const BorderSide(
                  color: ColorsDefinitions.disabled, width: 2.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: const BorderSide(
                  color: ColorsDefinitions.shapeBlue, width: 2.5),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide:
              const BorderSide(color: ColorsDefinitions.error, width: 2.5),
            ),
            border: const OutlineInputBorder(),
            hintText: widget.defaultValue,
          ),
          // controller: controller,
          keyboardType: types[widget.typeKeyboard],
          autocorrect: true,

          style: const TextStyle(
              fontSize: 13,
              color: ColorsDefinitions.placeHolder,
              fontWeight: FontWeight.normal),
          maxLines: widget.maxLines,
          minLines: widget.minLines,
        ));
  }
}
