import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/entitys/client_entity.dart';
import 'package:shop_app/providers/client_provider.dart';
import 'package:shop_app/configuration/styles/colors_definitions.dart';
import 'package:shop_app/configuration/styles/text_styles.dart';
import 'package:shop_app/entitys/product_entity.dart';
import 'package:provider/provider.dart';

class ClientCreateOrganisms extends StatefulWidget{
  @override
  State<ClientCreateOrganisms> createState() => _ClienteCreateOrganismsState();
}

class _ClienteCreateOrganismsState extends State<ClientCreateOrganisms> {
  ClientEntity clientEntity = ClientEntity();
  final barCodeController     = TextEditingController();
  final formKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    final clientProvider = Provider.of<ClientProvider>(context);
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text("Crear Cliente"),
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
                        clientEntity.name = value ?? "";
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
                      decoration: InputDecoration(labelText: "Numero telefonico"),
                      onSaved: (value){
                        this.clientEntity.phone = value ?? "";
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
                      decoration: InputDecoration(labelText: "Direccion"),
                      onSaved: (value){
                        clientEntity.address = value;
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
                            clientProvider.save(formKey,context, clientEntity ),
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
                        }
                    ),
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
