
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart'; // for date format
import 'package:shop_app/controllers/product_controller.dart';
import 'package:shop_app/entitys/client_entity.dart';
import 'package:shop_app/entitys/product_entity.dart';
import 'package:shop_app/entitys/sale_entity.dart';
import 'package:shop_app/providers/sales_provider.dart';
import 'package:shop_app/services/global_state_shop.dart';
import 'package:shop_app/services/product_service.dart';
import 'package:shop_app/services/sale_service.dart';

class SalesModule {

  List PRODUCTOS                      = ["arros", "Avena","Arina", "Azucar"];
  SaleService saleService             = new SaleService();
  ProductService productService       = new ProductService();
  ProductController productController = new ProductController();
  //SalesProvider salesProvider = new SalesProvider();


  Stream<List<String>> get  getProductos async* {
    final List<String> productos = [];
    for(String producto in PRODUCTOS){
      //await Future.delayed(Duration(seconds: 2));
      productos.add(producto);
      yield productos;
    }
  }

  deleteProductos (ProductEntity productEntity, List<ProductEntity> list, BuildContext context) async {
    var toRemove = [];
    for(ProductEntity producto in list){
      if(producto.id == productEntity.id){
        if(productEntity.sameProduct != null && productEntity.sameProduct! > 1) {
          producto.sameProduct =  producto.sameProduct! - 1;
        }else{
          toRemove.add(producto);
        }
      }
    }
    list.removeWhere( (e) => toRemove.contains(e));
    productEntity.amount = productEntity.amount! + 1;
    await productService.createProduct(productEntity, context);
    return list;
  }

  Future<List<SaleEntity>> saveAll ( List<ProductEntity> productEntity, BuildContext context, ClientEntity clientEntity, bool statusPay) async {
    DateFormat isoFormat = DateFormat("yyyy-M-d HH:mm:ssZ");
    var date = isoFormat.format(DateTime.now());
    List<SaleEntity> saleEntity = [];
    productEntity.forEach((item)=> {
      saleEntity.add(SaleEntity(id: 0,amount: item.sameProduct ?? 1, date: date,idShop: GlobalStateShop().id,
          clientId: clientEntity.id,pay: statusPay,productId: item.id,clientName: clientEntity.name,productName: item.name,
          price: item.price!.toDouble()
      )),
    });
    List<SaleEntity> response = await this.saleService.createAll(saleEntity, context);
    return response;
  }

  Future<List<SaleEntity>> findAll ( BuildContext context  ) async {
     return await this.saleService.getAll(context);
  }

  Map getStatistic(BuildContext context, List<SaleEntity> saleList)   {
    var responseOne = saleList.where((item) => item.pay == true).toList();
    var responseTow = saleList.where((item) => item.pay == false).toList();
    return {"1": responseOne.length, "0": responseTow.length};

  }

  Future<List<SaleEntity>> save ( SaleEntity saleEntity, BuildContext context,List<SaleEntity> saleList) async {
    saleEntity.pay = true;
    saleEntity.idShop = GlobalStateShop().id;
    SaleEntity response = await this.saleService.create(saleEntity, context);
    saleList.forEach((item){
      if( item.id == saleEntity.id  ){
        item.pay  = true;
        return;
      }
    });
    return saleList;
  }

  sumSameAndPrices (ProductEntity productEntity, List<ProductEntity> list,BuildContext context) async{
    bool exists = true;
    for(ProductEntity producto in list){
      if(producto.id == productEntity.id){
        exists = false;
        if( producto.sameProduct == null ) producto.sameProduct = 1;
        producto.sameProduct =  producto.sameProduct!  + 1;
        producto.amount = producto.amount! - 1;
        print('Gusrdadno ');
        await productService.createProduct(producto, context);
      }
    }
    if ( exists ){
      list.add(productEntity);
      productEntity.amount = productEntity.amount! - 1;
      await productService.createProduct(productEntity, context);
    }

    return list;
  }

  Future<List<SaleEntity>> filter(String filterClient, String filterStatus,String filterDate, String filterDateFinal ) async{
    filterClient      = filterClient == "" ? "empty" : filterClient;
    filterStatus      = filterStatus == "" ? "empty" : filterStatus;
    filterDate        = filterDate == "" ? "empty" : filterDate;
    filterDateFinal   = filterDateFinal == "" ? "empty" : filterDateFinal;
    return await saleService.filter(filterClient, filterStatus,filterDate, filterDateFinal);
  }

  cleanCarProducts(ProductEntity productEntity, BuildContext context) async {
    List<ProductEntity> productList = await productController.loadProductController(context);
    ProductEntity productEntityRequest = productList.where((item)  => item.id == productEntity.id).toList()[0];
    print('Data ---> ${productEntityRequest.sameProduct}');
   // productEntityRequest.sameProduct = productEntityRequest.sameProduct! + productEntity.sameProduct!;


    //await productService.createProduct(productEntity, context);
  }




}