import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/delegates/search_product_delegate.dart';

class ProductTemplate extends StatefulWidget{
  @override
  _ProductTemplateState createState() => _ProductTemplateState();
}

class _ProductTemplateState extends State<ProductTemplate> {

  final TextEditingController searchInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //final mainPageProvider = Provider.of<MainPageProvider>(context);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 50),
                child: MaterialButton(
                    child: Text("Buscar producto",
                      style: TextStyle(color: Colors.white),
                    ),
                    shape: StadiumBorder(),
                    color: Colors.blue,
                    onPressed: () => {
                        showSearch(
                            context: context, delegate: SearchProductDelegate()
                        )
                    }),
              )
            ]
          ),
        ],
      ),
    );
  }



}
