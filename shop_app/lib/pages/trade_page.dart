import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/configuration/routes/routes.dart';
import 'package:shop_app/configuration/styles/colors_definitions.dart';
import 'package:shop_app/configuration/styles/text_styles.dart';
import 'package:shop_app/providers/client_provider.dart';

import 'package:shop_app/widgets/molecules/card_molecule.dart';
import 'package:shop_app/widgets/molecules/client_list_molecule.dart';
import 'package:shop_app/widgets/molecules/header_aplication.dart';
import 'package:shop_app/widgets/templates/bill_template.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/sales_provider.dart';
import 'package:shop_app/widgets/organisms/invoces_molecule.dart';
import 'package:shop_app/widgets/templates/statistics_template.dart';


class TradePage extends StatefulWidget {
  @override
  State<TradePage> createState() => _TradePageState();
}

class _TradePageState extends State<TradePage> {
  //const ClientPage();
  final GlobalKey _draggableKey = GlobalKey();

  int screenIndex = 0;

  late bool showNavigationDrawer;

  void handleScreenChanged(int selectedScreen) {
    setState(() {
      screenIndex = selectedScreen;
    });
  }

  @override
  Widget build(BuildContext context) {

    final clientProvider = Provider.of<ClientProvider>(context);

    List<Widget> templates = <Widget>[
      Center(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: SvgPicture.asset(
                  'assets/shopTrade.svg',
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child:
                      CardMolecule(name: "Vender sin registrar cliente", iconData: Icons.sell_rounded, onPressed: ()=>{
                        Navigator.pushNamed(context, Routes.SaleTemplate),
                      }
                    ),
                  ),
                  Container(
                    child: ClientListMolecule(child: Container(),list: clientProvider.listClient,showClient: false,),
                    width: double.infinity,
                    height: 500,
                  ),
                  //Expanded(child: )
                ],
              ),
            ],
          )
      ),
      BillTemplate(),
      StatisticsTemplate(),
    ];

    return Scaffold(
      backgroundColor: ColorsDefinitions.backgroundOrHover,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: HeaderAplication(),
      ),

      /*PreferredSize(preferredSize: Size.fromHeight(80.0), child:
        AppBar(
          iconTheme: const IconThemeData(color: Color(0xFFF64209)),
          title: Text(
            'Gestion de ventas',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontSize: 36,
              color: const Color(0xFF353232),
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: const Color(0xFFF7F7F7),
          elevation: 0,
        )
      ),*/
      body: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(child: templates[screenIndex])
          ]
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: screenIndex,
        onDestinationSelected: (int index) {
          setState(() {
            screenIndex = index;
          });
        },
        destinations: destinations.map(
              (ExampleDestination destination) {
            return NavigationDestination(
              label: destination.label,
              icon: destination.icon,
              selectedIcon: destination.selectedIcon,
              tooltip: destination.label,
            );
          },
        ).toList(),
      ),
    );
  }

}

class ExampleDestination {
  const ExampleDestination(this.label, this.icon, this.selectedIcon);

  final String label;
  final Widget icon;
  final Widget selectedIcon;
}

const List<ExampleDestination> destinations = <ExampleDestination>[
  ExampleDestination(
      'Vender', Icon(Icons.sd_card_alert_outlined), Icon(Icons.sd_card_alert_sharp)),
  ExampleDestination(
      'Ventas', Icon(Icons.add_business_outlined), Icon(Icons.add_business_rounded)),
  ExampleDestination(
      'Estadisticas', Icon(Icons.stacked_bar_chart), Icon(Icons.stacked_bar_chart_outlined))

];



