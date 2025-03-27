import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/configuration/routes/routes.dart';
import 'package:shop_app/configuration/styles/colors_definitions.dart';
import 'package:shop_app/controllers/login_controller.dart';
import 'package:shop_app/entitys/shopp_entity.dart';
import 'package:shop_app/services/global_state_shop.dart';
import 'package:shop_app/widgets/atoms/load_status.dart';
import 'package:shop_app/widgets/molecules/modal_message.dart';
import 'package:shop_app/widgets/organisms/login_organism.dart';

class LoginTemplate extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginTemplate();
  }
}

class _LoginTemplate extends State<LoginTemplate> {

  LoginController loginController = new LoginController();

  bool? _load;
  bool request = false;
  String textWaiting = "";
  TextEditingController textEditingControllerMail = TextEditingController();
  TextEditingController textEditingControllerPassword = TextEditingController();

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    //final changeStatePageProvider = Provider.of<ChangeStatePageProvider>(context);
    //final logingPageProvider = Provider.of<LoginProvider>(context);
    final width = MediaQuery.of(context).size.width;


    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage("assets/logo_png.png"),
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.2), BlendMode.darken),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: Loging(
                    text: "ga",
                    textEditingControllerPassword:
                    textEditingControllerPassword,
                    textEditingControllerMail: textEditingControllerMail,
                    pressedHandler: () async => {
                      textWaiting = "Cargando ...",
                      LoadStatus().loadButton(context, text: textWaiting),
                      if (textEditingControllerPassword.text.length > 0 && textEditingControllerMail.text.length > 0) {
                        request = await loginController.logIn(context,textEditingControllerMail.text, textEditingControllerPassword.text),
                        if (request){
                          Navigator.pushNamed(context, Routes.home),
                        }else {
                          Navigator.of(context).pop(),
                          ModalAlertUplink(
                              onPressedClose: () =>
                                  Navigator.of(context).pop(),
                              context: context,
                              title: "Valida los datos",
                              description:
                              "Usuario incorrecto",
                              color: ColorsDefinitions.alert,
                              onPressed: () => Navigator.of(context).pop()),
                        }
                      } else {
                          Navigator.of(context).pop(),
                          ModalAlertUplink(
                              onPressedClose: () => Navigator.of(context).pop(),
                              context: context,
                              title: "Error ",
                              description:
                              "valida formulario, Los campos estan vacios.",
                              color: ColorsDefinitions.error2,
                              onPressed: () => Navigator.of(context).pop()),
                        }
                    },
                    pressedHandlerGoogle: () async => {
                      //await signInUserGoogle(changeStatePageProvider, context)
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  /*Future<void> signInUserGoogle(ChangeStatePageProvider changeStatePageProvider,
      BuildContext context) async {
    final user = await changeStatePageProvider.loginGoogle();
    if (user == null) {
      LoadStatus().infoDown(
          title: "El email seleccionado no pertenece a Innova.",
          color: ColorsDefinitions.alert,
          icon: Icon(
            Icons.error_outline,
            color: Colors.red,
          ));
    } else {
      LoadStatus().loadButton(context, text: "Cargando ...");
      LoginValidateUserModel().loginUserGoogle(user: user, context: context);
    }
  }

  Future<void> signInUser(BuildContext context) async {
    //final user = await Amplify.Auth.fetchAuthSession();
  }

  void loadLogin() async {
    print("loadLogin");
    _load = true;
    await Future.delayed(const Duration(seconds: 3));
    if (await SessionManager().get("user") != null) {
      GeneralStateUser generalStateUser =
      GeneralStateUser.fromJson(await SessionManager().get("user"));
      await LoginGenerateState()
          .createStateAppSession(context, generalStateUser);
    } else {
      setState(() {
        _load = false;
      });
    }
  }*/
}
