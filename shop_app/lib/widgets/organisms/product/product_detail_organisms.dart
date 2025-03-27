import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/configuration/routes/routes.dart';
import 'package:shop_app/widgets/molecules/card_molecule.dart';

class ProductDetailOrganisms extends StatelessWidget{

  final String name;
  final String price;
  final String categori;
  final String amount;

  const ProductDetailOrganisms({super.key, required this.name, required this.price, required this.categori, required this.amount});

  @override
  Widget build(BuildContext context) {
    //final mainPageProvider = Provider.of<MainPageProvider>(context);

    return SingleChildScrollView(
      //scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(this.name),
              Text(this.amount),
              Text("\$ ${this.price} "),
              Text(this.categori),
              ClipOval(
                child: SizedBox(
                    width: 46,
                    height: 46,
                    child: Icon(
                      Icons.shopping_cart_sharp,
                      size: 25,
                    )
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
