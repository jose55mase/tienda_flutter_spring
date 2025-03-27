import 'package:flutter/material.dart';
import 'package:shop_app/controllers/product_controller.dart';
import 'package:shop_app/entitys/product_entity.dart';

class ProductProvider with ChangeNotifier {

  ProductController productController = new ProductController();

  String _name              = "Joxe 1";
  int _amout                = 0;
  List<ProductEntity> _list = [];
  bool loading = false;

  int get amoutProduct{
    return this._amout;
  }



  List<ProductEntity> get listProduct {
    return this._list;
  }

  Future loadAndFilterProduct(String search, BuildContext context) async {
    this.loading = true;
    if(search.isEmpty){
      this._list = await productController.loadProductController(context);
    }else{
      this._list = await productController.filterProduct(search);
    }
    this.loading = false;
    notifyListeners();
  }


  //-------------------
  String get name{
    return _name;
  }

  set name( String name ) {
    this._name = name;

    notifyListeners();
  }

}