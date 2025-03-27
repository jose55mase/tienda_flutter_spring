import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/widgets/organisms/product/product_edit_organisms.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';
import 'package:shop_app/configuration/routes/routes.dart';
import 'package:shop_app/configuration/styles/colors_definitions.dart';
import 'package:shop_app/configuration/styles/text_styles.dart';
import 'package:shop_app/entitys/product_entity.dart';
import 'package:shop_app/models/product_model.dart';

class ProductCreateOrganisms extends StatefulWidget{
  @override
  State<ProductCreateOrganisms> createState() => _ProductCreateOrganismsState();
}

class _ProductCreateOrganismsState extends State<ProductCreateOrganisms> {
  ProductEntity productEntity = ProductEntity();
  final barCodeController   = TextEditingController();
  final formKey = GlobalKey<FormState>();

/*
  ProductCreateOrganisms({
    //this.productEntity
  });
*/
  ProductModel productModel = new ProductModel();

  @override
  Widget build(BuildContext context) {
    //final mainPageProvider = Provider.of<MainPageProvider>(context);
    //this.productModel.loadProduct(productEntity, amountController,priceController,nameController);
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [


          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text("Crear Producto"),
          ),
         
          IconButton(
            onPressed: () async {
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
              List<ProductEntity> response = await productModel.findByBarCode(res as String);
              if(response.isEmpty) {
                setState(() async {
                  //7707195160085
                  barCodeController.text = res as String;
                });
              }else{
                Navigator.of(context).pop();
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
                                    id: response[0].id,
                                    name: response[0].name,
                                    amount: response[0].amount,
                                    date: response[0].date,
                                    price: response[0].price,
                                    barCode: response[0].barCode,
                                    category: response[0].category
                                )
                            ),
                          ),
                        ),
                      );
                    }
                );
              }
            },
            icon: Icon(Icons.qr_code_2_rounded),
          ),
          Form(
            key: formKey,
            child: Padding(
              padding: EdgeInsets.all(25),
              child: Column(
                children: [
                  Padding(
                    child: TextFormField(
                      decoration: InputDecoration(
                          labelText: "Nombre"
                      ),
                      onSaved: (value){
                        productEntity.name = value ?? "";
                      },
                      validator: (value){
                        if(value == null || value.isEmpty) {
                          return "llena este campo";
                        }
                      },
                    ),
                    padding: EdgeInsets.only(bottom: 20),
                  ),
                  Padding(
                    child: TextFormField(
                      decoration: InputDecoration(labelText: "Cantidad"),
                      onSaved: (value){
                        productEntity.amount = int.parse(value.toString())  ;
                      },
                      validator: (value){
                        if(value == null || value.isEmpty) {
                          return "llena este campo";
                        }
                      },
                    ),
                    padding: EdgeInsets.only(bottom: 10),
                  ),
                  Padding(
                    child: TextFormField(
                      decoration: InputDecoration(labelText: "Precio"),
                      onSaved: (value){
                        productEntity.price = int.parse(value.toString());
                      },
                      validator: (value){
                        print(value);
                        if(value == null || value.isEmpty) {
                          return "llena este campo";
                        }
                      },
                    ),
                    padding: EdgeInsets.only(bottom: 10),
                  ),

                  Row(
                    children: [
                      Container(
                        width: 200,
                        child: DropdownButtonFormField(
                          items: [
                            DropdownMenuItem(child: Text("Frescos"),value: "Frescos",),
                            DropdownMenuItem(child: Text("Platos preparados"),value: "Platos preparados",),
                            DropdownMenuItem(child: Text("Despensa"),value: "Despensa",),
                            DropdownMenuItem(child: Text("Mascotas"),value: "Mascotas",),
                            DropdownMenuItem(child: Text("Bebé"),value: "Bebé",),
                            DropdownMenuItem(child: Text("Cuidado del hogar"),value: "Cuidado del hogar",),
                            DropdownMenuItem(child: Text("Cuidado personal"),value: "Cuidado personal",),
                            DropdownMenuItem(child: Text("Bebidas y bodega"),value: "Bebidas y bodega",),
                            DropdownMenuItem(child: Text("Congelados"),value: "Congelados",),
                            DropdownMenuItem(child: Text("Refrigerados"),value: "Refrigerados",),
                          ],
                          value: productEntity.category,

                          onChanged: (data)=> {
                            //print("data--> ${data}")
                            productEntity.category = data
                          },
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 30),
                        width: 180,
                        child: TextFormField(
                          decoration: InputDecoration(labelText: "Codigo de barras"),
                          onSaved: (value){
                            productEntity.barCode =value.toString();
                          },
                          controller: barCodeController,
                        ),
                      ),
                    ],
                  ),


                  Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: MaterialButton(
                        child: Text("Crear",
                          style: TextStyle(color: Colors.white),
                        ),
                        shape: StadiumBorder(),
                        color: Colors.amber,
                        onPressed: () async => {
                          if (formKey.currentState!.validate() ){
                            formKey.currentState!.save(),
                            this.productModel.createProduct(formKey,productEntity, context ),
                            Navigator.of(context).pop(),
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: ColorsDefinitions.success,
                                content: Text('Registro actulizado correctamente', style: TextStyles.subtitleGreen),
                                action: SnackBarAction(
                                  label: 'Listo',
                                  onPressed: () {},
                                ),
                              ),
                            )
                          },

                        }),
                  )
                ],
              ),
            )
          )
        ],
      ),
    );
  }
}
