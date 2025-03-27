
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/configuration/styles/colors_definitions.dart';
import 'package:shop_app/configuration/styles/text_styles.dart';
import 'package:shop_app/widgets/atoms/custom_text.dart';

//info warning succes error
Future<void> ModalInfo(
    {required BuildContext context,
      title,
      description,
      buttonText,
      type,
      pressendHandler}) async {
  return showDialog<void>(
    context: context,
    builder: (_) =>
        _showInfoDialog(title, description, buttonText, type, pressendHandler),
  );
}

Widget _showInfoDialog(String title, String description, String buttonText,
    int type, void Function() pressendHandler) {
  List<dynamic> Style = [
    /*[
      ColorsDefinitions.informative,
      TextStyles.info20SemiBoldText,
      ImageUrl.infoIcon
    ],
    [
      ColorsDefinitions.alert,
      TextStyles.alert20SemiBoldText,
      ImageUrl.alertIcon
    ],
    [
      ColorsDefinitions.shapeGreen,
      TextStyles.succes20SemiBoldText,
      ImageUrl.succesIcon
    ],
    [
      ColorsDefinitions.error,
      TextStyles.error20SemiBoldText,
      ImageUrl.errorIcon
    ],*/
  ];

  Color color = Style[type][0];
  TextStyle textStyle = Style[type][1];
  String image = Style[type][2];

  return AlertDialog(
    elevation: 1,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    title: Row(
      children: [
       /* CustomImage(
          image: image,
          type: 1,
          mesures: [25, 25],
          color: color,
          padding: 2,
        ),*/
        Text(
          title,
          style: textStyle,
        ),
      ],
    ),
    content: Text(
      description,
      style: TextStyles.titlesOrBody16normalText,
    ),
    actions: [
      Padding(
          padding: EdgeInsets.all(20),
          child: CustomText(
            aligment: Alignment.bottomRight,
            sentence: buttonText,
            TextStyle: TextStyles.blueGenie16normal,
            onTap: pressendHandler,
          ))
    ],
  );
}


Future<void> ModalAlertUplink(
    {required BuildContext context, required color,required title,required description,required onPressed, required onPressedClose}) async {
  return showDialog<void>(
      context: context,
      builder: (_) => Container(
        color: Colors.transparent,
        width: double.infinity,
        height: double.infinity,
        child: _showModalAlert(context, color ,title, description,onPressed,onPressedClose),
      )
  );
}

Widget _showModalAlert(BuildContext context,color, String title,String description,onPressed,onPressedClose) {
  return AlertDialog(
    elevation: 1,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    titlePadding: EdgeInsets.all(0),
    title: Container(
      height: 70,
      width: 90,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      child: Row(
        children: [
          Stack(
            children: [
             /* Padding(
                padding: EdgeInsets.only(left: 25, top: 15),
                child: CustomImage(
                  type: 1,
                  color: ColorsDefinitions.shapeGreenInnova,
                  image: ImageUrl.ring,
                  rounded: 0,
                  mesures: [30, 30],
                  aligment: Alignment.topLeft,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 250, top: 65),
                child: CustomImage(
                  angle: 5,
                  type: 1,
                  color: ColorsDefinitions.shapeBlue,
                  image: ImageUrl.ring_half,
                  rounded: 0,
                  mesures: [20, 20],
                  aligment: Alignment.topLeft,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 200, top: 15),
                child: CustomImage(
                  type: 1,
                  color: ColorsDefinitions.alert,
                  image: ImageUrl.circle,
                  rounded: 0,
                  mesures: [13, 13],
                  aligment: Alignment.topLeft,
                ),
              ),*/

              // Padding(
              //   padding: EdgeInsets.only(left: 25, top: 0),
              //   child: CustomImage(
              //     image: image,
              //     type: 0,
              //     mesures: [50, 50],
              //     rounded: 100,
              //     padding: 2,
              //   ),
              // ),
              Padding(
                padding: EdgeInsets.only(left: 36, top: 0),
                child: Container(
                  padding: EdgeInsets.only(left: 16,right: 5),
                  alignment: Alignment.center,
                  width: 200,
                  child: Text(
                    title,
                    style: TextStyles.white24SemiBoldText,
                    maxLines: 2,
                  ),
                ),
              ),
              Positioned(
                  right: 0,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: IconButton(
                      onPressed: onPressedClose,
                      icon: Icon(
                        size: 20,
                        Icons.cancel,
                        color: Colors.white,
                      ),
                    ),
                  )
              )
            ],
          ),
        ],
      ),
    ),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center ,
      children: [

        SizedBox(height: 10),
        Text(
          description,
          style: TextStyles.bodyText14LightText,
          maxLines: 4,
        ),
        SizedBox(height: 30),

        TextButton(
            onPressed: onPressed,
            child: Text(
              "Cerrar",
              style: TextStyles.bodyText14BlueGenie,
              maxLines: 1,
            )),


        SizedBox(height: 5),
      ],
    ),
  );
}
