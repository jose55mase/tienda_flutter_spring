import 'package:flutter/material.dart';
import 'package:shop_app/entitys/client_entity.dart';
import 'package:shop_app/entitys/product_entity.dart';
import 'package:shop_app/entitys/sale_entity.dart';
import 'package:shop_app/models/client_model.dart';
import 'package:shop_app/models/product_model.dart';
import 'package:shop_app/models/sales_module.dart';

/// Flutter code sample for [PaginatedDataTable].

class ClientProvider extends ChangeNotifier {

  ClientModel clientModel = new ClientModel();

  List<ClientEntity> _listClient = [];
  bool loading = false;

  List<ClientEntity> get listClient => this._listClient;



  findlistClient(BuildContext context) async {
    loading = true;
    this._listClient = await clientModel.findAll(context);
    loading = false;
    notifyListeners();
  }

  saveMoney(BuildContext context, int money, ClientEntity clientEntity, List<ClientEntity> list) async {
     this._listClient = await clientModel.saveMoney(context,money, clientEntity, list);
     notifyListeners();
  }

  save(GlobalKey<FormState> formKey, BuildContext context, ClientEntity clientEntity) async {
    if (formKey.currentState!.validate() ){
      formKey.currentState!.save();
      this._listClient = await clientModel.save(context, clientEntity);
    }
    notifyListeners();
  }



}
