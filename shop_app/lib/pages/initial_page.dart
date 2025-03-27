import 'package:flutter/material.dart';
import 'package:shop_app/pages/login_page.dart';

import 'package:shop_app/widgets/templates/home_template.dart';
import 'package:shop_app/configuration/styles/colors_definitions.dart';

class InitialPage extends StatelessWidget {
  const InitialPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsDefinitions.gray_second,
      body: LoginPage(indexTap: (item)=>{
        print('-----------> ${item}')
      },)

      /*Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 100, top: 100),
              child: SizedBox(
                width: 230,
                height: 230,
                child: Image.asset('assets/logo_png.png'),
              ),
            ),
          ),
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HomeTemplate()

              ]
          ),
        ],
      ),*/

    );
  }
}



