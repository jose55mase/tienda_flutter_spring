import 'package:flutter/material.dart';
import 'package:shop_app/configuration/routes/routes.dart';
import 'package:shop_app/configuration/styles/colors_definitions.dart';
import 'package:shop_app/entitys/client_entity.dart';
import 'package:shop_app/providers/client_provider.dart';
import 'package:shop_app/utils.dart';
import 'package:shop_app/widgets/atoms/modal_general_atom.dart';
import 'package:shop_app/widgets/molecules/client_card_molecule.dart';
import 'package:shop_app/widgets/molecules/product_card_molecule.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/widgets/templates/sale_template.dart';

class ClientListMolecule extends StatelessWidget {

  ModalGeneralAtom modalGeneralAtom = new ModalGeneralAtom();
  final sendMoney = TextEditingController();
  final List<ClientEntity> list;
  final Widget child;
  int sendMonet = 0;
  final bool showClient;

  ClientListMolecule({super.key, required this.list, required this.child,  this.showClient=true});

  @override
  Widget build(BuildContext context) {
    final clientProvider = Provider.of<ClientProvider>(context);

    if(list.length == 0){
      return Center(child: Card(
        elevation: 1,
        color: ColorsDefinitions.gray_second,
        child: Container(
          height: 100,
          width: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add_alert),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("No se encontraron datos para mostrar"),
            )
          ],),
        ),
      ));
    }

    return GridView.builder(
        itemCount: list.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 8, mainAxisSpacing: 8),
        itemBuilder: (context, index) =>
            InkWell(
              child: ClientCardMolecule(
                address: "${list[index].address}",
                phone: "${list[index].phone}",
                iconData: Icons.boy,
                name: "${list[index].name}",
                oweMoney: list[index].oweMoney!.toDouble(),
                totalPurchased: list[index].totalPurchased!.toDouble(),
              ),
              onTap: (){
                if( this.showClient ) {
                  modalGeneralAtom.dialogBuilder(context, width: 300,height: 550,
                      content: StatefulBuilder(
                          builder: (BuildContext context, StateSetter stateChange) {
                            return Container(
                              child: Column(
                                children: [
                                  Column(
                                    children: [
                                      Text("${list[index].phone}", style: TextStyle(
                                        fontSize: 20,),),
                                      Divider(),
                                      Text("${list[index].address}", style: TextStyle(
                                          fontSize: 20),),
                                      Divider(),
                                      Container(
                                        width: 150,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(100),
                                          color: ColorsDefinitions.green,
                                        ),
                                        child: Center(child: Row(children: [
                                          SizedBox(width: 5,),
                                          Icon(Icons.monetization_on,),
                                          Text("${Utils.formatPriceCOL(
                                              list[index].totalPurchased!.toInt())}")
                                        ],)),
                                      ),
                                      SizedBox(height: 10,),
                                      Container(
                                        width: 150,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(100),
                                          color: ColorsDefinitions.red,
                                        ),
                                        child: Center(child: Row(children: [
                                          SizedBox(width: 5,),
                                          Icon(Icons.monetization_on,),
                                          Text("${Utils.formatPriceCOL(
                                              list[index].oweMoney!.toInt()!)}")
                                        ],)),
                                      ),
                                      TextFormField(
                                        keyboardType: TextInputType.number,
                                        onSaved: (value) {
                                          this.sendMonet = int.parse(value!);
                                        },
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return "llena este campo";
                                          }
                                        },
                                        controller: sendMoney,
                                      ),
                                      TextButton(onPressed: () => {
                                        stateChange((){
                                          clientProvider.saveMoney(context, int.parse(sendMoney.text),list[index], list);
                                        })
                                      }, child: const Text("Enviar dinero",
                                        style: TextStyle(
                                            color: ColorsDefinitions.orange),)
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            );
                          }
                      )
                      ,title: list[index].name);
                }else{
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SaleTemplate(clientEntity: list[index])),);
                }
              },
            )
    );
  }
}