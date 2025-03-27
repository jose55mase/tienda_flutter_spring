import 'package:flutter/material.dart';
import 'package:shop_app/configuration/routes/routes.dart';
import 'package:shop_app/configuration/styles/colors_definitions.dart';
import 'package:shop_app/controllers/product_controller.dart';
import 'package:shop_app/entitys/product_entity.dart';
import 'package:shop_app/widgets/atoms/product/product_dialog_atoms.dart';
import 'package:shop_app/widgets/molecules/card_molecule.dart';
import 'package:shop_app/widgets/molecules/client_card_molecule.dart';
import 'package:shop_app/widgets/molecules/product_card_molecule.dart';
import 'package:shop_app/widgets/atoms/dialog_atom.dart';
import 'package:shop_app/widgets/organisms/product/product_detail_organisms.dart';
import 'package:shop_app/widgets/organisms/product/product_edit_organisms.dart';

class ProductListMolecule extends StatefulWidget {
  @override
  State<ProductListMolecule> createState() => _ProductListMoleculeState();
}

class _ProductListMoleculeState extends State<ProductListMolecule> {

  List<ProductEntity>  productEntityList = [];
  bool loading  = false;

  getProduct() async {
    List<ProductEntity> response = await ProductController().loadProductController(context);
    setState(() {
      productEntityList = response;
    });

  }

  @override
  void initState() {
    loading = true;
    this.getProduct();
    loading = false;

    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    if(loading) {
      print('respuesta ----> ${productEntityList}');
      return Center(child: CircularProgressIndicator(),);
    }else{
      if(productEntityList.length == 0){
        return Center(child: Card(
          elevation: 1,
          color: ColorsDefinitions.gray_second,
          child: Column(children: [
            Text("NO se encontraron datos en la busqueda")
          ],),
        ));
      }else{
        return Expanded(
          child: GridView.builder(
              scrollDirection: Axis.vertical,
              itemCount: productEntityList == [] ? 0 : productEntityList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 8, mainAxisSpacing: 8),
              itemBuilder: (context, index) =>
                  ProductCardMolecule(
                    iconData: Icons.production_quantity_limits,
                    name: "${productEntityList[index].name}",
                    onPressed: () => DialogAtom(
                      context,
                      content: ProductDetailOrganisms(
                        amount: productEntityList[index].amount.toString(),
                        name: productEntityList[index].name.toString(),
                        categori: productEntityList[index].category.toString(),
                        price: productEntityList[index].price.toString(),
                      ),
                      title: "Detalle Producto",
                      onEdit: () => {
                        showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (BuildContext contex ){
                              return Padding(
                                padding: MediaQuery.of(context).viewInsets,
                                child: SizedBox(
                                  height: 400,
                                  child: Center(
                                    child: ProductEditOrganisms(productEntity: productEntityList[index],),
                                  ),
                                ),
                              );
                            }
                        )},
                    ).dialogBuilder(context),
                    amount: productEntityList[index].amount ?? 0,
                    prices: productEntityList[index].price ?? 0,
                  )
          ),
        );
      }
    }


  }
}