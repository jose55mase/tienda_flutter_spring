import 'package:flutter/cupertino.dart';
import 'package:shop_app/entitys/shopp_entity.dart';
import 'package:shop_app/models/shopp_model.dart';

class ShoppController {
  ShoppModel shoppModel = new ShoppModel();

  Future<ShoppEntity> findByEmailPasswor(BuildContext context, ShoppEntity shoppEntity) {
    return shoppModel.findByEmailPasswor(context,shoppEntity);
  }
}