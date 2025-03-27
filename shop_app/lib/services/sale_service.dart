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

class SaleService{
  final idShop = GlobalStateShop().id;
  final baseUrl = paths.URL_BACKEND;
  ResponseStatusMolecule responseStatusMolecule = new ResponseStatusMolecule();

  Future<List<SaleEntity>> getAll(/*ProductEntity productEntity*/BuildContext context) async {
    var url = Uri.parse('${baseUrl}sale/findAll/${idShop}');

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
            .map<SaleEntity>((movement) => SaleEntity.fromJson(movement))
            .toList();
      }
      responseStatusMolecule.dialogBuilderError(context);
      return Future.error(new Exception(
          'error getting sales: {status: ${response.statusCode}, body:${response.body}}'));
    } on SocketException {
      responseStatusMolecule.dialogBuilderErrorServer(context);
      return [];
    }

  }

  Future<List<SaleEntity>> getAllByClientId(BuildContext context, ClientEntity clientEntity ) async {
    int clientId = clientEntity.id!;
    var url = Uri.parse('${baseUrl}sale/findByClientId/${clientId}');
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
            .map<SaleEntity>((movement) => SaleEntity.fromJson(movement))
            .toList();
      }
      responseStatusMolecule.dialogBuilderError(context);
      return Future.error(new Exception(
          'error getting sales: {status: ${response.statusCode}, body:${response.body}}'));
    } on SocketException {
      responseStatusMolecule.dialogBuilderErrorServer(context);
      return [];
    }

  }

  Future<List<SaleEntity>> createAll( List<SaleEntity> saleEntity, BuildContext context) async {
    var url = Uri.parse('${baseUrl}sale/createAll');

    final response =
    await http.post(url, body: jsonEncode( saleEntity.map((item)=> item.toJson()).toList() ), headers: {
      "Accept": "application/json",
      'Content-type': 'application/json',
      "Access-Control-Allow-Origin": "*"
    });
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      Navigator.of(context).pop();
      responseStatusMolecule.dialogBuilderSuccess(context);
      return json
          .decode(response.body)['data']
          .map<SaleEntity>((movement) => SaleEntity.fromJson(movement))
          .toList();
    }
    responseStatusMolecule.dialogBuilderError(context);
    return Future.error(new Exception(
        'error getting sale: {status: ${response.statusCode}, body:${response.body}}'));

  }

  Future<SaleEntity> create( SaleEntity saleEntity, BuildContext context) async {
    var url = Uri.parse('${baseUrl}sale/create');

    final response =
    await http.post(url, body: jsonEncode( saleEntity.toJson() ), headers: {
      "Accept": "application/json",
      'Content-type': 'application/json',
      "Access-Control-Allow-Origin": "*"
    });
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      responseStatusMolecule.dialogBuilderSuccess(context);
      return SaleEntity.fromJson(json.decode(response.body)['data']);
          //.map<SaleEntity>((movement) => SaleEntity.fromJson(movement))
          //.toList();
    }
    responseStatusMolecule.dialogBuilderError(context);
    return Future.error(new Exception(
        'error saving sale: {status: ${response.statusCode}, body:${response.body}}')
    );

  }

  Future<List<SaleEntity>> filter(String nameClient,String status, String filterDate, String filterDateFinal) async {
    var url = Uri.parse('${baseUrl}sale/filter/${status}/${nameClient}/${filterDate}/${filterDateFinal}');

    final response =
        await http.post(url, headers: {
      "Accept": "application/json",
      'Content-type': 'application/json',
      "Access-Control-Allow-Origin": "*"
    });
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');


    if (response.statusCode == 200) {
      ///Navigator.of(context).pop();
      //responseStatusMolecule.dialogBuilderSuccess(context);
      return json
          .decode(response.body)['data']
          .map<SaleEntity>((movement) => SaleEntity.fromJson(movement))
          .toList();
    }


    //responseStatusMolecule.dialogBuilderError(context);
    return Future.error(new Exception(
        'error saving sale: {status: ${response.statusCode}, body:${response.body}}')
    );
  }

}

