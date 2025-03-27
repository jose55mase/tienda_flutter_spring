
import 'package:intl/intl.dart'; // for date format


import 'package:flutter/cupertino.dart';
import 'package:shop_app/controllers/product_controller.dart';
import 'package:shop_app/entitys/product_entity.dart';
import 'package:shop_app/services/global_state_shop.dart';
import 'package:shop_app/services/product_service.dart';

class ProductModel {

  ProductController productController = new ProductController();

  Future<List<ProductEntity>> filter (search,BuildContext context) async {
    List<ProductEntity> data = await ProductService().getAllProductServices(context);
    List<ProductEntity> response = data.where((item) => item.toString() == search).toList();

    return response;
  }

  void saveProduct ( GlobalKey<FormState> formKey ) {
    if (formKey.currentState!.validate() ){
      formKey.currentState!.save();
      //print("nombre --> ${productEntity.name}"   );
    }
  }

  void loadProduct ( ProductEntity productEntity, TextEditingController amountController,
      TextEditingController priceController,TextEditingController nameController,TextEditingController barCodeController  ) {
    nameController.text = productEntity.name ?? "";
    priceController.text = productEntity.price.toString();
    amountController.text = productEntity.amount.toString();
    barCodeController.text = productEntity.barCode.toString();
  }

  Future<ProductEntity> editProduct ( GlobalKey<FormState> formKey, ProductEntity productEntity, BuildContext context ) async {
    ProductEntity productEntityResponse = new ProductEntity();
    if (formKey.currentState!.validate() ){
      formKey.currentState!.save();
      productEntityResponse = await productController.editProduct(productEntity, context);
    }
    return productEntityResponse;
  }

  void createProduct ( GlobalKey<FormState> formKey, ProductEntity productEntity, BuildContext context ) async {
    ProductEntity productEntityResponse = new ProductEntity();

    DateFormat isoFormat = DateFormat("yyyy-M-d HH:mm:ssZ");
    productEntity.date = isoFormat.format(DateTime.now());
    productEntity.idShop = GlobalStateShop().id;


    productEntityResponse = await productController.createProduct(productEntity, context);


  }

  Future<List<ProductEntity>> findByBarCode( String barCode ) async {
    List<ProductEntity> response = await productController.serchByBarCode(barCode);
    return response;
  }



}