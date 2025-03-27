class SaleEntity {
  int? id;
  String? date;
  int? productId;
  String? productName;
  int? amount;
  int? clientId;
  String? clientName;
  bool? pay;
  double? price;
  int? idShop;

  SaleEntity(
      {this.id,
        this.date,
        this.productId,
        this.productName,
        this.amount,
        this.clientId,
        this.clientName,
        this.pay,
        this.price,
        this.idShop
      });

  SaleEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    productId = json['productId'];
    productName = json['productName'];
    amount = json['amount'];
    clientId = json['clientId'];
    clientName = json['clientName'];
    pay = json['pay'];
    price = json['price'];
    idShop = json['idShop'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['productId'] = this.productId;
    data['productName'] = this.productName;
    data['amount'] = this.amount;
    data['clientId'] = this.clientId;
    data['clientName'] = this.clientName;
    data['pay'] = this.pay;
    data['price'] = this.price;
    data['idShop'] = this.idShop;
    return data;
  }
}