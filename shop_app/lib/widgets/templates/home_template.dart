import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/configuration/routes/routes.dart';
import 'package:shop_app/providers/client_provider.dart';
import 'package:shop_app/widgets/molecules/card_molecule.dart';
import 'package:provider/provider.dart';

class HomeTemplate extends StatefulWidget{
  @override
  _HomeTemplateState createState() => _HomeTemplateState();
}

class _HomeTemplateState extends State<HomeTemplate> {


  @override
  Widget build(BuildContext context) {
    final clientProvider = Provider.of<ClientProvider>(context);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CardMolecule(iconData: Icons.storefront,name: "Vender",onPressed: () => {Navigator.pushNamed(context, Routes.tradePage), clientProvider.findlistClient(context)}),
          CardMolecule(iconData: Icons.groups,name: "Clientes",onPressed: () { Navigator.pushNamed(context, Routes.clientPage); clientProvider.findlistClient(context); } ),
          CardMolecule(iconData: Icons.inventory,name: "Productos",onPressed: () => Navigator.pushNamed(context, Routes.productPage),)
        ],
      ),
    );
  }



}
