
import 'package:flutter/cupertino.dart';
import 'package:shop_app/entitys/client_entity.dart';
import 'package:shop_app/entitys/sale_entity.dart';
import 'package:shop_app/services/client_service.dart';
import 'package:shop_app/services/global_state_shop.dart';
import 'package:shop_app/services/sale_service.dart';

class ClientModel {

  ClientService clientService = new ClientService();
  SaleService saleService     = new SaleService();

  Future<List<ClientEntity>> findAll (BuildContext context) async {
    List<ClientEntity> response = await clientService.getAll(context, GlobalStateShop().id);
    return response;
  }

   saveMoney(BuildContext context, int money, ClientEntity clientEntity, List<ClientEntity> list ) async {
     clientEntity.oweMoney = clientEntity.oweMoney! - money;
     clientEntity.totalPurchased = clientEntity.totalPurchased! + money;
     this.payAllOweMoney(clientEntity, context);
     await this.clientService.create(clientEntity, context);
     list = await clientService.getAll(context,GlobalStateShop().id);
     return list;
  }

  save(BuildContext context, ClientEntity clientEntity) async {
    clientEntity.idShop = GlobalStateShop().id;
    ClientEntity request = await this.clientService.create(clientEntity, context);
    List<ClientEntity> response = await clientService.getAll(context,GlobalStateShop().id);
    return response;
  }

  payAllOweMoney ( ClientEntity clientEntity, BuildContext context ) async {
    if (clientEntity.oweMoney == 0 ){
      List<SaleEntity> list = await this.saleService.getAllByClientId(context, clientEntity);
      list.forEach((item) {
        item.pay = true;
      });
      await this.saleService.createAll(list, context);
    }
  }



}