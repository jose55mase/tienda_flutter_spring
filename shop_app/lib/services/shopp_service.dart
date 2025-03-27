import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


import 'package:shop_app/configuration/phats.dart' as paths;
import 'package:shop_app/entitys/product_entity.dart';
import 'package:shop_app/entitys/sale_entity.dart';
import 'package:shop_app/entitys/shopp_entity.dart';
import 'package:shop_app/services/navigation_service_context.dart';
import 'package:shop_app/widgets/molecules/response_status_molecule.dart';

class ShoppService{


  final baseUrl = paths.URL_BACKEND;
  ResponseStatusMolecule responseStatusMolecule = new ResponseStatusMolecule();

  Future<ShoppEntity> findByEmailPasswor(BuildContext context, ShoppEntity shoppEntity ) async {
    var url = Uri.parse('${baseUrl}shop/findByUserAndPassword');



    print("URL testing---> ${url}");



    try {
      final http.Response response =
      await http.post(url,body: jsonEncode( shoppEntity.toJson() ), headers: {
        "Accept": "application/json",
        'Content-type': 'application/json',
        "Access-Control-Allow-Origin": "*"
      });
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {

        return  ShoppEntity.fromJson(json.decode(response.body)['data']);
      }
      Navigator.pop(context);
      responseStatusMolecule.dialogBuilderError(context);
      return Future.error(new Exception(
          'error getting sales: {status: ${response.statusCode}, body:${response.body}}'));
    } catch (e) {
      Navigator.pop(context);
      responseStatusMolecule.dialogBuilderErrorServer(context);
      return ShoppEntity();
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

