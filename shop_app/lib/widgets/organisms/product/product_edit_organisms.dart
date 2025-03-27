import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/configuration/routes/routes.dart';
import 'package:shop_app/configuration/styles/colors_definitions.dart';
import 'package:shop_app/configuration/styles/text_styles.dart';
import 'package:shop_app/entitys/product_entity.dart';
import 'package:shop_app/models/product_model.dart';
import 'package:shop_app/widgets/molecules/card_molecule.dart';

class ProductEditOrganisms extends StatelessWidget{
  ProductEntity productEntity;
  final nameController      = TextEditingController();
  final priceController     = TextEditingController();
  final amountController    = TextEditingController();
  final categoriController  = TextEditingController();
  final barCodeController   = TextEditingController();
  final formKey = GlobalKey<FormState>();

  ProductEditOrganisms({
    required this.productEntity
  });

  ProductModel productModel = new ProductModel();

  @override
  Widget build(BuildContext context) {
    //final mainPageProvider = Provider.of<MainPageProvider>(context);
    this.productModel.loadProduct(productEntity, amountController,priceController,nameController, barCodeController);
    return SingleChildScrollView(
      //scrollDirection: Axis.horizontal,
      child: Column(
        children: [
          Text("Editar producto"),
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
                      controller: nameController,

                    ),
                    padding: EdgeInsets.only(bottom: 20),
                  ),
                  Padding(
                    child: TextFormField(
                      decoration: InputDecoration(labelText: "Cantidad"),
                      onSaved: (value){
                        productEntity.amount = int.parse(value.toString()) ;
                      },
                      validator: (value){
                        if(value == null || value.isEmpty) {
                          return "llena este campo";
                        }
                      },
                      controller: amountController,
                    ),
                    padding: EdgeInsets.only(bottom: 10),
                  ),
                  Padding(
                    child: Row(
                      children: [
                        Container(
                          width: 160,
                          child: TextFormField(
                          decoration: InputDecoration(labelText: "Precio"),
                          onSaved: (value){
                            productEntity.price = int.parse(value.toString());
                          },
                          validator: (value){
                            if(value == null || value.isEmpty) {
                              return "llena este campo";
                            }
                          },
                          controller: priceController,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 30),
                          width: 190,
                          child: TextFormField(
                            decoration: InputDecoration(labelText: "Codigo de barras"),
                            onSaved: (value){
                              productEntity.barCode =value.toString();
                            },
                            validator: (value){
                              print(value);
                              if(value == null || value.isEmpty) {
                                return "llena este campo";
                              }
                            },
                            controller: barCodeController,
                          ),
                        ),
                      ]
                    ),
                    padding: EdgeInsets.only(bottom: 10),
                  ),

                  Row(
                    children: [
                      Flexible(
                        child: Container(
                          child: DropdownButtonFormField(
                            items: [
                              DropdownMenuItem(child: Text("Frescos"),value: "Frescos",),
                              DropdownMenuItem(child: Text("Platos preparados ........."),value: "Platos preparados",),
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
                              productEntity.category = data
                            },
                          ),
                        ),
                      ),

                    ],
                  ),


                  Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: MaterialButton(
                        child: Text("Editar",
                          style: TextStyle(color: Colors.white),
                        ),
                        shape: StadiumBorder(),
                        color: Colors.amber,
                        onPressed: () async => {

                          if (formKey.currentState!.validate() ){
                            //this.productModel.saveProduct(formKey)
                            await this.productModel.editProduct(formKey,productEntity, context ),
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
