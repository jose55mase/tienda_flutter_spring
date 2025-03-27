import 'package:flutter/material.dart';
import 'package:shop_app/configuration/routes/routes.dart';
import 'package:shop_app/configuration/styles/colors_definitions.dart';
import 'package:shop_app/widgets/atoms/button.dart';
import 'package:shop_app/widgets/molecules/client_list_molecule.dart';
import 'package:shop_app/widgets/molecules/product_list_molecule.dart';
import 'package:shop_app/widgets/organisms/product/product_create_organisms.dart';
import 'package:shop_app/widgets/templates/home_template.dart';
import 'package:shop_app/widgets/templates/product_template.dart';

class ProductPage extends StatelessWidget {
  //const ClientPage();
  final GlobalKey _draggableKey = GlobalKey();


  @override
  Widget build(BuildContext context) {
    //final userDataProvider = Provider.of<UserDataProvider>(context);
    //final initPageProvider = Provider.of<InitPageProvider>(context);

    //final initialController = new InitialController();

    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: PreferredSize(preferredSize: Size.fromHeight(80.0), child:
        AppBar(
          iconTheme: const IconThemeData(color: Color(0xFFF64209)),
          title: Text(
            'Lista de productos',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontSize: 36,
              color: const Color(0xFFF64209),
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: const Color(0xFFF7F7F7),
          elevation: 0,
        )
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ProductTemplate(),
            ProductListMolecule()
          ]
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (BuildContext contex ){
                return Padding(
                  padding: MediaQuery.of(context).viewInsets,
                  child: SizedBox(
                    height: 400,
                    child: Center(
                      child: ProductCreateOrganisms(),
                    ),
                  ),
                );
              }
          );
        },
        backgroundColor: ColorsDefinitions.green,
        child: const Icon(Icons.add,size: 30,),
      )
    );


  }

}

