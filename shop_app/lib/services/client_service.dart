import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


import 'package:shop_app/configuration/phats.dart' as paths;
import 'package:shop_app/entitys/client_entity.dart';
import 'package:shop_app/entitys/product_entity.dart';
import 'package:shop_app/entitys/sale_entity.dart';
import 'package:shop_app/services/global_state_shop.dart';
import 'package:shop_app/widgets/molecules/response_status_molecule.dart';

class ClientService{

  //final idShop = GlobalStateShop().id;
  final baseUrl = paths.URL_BACKEND;
  ResponseStatusMolecule responseStatusMolecule = new ResponseStatusMolecule();

  Future<List<ClientEntity>> getAll(BuildContext context,int idShop) async {


    var url = Uri.parse('${baseUrl}client/findAll/${idShop}');

    print("Lista de dataos .---> ${url}");
    try {
      final http.Response response =
      await http.get(url, headers: {
        "Accept": "application/json",
        'Content-type': 'application/json',
        "Access-Control-Allow-Origin": "*"
      });
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        return json
            .decode(response.body)['data']
            .map<ClientEntity>((movement) => ClientEntity.fromJson(movement))
            .toList();
      }
      return Future.error(new Exception(
          'error getting sales: {status: ${response.statusCode}, body:${response.body}}'));
    } catch (e) {
      responseStatusMolecule.dialogBuilderErrorServer(context);
      return [];
    }

  }


  Future<ClientEntity> create( ClientEntity clientEntity, BuildContext context) async {
    var url = Uri.parse('${baseUrl}client/create');

    final response =
    await http.post(url, body: jsonEncode( clientEntity.toJson() ), headers: {
      "Accept": "application/json",
      'Content-type': 'application/json',
      "Access-Control-Allow-Origin": "*"
    });
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      responseStatusMolecule.dialogBuilderSuccess(context);
      return ClientEntity.fromJson(json.decode(response.body)['data']);
    }
    responseStatusMolecule.dialogBuilderError(context);
    return Future.error(new Exception(
        'error saving sale: {status: ${response.statusCode}, body:${response.body}}')
    );
  }

}

