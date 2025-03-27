import 'package:shop_app/entitys/product_entity.dart';

import 'package:flutter/cupertino.dart';
import 'package:shop_app/entitys/sale_entity.dart';
import 'package:shop_app/models/product_model.dart';
import 'package:shop_app/models/sales_module.dart';
import 'package:shop_app/services/product_service.dart';

class SaleController {

  Future<List<SaleEntity>> findAll(BuildContext context) async {
    return await SalesModule().findAll(context);
  }




}