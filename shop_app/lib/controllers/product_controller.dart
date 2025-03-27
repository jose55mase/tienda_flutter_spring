import 'package:shop_app/entitys/product_entity.dart';

import 'package:flutter/cupertino.dart';
import 'package:shop_app/models/product_model.dart';
import 'package:shop_app/services/product_service.dart';

class ProductController {

  Future<List<ProductEntity>> loadProductController(BuildContext context) async {
    return await ProductService().getAllProductServices(context);
  }

  Future<List<ProductEntity>> filterProduct (search) async {
    return await ProductService().getAllSame(search);
  }

  Future<ProductEntity> editProduct (ProductEntity productEntity, BuildContext context) async {
    return await ProductService().editProduct(productEntity, context);
  }

  Future<ProductEntity> createProduct (ProductEntity productEntity, BuildContext context) async {
    return await ProductService().createProduct(productEntity, context);
  }

  Future<List<ProductEntity>> serchByBarCode (String barCode) async {
    return await ProductService().searchByBarCode( barCode );
  }

}