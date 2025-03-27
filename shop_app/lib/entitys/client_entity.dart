class ClientEntity {
  int? id;
  int? idShop;
  String? name;
  String? phone;
  String? address;
  double? oweMoney;
  double? totalPurchased;

  ClientEntity(
      {this.id,
        this.name,
        this.phone,
        this.idShop,
        this.address,
        this.oweMoney,
        this.totalPurchased});

  ClientEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    idShop = json['idShop'];
    address = json['address'];
    oweMoney = json['oweMoney'];
    totalPurchased = json['totalPurchased'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['idShop'] = this.idShop;
    data['address'] = this.address;
    data['oweMoney'] = this.oweMoney;
    data['totalPurchased'] = this.totalPurchased;
    return data;
  }
}