import 'package:flutter/material.dart';
import 'package:shop_app/configuration/styles/colors_definitions.dart';
import 'package:shop_app/providers/client_provider.dart';
import 'package:shop_app/widgets/molecules/client_list_molecule.dart';
import 'package:shop_app/widgets/organisms/client_create_organisms.dart';
import 'package:provider/provider.dart';

class ClientPage extends StatelessWidget {
  //const ClientPage();
  final GlobalKey _draggableKey = GlobalKey();


  @override
  Widget build(BuildContext context) {

    final clientProvider = Provider.of<ClientProvider>(context);
    //context.read<ClientProvider>().findlistClient(context);



    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: PreferredSize(preferredSize: Size.fromHeight(80.0), child:
        AppBar(
          iconTheme: const IconThemeData(color: Color(0xFFF64209)),
          title: Text(
            'Lista de clientes',
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
      body: Visibility(
        visible: !clientProvider.loading,
        replacement: Center(child: CircularProgressIndicator()),
        child: ClientListMolecule(list: clientProvider.listClient,child: Container(),)),
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
                      child: ClientCreateOrganisms(),
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

