import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/configuration/styles/colors_definitions.dart';

import 'package:shop_app/providers/product_provider.dart';
import 'package:shop_app/providers/sales_provider.dart';
import 'package:shop_app/utils.dart';
import 'package:shop_app/widgets/molecules/response_status_molecule.dart';

class ProductListboxOrganisms extends StatelessWidget {
  ResponseStatusMolecule responseStatusMolecule = new ResponseStatusMolecule();
  Color color = Colors.white;

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final salesProvider = Provider.of<SalesProvider>(context);

    return Visibility(
      visible: !salesProvider.loading,
      replacement: CircularProgressIndicator(),
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: productProvider.listProduct.length,
          itemBuilder: (context, index) {
            color = ColorsDefinitions.gray_second;
            if (productProvider.listProduct[index].amount! >= 0 &&
                productProvider.listProduct[index].amount! <= 5) {
              color = ColorsDefinitions.red;
            }
            if (productProvider.listProduct[index].amount! >= 5 &&
                productProvider.listProduct[index].amount! <= 10) {
              color = ColorsDefinitions.yellow;
            }

            return Padding(
              padding: const EdgeInsets.all(3.0),
              child: Material(
                elevation: 2,
                child: ListTile(

                    tileColor: color,
                    title: Text(
                        productProvider.listProduct[index].name.toString()),
                    leading: Container(
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      width: 80,
                      child: Column(
                        children: [
                          Icon(
                            Icons.monetization_on,
                            color: Colors.amber,
                          ),
                          Expanded(
                              child: Text(
                            Utils.formatPriceCOL(
                                    productProvider.listProduct[index].price!)
                                .toString(),
                            style: TextStyle(fontSize: 15),
                          )),
                        ],
                      ),
                    ),
                    subtitle: Row(
                      children: [
                        Icon(
                          Icons.qr_code_2_outlined,
                        ),
                        Expanded(
                          child: Text(
                            "${productProvider.listProduct[index].barCode}",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      onPressed: () => {
                        salesProvider.addProductInCarAndTotalPrice(
                            productProvider.listProduct[index], context),
                        if (salesProvider.notify.length > 0)
                          {
                            responseStatusMolecule.dialogBuilderCustomer(
                                context,
                                icon: Icons.error_outline,
                                descriptin: salesProvider.notify),
                            salesProvider.notify = ""
                          }
                      },
                      icon: Icon(
                        Icons.check,
                        color: Colors.green,
                      ),
                    )),
              ),
            );
          }),
    );
  }
}
