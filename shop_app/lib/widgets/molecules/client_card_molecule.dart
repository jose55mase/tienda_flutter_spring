import 'package:flutter/material.dart';
import 'package:shop_app/configuration/styles/colors_definitions.dart';
import 'package:shop_app/utils.dart';

class ClientCardMolecule extends StatelessWidget {

  final String name;
  final String phone;
  final String address;
  final IconData iconData;
  final double oweMoney;
  final double totalPurchased;

  ClientCardMolecule({
     required this.name, required this.address,
      required this.iconData, required this.phone, required this.oweMoney, required this.totalPurchased,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 50,
            height: 50,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Column(
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
                              Text("${Utils.formatPriceCOL(totalPurchased.toInt())}")
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
                              Text("${Utils.formatPriceCOL(oweMoney.toInt())}")
                            ],)),
                          ),
                        ],
                      ),
                      ClipOval(
                        child: SizedBox(
                          width: 46,
                          height: 46,
                          child: Icon(
                            iconData,
                            size: 25,
                          )
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${this.name}',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Color(0xFFF64209),
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.phone),
                      Text(
                        '${this.phone}',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Color(0xFF2C2B2A),
                            fontWeight: FontWeight.bold
                        ),
                      )
                    ],
                  ),
                  Icon(Icons.home),
                  Expanded(
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      '${this.address}',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Color(0xFF2C2B2A),
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )

    );
  }
  
}