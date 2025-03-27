import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


import 'package:shop_app/configuration/phats.dart' as paths;
import 'package:shop_app/entitys/product_entity.dart';
import 'package:shop_app/services/global_state_shop.dart';
import 'package:shop_app/widgets/molecules/response_status_molecule.dart';

class ProductService{
  final idShop = GlobalStateShop().id;
  final baseUrl = paths.URL_BACKEND;
  ResponseStatusMolecule responseStatusMolecule = new ResponseStatusMolecule();

  Future<List<ProductEntity>> getAllProductServices(/*ProductEntity productEntity*/ BuildContext context) async {

    print('Data validando id --> ${idShop}');

    var url = Uri.parse('${baseUrl}product/findAll/${idShop}');

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
          .map<ProductEntity>((movement) => ProductEntity.fromJson(movement))
          .toList();
    }
    return Future.error(
        new Exception(
        'error getting movements: {status: ${response.statusCode}, body:${response.body}}'));
  }

  Future<List<ProductEntity>> getAllSame( String search ) async {
    var url = Uri.parse('${baseUrl}product/findAllBySame/${search}/${idShop}');

    final response =
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
          .map<ProductEntity>((movement) => ProductEntity.fromJson(movement))
          .toList();
    }
    return Future.error(new Exception(
        'error getting product: {status: ${response.statusCode}, body:${response.body}}'));

  }


  Future<ProductEntity> editProduct( ProductEntity productEntity, BuildContext context ) async {
    var url = Uri.parse('${baseUrl}product/edit');

    final response =
    await http.post(url, body: jsonEncode( productEntity.toJson() ), headers: {
      "Accept": "application/json",
      'Content-type': 'application/json',
      "Access-Control-Allow-Origin": "*"
    });
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      return ProductEntity.fromJson(json.decode(response.body)['data']);
    }
    return Future.error(new Exception(
        'error getting product: {status: ${response.statusCode}, body:${response.body}}'));

  }

  Future<ProductEntity> createProduct( ProductEntity productEntity, BuildContext context ) async {
    var url = Uri.parse('${baseUrl}product/create');

    final response =
    await http.post(url, body: jsonEncode( productEntity.toJson() ), headers: {
      "Accept": "application/json",
      'Content-type': 'application/json',
      "Access-Control-Allow-Origin": "*"
    });
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      return ProductEntity.fromJson(json.decode(response.body)['data']);
    }
    return Future.error(new Exception(
        'error getting product: {status: ${response.statusCode}, body:${response.body}}'));

  }


  Future<List<ProductEntity>> searchByBarCode( String barCode ) async {
    var url = Uri.parse('${baseUrl}product/findBarCode/${barCode}/${idShop}');

    final response =
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
          .map<ProductEntity>((movement) => ProductEntity.fromJson(movement))
          .toList();
    }
    return Future.error(new Exception(
        'error getting product: {status: ${response.statusCode}, body:${response.body}}'));

  }
}

