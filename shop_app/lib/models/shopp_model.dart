import 'package:flutter/cupertino.dart';
import 'package:shop_app/entitys/shopp_entity.dart';
import 'package:shop_app/services/shopp_service.dart';

class ShoppModel {
  ShoppService shoppService = new ShoppService();

  Future<ShoppEntity> findByEmailPasswor(BuildContext context, ShoppEntity shoppEntity) {
    return shoppService.findByEmailPasswor(context,shoppEntity);
  }
}