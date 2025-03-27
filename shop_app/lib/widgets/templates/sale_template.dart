import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:rive/rive.dart';
import 'package:shop_app/configuration/enums/enum_response_status.dart';
import 'package:shop_app/entitys/client_entity.dart';
import 'package:shop_app/utils.dart';
import 'package:shop_app/widgets/molecules/response_status_molecule.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';
import 'package:shop_app/configuration/styles/colors_definitions.dart';
import 'package:shop_app/configuration/styles/text_styles.dart';
import 'package:shop_app/models/sales_module.dart';
import 'package:shop_app/providers/sales_provider.dart';
import 'package:shop_app/widgets/organisms/product/product_listbox_organisms.dart';
import 'package:shop_app/providers/product_provider.dart';
import 'package:provider/provider.dart';

@immutable
class SaleTemplate extends StatelessWidget {
  ResponseStatusMolecule responseStatusMolecule = new ResponseStatusMolecule();

  final searchController     = TextEditingController();
  SalesModule salesModule    = SalesModule();
  dynamic clientEntity;

  SaleTemplate({super.key, this.clientEntity="",});

  @override
  Widget build(BuildContext context) {

    final productProvider = Provider.of<ProductProvider>(context);
    final salesProvider   = Provider.of<SalesProvider>(context);



    if( clientEntity != "" ){
      clientEntity = clientEntity as ClientEntity;
    }else{
      clientEntity = ClientEntity(name: "",id: 0);
    }

    return Scaffold(

        appBar: PreferredSize(preferredSize: Size.fromHeight(80.0), child:
        AppBar(
          iconTheme: const IconThemeData(color: Color(0xFFF64209)),
          title: Container(
            child: Row(
              children: [
                Text(
                  'Caja ',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontSize: 36,
                    color: const Color(0xFFF64209),
                    fontWeight: FontWeight.bold,
                  ),
                ),

              ],
            ),
          ),
          backgroundColor: const Color(0xFFF7F7F7),
          elevation: 0,
        )
        ),
        body: Stack(
          children: [

            Padding(
              padding: const EdgeInsets.only(top: 200),
              child: SvgPicture.asset(
                'assets/shopSale.svg',
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
            ),


            Container(
              padding: EdgeInsets.only(right:100),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Visibility(
                            visible: clientEntity.name != "",
                            replacement: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(children: [
                                Icon(Icons.person,),
                                Text("Sin registrar cliente",style: TextStyle(fontSize: 17),textAlign: TextAlign.center,),
                              ],
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Icon(Icons.person,),
                                  Text(clientEntity.name ?? "",style: TextStyle(fontSize: 17,),),
                                ],
                              ),
                            ),
                          ),
                          TextButton(onPressed: (){salesProvider.cleanCarProducts(context);}, child: Row(
                            children: [Icon(Icons.cleaning_services,color: Colors.red,), Text(" Limpiar Carro")],
                          ))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: TextButton(
                              child: Row(
                                children: [
                                  Text("Buscar por codigo"),
                                  Icon(Icons.qr_code_2_rounded),
                                ],
                              ),
                              onPressed: () async {
                                //responseStatusMolecule.dialogBuilderSuccess(context);
                                String? res = await SimpleBarcodeScanner.scanBarcode(
                                  context,
                                  barcodeAppBar: const BarcodeAppBar(
                                    appBarTitle: 'Test',
                                    centerTitle: false,
                                    enableBackButton: true,
                                    backButtonIcon: Icon(Icons.arrow_back_ios),
                                  ),
                                  isShowFlashIcon: true,
                                  delayMillis: 2000,
                                  cameraFace: CameraFace.back,
                                );
                                var response = await salesProvider.searchByBareCode(res as String, context);
                                if(response.status == EnumResponseStatus.EMPTY.status) {
                                  responseStatusMolecule.dialogBuilderEmpty(context);
                                }
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: TextButton(
                              child: Row(
                                children: [
                                  Text("Buscar en catalogo"),
                                  Icon(Icons.search,size: 35,),
                                ],
                              ),
                              onPressed: ()=>{
                              _dialogBuilder(context, productProvider),
                              productProvider.loadAndFilterProduct("",context),
                            }, ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
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
                              Text("${Utils.formatPriceCOL(salesProvider.totalPriceProducts)}")
                            ],)),
                          ),
                          Container(

                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: ColorsDefinitions.green,
                            ),
                            child: Center(child: Text("${salesProvider.amoutProducts}",style: TextStyle(fontSize: 17),textAlign: TextAlign.center,)),
                          ),
                        ],
                      ),
                    ],
                  )

                  ,Expanded(
                      child: SizedBox(
                        height: 100,
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: salesProvider.listProductshop.length,
                            itemBuilder: (_, i){
                              return Card(
                                child: ListTile(
                                  leading: HugeIcon(
                                    icon: HugeIcons.strokeRoundedAlbumNotFound01,
                                    color: Colors.green,
                                    size: 50.0,
                                  ),
                                  title: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Icon(Icons.production_quantity_limits),
                                          Expanded(
                                            child: Container(
                                                width: 350,
                                                child: Text(salesProvider.listProductshop[i].name.toString(),overflow: TextOverflow.ellipsis,)),
                                          ),
                                          Spacer(),
                                          Material(
                                              borderRadius: const BorderRadius.all(Radius.circular(100)),
                                              elevation: 2,
                                              child: IconButton(onPressed: ()=>{
                                                salesProvider.addProductInCarAndTotalPrice(salesProvider.listProductshop[i],context)
                                              }, icon: Icon(Icons.add,color: Colors.green,))
                                          ),
                                          Spacer(),
                                          Visibility(
                                            visible: (salesProvider.listProductshop[i].sameProduct != null && salesProvider.listProductshop[i].sameProduct! > 1),
                                            child: Container(
                                              width: 40,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.all(Radius.circular(100)),
                                                  color: Colors.blue
                                              ),
                                              child: Text("${salesProvider.listProductshop[i].sameProduct}",style: TextStyle(fontSize: 20.0,color: Colors.white),textAlign: TextAlign.center,),
                                            ),
                                          )
                                        ],
                                      ),
                                      Divider()
                                    ],
                                  ),
                                  subtitle:Row(
                                    children: [
                                      Icon(Icons.qr_code_2_outlined),
                                      Text('${salesProvider.listProductshop[i].barCode}'),
                                      Spacer(),
                                      Icon(Icons.monetization_on,color: Colors.amber,),
                                      Text('${salesProvider.listProductshop[i].price}')
                                    ],
                                  ),
                                  trailing: IconButton(
                                    onPressed:()=>{salesProvider.deleteProductos(salesProvider.listProductshop[i],context),},
                                    icon: Icon(Icons.restore_from_trash_outlined),color: Colors.red,),
                                  isThreeLine: true,
                                ),
                              );
                            }
                        ),
                      )
                  )

                ],
              ),
            ),
          ],
        ),
        floatingActionButton: Stack(
          children: <Widget>[

            Visibility(
              visible: clientEntity.name != "",
              child: Padding(
                padding: const EdgeInsets.only(left: 31),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: FloatingActionButton(
                    heroTag: "oo1",
                    onPressed: () async {
                      if(salesProvider.listProductshop.isEmpty){
                        responseStatusMolecule.dialogBuilderCustomer(context,descriptin: "No puedes esperar un proceso si no tienes ningun producto en caja",icon: Icons.add_business);
                      }else{
                        responseStatusMolecule.dialogBuilderLoading(context);
                        await salesProvider.saveAllOwe( context, clientEntity, false);
                        //Navigator.pop(context);
                      }
                    },
                    child: const Icon(Icons.add_business_rounded,size: 30,color: ColorsDefinitions.orange,),),
                ),
              ),
            ),

            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                heroTag: "oo2",
                onPressed: () async {
                  if(salesProvider.listProductshop.isEmpty){
                    responseStatusMolecule.dialogBuilderCustomer(context,descriptin: "No puedes vender si no tienes ningun producto en caja",icon: Icons.add_business);
                  }else{
                    responseStatusMolecule.dialogBuilderLoading(context);
                    await salesProvider.saveAll( context, clientEntity, true  );
                    //Navigator.pop(context);
                  }
                },
                child: const Icon(Icons.send,size: 30,),),
            ),
          ],
        )



    );
  }

  Future<void> _dialogBuilder(BuildContext context, ProductProvider productProvider) {

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              Container(
                width: 160,
                child: TextFormField(
                  decoration: InputDecoration(labelText: "Buscar"),
                  onSaved: (value){},
                  validator: (value){
                    if(value == null || value.isEmpty) {
                      return "llena este campo";
                    }
                  },
                  controller: searchController,
                ),
              ),
              Spacer(),
              IconButton(onPressed: ()=>{
                productProvider.name = (searchController.text),
                productProvider.loadAndFilterProduct(searchController.text,context)
              }, icon: Icon(Icons.send,color: Colors.green,))

            ],
          ),
          content: Column(
            children: [
              Expanded(
                child: Container(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    width: 300,
                    child: ProductListboxOrganisms()),
              )
            ],
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text("Cerrar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}