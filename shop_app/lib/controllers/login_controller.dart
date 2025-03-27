import 'package:flutter/cupertino.dart';
import 'package:shop_app/controllers/shopp_controller.dart';
import 'package:shop_app/entitys/shopp_entity.dart';
import 'package:shop_app/models/login_model.dart';

class LoginController {
  LoginModel _loginModel = new LoginModel();

  Future<bool> logIn(BuildContext context,String email, String passwor){
    return _loginModel.loginShop(context,email, passwor);
  }
}