class ShoppEntity {
  int? id;
  String? name;
  String? color;
  String? email;
  String? passwor;

  ShoppEntity({this.id, this.name, this.color, this.email, this.passwor});

  ShoppEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    color = json['color'];
    email = json['email'];
    passwor = json['passwor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['color'] = this.color;
    data['email'] = this.email;
    data['passwor'] = this.passwor;
    return data;
  }
}