
import 'package:flutter/material.dart';
import 'package:shop_app/configuration/styles/text_styles.dart';
import 'package:shop_app/services/global_state_shop.dart';
import 'package:shop_app/widgets/atoms/input_field.dart';
import 'package:shop_app/widgets/molecules/login/login_button.dart';
import '../atoms/custom_text.dart';

class Loging extends StatelessWidget {
  final GestureTapCallback? onTap;
  final text;
  final TextEditingController textEditingControllerPassword;
  final TextEditingController textEditingControllerMail;

  //interfaz padres o estudiantes
  final pressedHandler;
  final pressedHandlerGoogle;
  const Loging(
      {required this.text,
        required this.pressedHandler,
        this.onTap,
        required this.textEditingControllerPassword,
        required this.textEditingControllerMail,
        required this.pressedHandlerGoogle});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    bool visibilityLabel;

    // interfaz estudiantes
    // if (type == 0) {
    //   visibilityLabel = true;
    // } else {
    //   visibilityLabel = false;
    // }
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //UPLINK logo
           /* Padding(
              padding: const EdgeInsets.only(top: 10, left: 25),
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 3,
                height: 100,
                child: CustomImage(
                  image: ImageUrl.uplink,
                  rounded: 0,
                  type: 1,
                  color: ColorsDefinitions.white,
                ),
              ),
            ),*/
            Padding(
              padding: EdgeInsets.only(top: 40),
              child: SizedBox(
                width: 240.0,
                child: CustomText(
                    sentence: " Tu tienda ",
                    textAlign: TextAlign.center,
                    aligment: Alignment.center,
                    TextStyle: TextStyles.white25BoldText),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 60),
              child: CustomText(
                  sentence: " Inicio de Sesion ",
                  textAlign: TextAlign.center,
                  aligment: Alignment.center,
                  TextStyle: TextStyles.white40SemiLightText),
            ),
            // Inputs ----
            Padding(
              padding: EdgeInsets.only(top: 60),
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.95,
                  child: Column(
                    children: [
                      InputField(
                        textEditingController: textEditingControllerMail,
                        action: (value) => {},
                        inputValue: "Ingresa tu correo",
                        labelValue: "Correo electronico"   //LoginDictionary.user_field,
                      ),
                      InputField(
                        textEditingController: textEditingControllerPassword,
                        action: (value) => {},
                        inputValue: "Ingresa tu contraseña",
                        labelValue: "Contraseña",  //LoginDictionary.password_field,
                        censored: true,

                        validationType: 1,
                            validationError:
                                "Por favor ingrese una contraseña de 5 o mas caracteres",
                      ),
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.85,
                height: 50,
                child: LoginButton(
                    text: "Iniciar sesion",  //LoginDictionary.btn_text_into,
                    pressedHandler: pressedHandler),
              ),
            ),
            /*Padding(
              padding: const EdgeInsets.only(top: 20),
              child: LoginGoogleButton(
                text: LoginDictionary.button_google_text,
                pressedHandler: pressedHandlerGoogle,
                textHeader: LoginDictionary.button_google_header_text,
                textColor: ColorsDefinitions.shapeBlue,
                textHeaderColor: ColorsDefinitions.white,
                color: ColorsDefinitions.white,
              ),
            ),*/
            /*Padding(
              padding: const EdgeInsets.only(top: 20),
              child: SizedBox(
                height: 50,
                child: CustomImage(
                  image: ImageUrl.by_innova_schools,
                  rounded: 0,
                  type: 1,
                  mesures: [350, 350],
                  color: ColorsDefinitions.white,
                ),
              ),
            ),*/
          ],
        ),
      ),
    );
  }

  is_valid(validate) {
    if (validate!) {
      return () => {pressedHandler, print("you are in")};
    } else {
      return null;
    }
  }
}
