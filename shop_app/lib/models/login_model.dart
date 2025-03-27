import 'package:flutter/cupertino.dart';
import 'package:shop_app/entitys/shopp_entity.dart';
import 'package:shop_app/services/global_state_shop.dart';
import 'package:shop_app/services/shopp_service.dart';

class LoginModel {
  ShoppService shoppService = new ShoppService();

  Future<bool> loginShop( BuildContext context, String email, String passwor ) async {
    ShoppEntity response = await shoppService.findByEmailPasswor(context, ShoppEntity(id: 0,email: email, passwor: passwor));
    if(response.id! > 0) {
      GlobalStateShop().updateId(response.id!);
      GlobalStateShop().updateName(response.name!);
      print('--------------> ${GlobalStateShop().id}');
      return true;
    }else{
      return false;
    }
  }
}