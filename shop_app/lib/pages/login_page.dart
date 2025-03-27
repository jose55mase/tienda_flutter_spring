import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:shop_app/button_tab.dart';
import 'package:shop_app/configuration/styles/colors_definitions.dart';
import 'package:shop_app/widgets/templates/login_template.dart';

import 'dart:math'; // Importa para usar pi

class ItemSelected {
  int index;
  int description;

  ItemSelected(this.index, this.description) {
    index = this.index;
    description = this.description;
  }
}


class LoginPage extends StatefulWidget {
  ValueChanged? indexTap;
  LoginPage({@required this.indexTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>  {
  StreamController<double> controlador = StreamController<double>();

  List<int> steps = [];
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      setState(() {
        steps = [1, 2, 3, 4];
      });
    });
  }

  @override
  Widget build(BuildContext context) {



    return Material(
      child: Column(
        children: [
          Flexible(
            flex: 7,
            child: Column(
              children: [
                Container(
                  color: Colors.orange,
                  width: double.infinity,
                  height: 60,
                ),
                Container(
                  color: Colors.pinkAccent,
                  child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 2.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 25,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: steps.length,
                                itemBuilder: (context, index) => buildStep(index)),
                          ),

                        ],
                      )),
                )




              ],
            ),
          ),
        ],
      ) ,
    );
  }


  Widget buildStep(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
          /* ItemSelected itemSelected = new ItemSelected(index, steps[index]);
          widget.indexTap!(itemSelected);*/
          widget.indexTap!(selectedIndex);
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: selectedIndex == index
                    ? Container(
                  decoration: BoxDecoration(
                      color: ColorsDefinitions.backgroundOrHover,
                      borderRadius: BorderRadius.circular(50)),
                  margin: EdgeInsets.only(top: 6.0),
                  width: 45,
                )
                    : AnimatedContainer(
                  height: 20,
                  width: 20,
                  margin: EdgeInsets.only(top: 6.0),
                  duration: Duration(seconds: 4),
                  decoration: BoxDecoration(
                    color: ColorsDefinitions.backgroundOrHover
                        .withOpacity(0.5),
                    shape: BoxShape.circle,
                  ),
                )),
          ],
        ),
      ),
    );
  }

}


