import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/configuration/styles/colors_definitions.dart';
import 'package:shop_app/entitys/product_entity.dart';
import 'package:shop_app/widgets/atoms/dialog_atom.dart';
import 'package:shop_app/widgets/atoms/product/product_dialog_atoms.dart';
import 'package:shop_app/widgets/organisms/product/product_detail_organisms.dart';
import 'package:shop_app/widgets/organisms/product/product_edit_organisms.dart';

class ProductListDataWidget extends StatelessWidget {



  final String id;
  final String date;
  final String concept;
  final String amount;
  final String currency;
  const ProductListDataWidget(
      {required this.id,
        required this.date,
        required this.concept,
        required this.amount,
        required this.currency});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => DialogAtom(
        context,
        content: ProductDetailOrganisms(
          amount: amount.toString(),
          name: concept.toString(),
          categori: "Categoria",
          price: currency.toString(),
        ),
        title: "Detalle Producto",
        onEdit: () => {
          showModalBottomSheet(
              isScrollControlled: true,
            context: context,
            builder: (BuildContext contex ){
             return Padding(
               padding: MediaQuery.of(context).viewInsets,
               child: SizedBox(
                  height: 400,
                  child: Center(
                    child: ProductEditOrganisms(
                      productEntity: ProductEntity(
                        id: int.parse(this.id),
                        name: this.concept,
                        amount: int.parse(this.amount),
                        date: this.date,
                        price: int.parse(this.currency)
                      )
                    ),
                  ),
                ),
             );
            }
          )
        },
      ).dialogBuilder(context),
      child: Card(
        child: ListTile(
          leading: FlutterLogo(size: 72.0),
          title: Text('${this.concept}', style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: ColorsDefinitions.green,
              fontWeight: FontWeight.bold,
            fontSize: 20
          )),
          subtitle:
              Column(
                children: [
                  Text('Precio: \$ ${moneyFormat(this.currency)}'),
                  Text('Fecha: ${this.date} '),
                  Text('Referencia #: ${this.id}'),

                ],
              ),

          trailing: Text(this.amount,style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: ColorsDefinitions.violet,
              fontWeight: FontWeight.bold,
              fontSize: 20
          )),
          isThreeLine: false,
        ),
      ),
    );



  }
  String moneyFormat(String price) {
    if (price.length > 2) {
      var value = price;
      value = value.replaceAll(RegExp(r'\D'), '');
      value = value.replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), ',');
      return value;
    }
    return '0';
  }
}