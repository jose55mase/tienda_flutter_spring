import 'package:flutter/material.dart';
import 'package:shop_app/entitys/client_entity.dart';
import 'package:shop_app/entitys/product_entity.dart';
import 'package:shop_app/entitys/sale_entity.dart';
import 'package:shop_app/models/client_model.dart';
import 'package:shop_app/models/product_model.dart';
import 'package:shop_app/models/sales_module.dart';

/// Flutter code sample for [PaginatedDataTable].

class SalesProvider extends ChangeNotifier {

  SalesModule salesModule   = new SalesModule();
  ProductModel productModel = new ProductModel();
  ClientModel clientModel   = new ClientModel();

  bool loading = false;
  List<SaleEntity> _listSales           = [];
  String _filterDate                    = "";
  String _filterDateFinal               = "";
  List<ProductEntity> _listProduct      = [];
  List<ProductEntity> _listProductshop  = [];
  List<SaleEntity> _listSalesFilter     = [];
  int amoutProducts                     = 0;
  int totalPriceProducts                = 0;
  String notify                         = "";

  get listSalesFilter => _listSalesFilter;
  get listProductshop => _listProductshop;
  get listProduct { return _listProduct; }
  List<SaleEntity> get listSales => _listSales;
  String get filterDateInit => _filterDate;
  String get filterDateFinal => _filterDateFinal;
  void set filterDateInit(String date){
    _filterDate = date;
    notifyListeners();
  }
  void set filterDateFinal(String date){
    _filterDateFinal = date;
    notifyListeners();
  }


  addProductInCarAndTotalPrice(ProductEntity product, BuildContext context) async {
    ProductEntity productEdit = product;
    int totalPrice = 0;
    totalPriceProducts = 0;
    if (product.amount! > 0) {

      this._listProductshop = await
          salesModule.sumSameAndPrices(productEdit, _listProductshop,context);
      amoutProducts = this._listProductshop.length;
      this._listProductshop.forEach((item) {
        if (item.sameProduct == null) item.sameProduct = 1;
        totalPrice =  item.price! * item.sameProduct!;
        totalPriceProducts = totalPrice + totalPriceProducts;
      });
    }  else {
      notify = "No tienes productos en el inventario";
    }
    notifyListeners();
  }

  saveAll(BuildContext context, ClientEntity clientEntity, bool statusPay) async {
    double totalPurchased = 0.toDouble();
    loading = true;

    //await Future.delayed(Duration(seconds: 5));

    List<SaleEntity> saleProduct = [];
    saleProduct = await salesModule.saveAll(this._listProductshop, context, clientEntity, statusPay);
    if(clientEntity.name != "") {
      totalPurchased = totalPriceProducts.toDouble();
      clientEntity.totalPurchased = clientEntity.totalPurchased! + totalPurchased;
      await clientModel.save(context, clientEntity);
    }


    amoutProducts = 0;
    totalPriceProducts = 0;
    this._listProductshop = [];
    loading = false;
    notifyListeners();
  }

  saveAllOwe(BuildContext context, ClientEntity clientEntity, bool statusPay) async {
    double totalPurchased = 0.toDouble();
    double oweMonew = 0.toDouble();
    loading = true;
    notifyListeners();
    await Future.delayed(Duration(seconds: 5));

    List<SaleEntity> saleProduct = [];
    saleProduct = await salesModule.saveAll(this._listProductshop, context, clientEntity, statusPay);
    if(clientEntity != "") {
      totalPurchased = totalPriceProducts.toDouble();
      if (!statusPay) {
        oweMonew = totalPurchased;
        clientEntity.oweMoney = oweMonew + clientEntity.oweMoney!;
      }
      await clientModel.save(context, clientEntity);
    }

    amoutProducts = 0;
    totalPriceProducts = 0;
    this._listProductshop = [];
    loading = false;
    notifyListeners();
  }

  deleteProductos(ProductEntity productEntity,BuildContext context) async{
    totalPriceProducts = 0;
    int sum = 0;
    this._listProductshop = await salesModule.deleteProductos(productEntity, _listProductshop, context);
    this._listProductshop.forEach((item) {
      sum = 0;
      if(item.sameProduct != null && item.sameProduct! >= 1) {
        sum = item.sameProduct! * item.price!;
        totalPriceProducts = totalPriceProducts + sum;
      }
    });

    amoutProducts = _listProductshop.length;
    if (amoutProducts == 0) {
      totalPriceProducts = 0;
    }
    notifyListeners();
  }

  findAll(BuildContext context) async {
    _listSales = await salesModule.findAll(context);
    notifyListeners();
  }

  filterClean(BuildContext context) async{
    _listSales = await salesModule.findAll(context);
    notifyListeners();
  }

  filter(BuildContext context,String filterClient,String filterStatus,) async {
    _listSales = await salesModule.filter(filterClient,filterStatus, filterDateInit, filterDateFinal);
    _listSalesFilter = this._listSales;
    notifyListeners();
  }

  searchByBareCode(String res, BuildContext context ) async {
    List<ProductEntity> response = await productModel.findByBarCode(res);
    if(response.isNotEmpty) addProductInCarAndTotalPrice(response[0],context);
  }

  cleanCarProducts(BuildContext context) async {
    _listProductshop.forEach((item) async{
      print('datos ---> ${item.sameProduct}');
      await salesModule.cleanCarProducts(item, context);
      //item.sameProduct = item.sameProduct +
      //await salesModule.cleanCarProducts(productEntity, context)
    });

    _listProductshop   = [];
    totalPriceProducts = 0;
    amoutProducts      = 0;
    notifyListeners();
  }

}
