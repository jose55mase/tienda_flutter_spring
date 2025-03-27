import 'package:flutter/material.dart';
import 'package:shop_app/configuration/styles/colors_definitions.dart';
import 'package:hugeicons/hugeicons.dart';

class ProductCardMolecule extends StatelessWidget {

  final String name;
  final int prices;
  final int amount;
  final IconData iconData;
  final Function onPressed;

  ProductCardMolecule({
      required this.amount,
      required this.prices,
      required this.name,
      required this.iconData,
      required this.onPressed,
  });

  String moneyFormat(String price) {
    if (price.length > 2) {
      var value = price;
      value = value.replaceAll(RegExp(r'\D'), '');
      value = value.replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), ',');
      return value;
    }
    return '0';
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => (this.onPressed()),
      child: Material(
        elevation: 20,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        child: Stack(
          children: [

            Column(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      '${this.name}',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Color(0xFF0C0C0C),
                          fontWeight: FontWeight.normal,
                          fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.qr_code_2_outlined),
                      Text(
                        '${78875527848}',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: ColorsDefinitions.gray,
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                //Image.network('http://localhost:8081/api/user/uploads/img/imges.jpg',width: 70,),
                HugeIcon(
                  icon: HugeIcons.strokeRoundedVegetarianFood,
                  color: Colors.red,
                  size: 30.0,
                ),
              ],
            ),

            Positioned(
              top: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start, //change here don't //worked
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                        color: Colors.blue
                      ),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.attach_money,size: 20,color: ColorsDefinitions.yellow,),
                            Text(
                              '${moneyFormat(this.prices.toString())}',
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: ColorsDefinitions.white,
                                  fontWeight: FontWeight.normal
                              ),
                            )
                          ],
                        ),
                      )
                  ),
                ],
              ),
            ),

            Positioned(
              bottom: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start, //change here don't //worked
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Visibility(
                    child: Container(
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),topLeft: Radius.circular(20)),
                          color: ColorsDefinitions.red,
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            '${this.amount}',
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                color: ColorsDefinitions.white,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        )
                    ),
                    visible: this.amount > 0 && this.amount <= 5,
                  ),

                  Visibility(
                    child: Container(
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),topLeft: Radius.circular(20)),
                          color: ColorsDefinitions.yellow,
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            '${this.amount}',
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                color: ColorsDefinitions.white,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        )
                    ),
                    visible: this.amount > 5 && this.amount <= 10,
                  ),

                  Visibility(
                    child: Container(
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),topLeft: Radius.circular(20)),
                          color: ColorsDefinitions.green,
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            '${this.amount}',
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                color: ColorsDefinitions.white,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        )
                    ),
                    visible: this.amount > 10 ,
                  ),
                ],
              ),
            )
          ],
        )

            /*
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  /*ClipOval(
                    child: SizedBox(
                      width: 46,
                      height: 46,
                      child: Icon(
                        iconData,
                        size: 25,
                      )
                    ),
                  ),*/
                  //const SizedBox(height: 8),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                    ],
                  ),




                ],
              ),
            ),*/
          //],
        ),
      //),
    );
  }
  
}

