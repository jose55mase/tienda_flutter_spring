

class ProductEntity {
  int? id;
  int? price;
  String? date;
  int? amount;
  String? name;
  String? category;
  String? barCode;
  int? sameProduct;
  int? idShop;

  ProductEntity(
      {this.id, this.price, this.date, this.amount, this.name, this.category, this.barCode, this.sameProduct, this.idShop});

  ProductEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    date = json['date'];
    amount = json['amount'];
    name = json['name'];
    category = json['category'];
    barCode = json['barCode'];
    sameProduct = json['sameProduct'];
    idShop = json['idShop'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['price'] = this.price;
    data['date'] = this.date;
    data['amount'] = this.amount;
    data['name'] = this.name;
    data['category'] = this.category;
    data['barCode'] = this.barCode;
    data['sameProduct'] = this.sameProduct;
    data['idShop'] = this.idShop;
    return data;
  }
}