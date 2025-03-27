import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';

import 'package:shop_app/configuration/routes/routes.dart';
import 'package:shop_app/configuration/routes/routes_generator.dart';
import 'package:shop_app/providers/client_provider.dart';
import 'package:shop_app/providers/product_provider.dart';
import 'package:shop_app/providers/sales_provider.dart';



void main() {

  HttpOverrides.global = MyHttpOverrides();
  runApp(
    /*const MaterialApp(
      home: ShopApp()
    ),*/

    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => SalesProvider()),
        ChangeNotifierProvider(create: (_) => ClientProvider()),
        /*ChangeNotifierProvider(create: (_) => BankProvider()),*/
      ],
      child: const ShopApp(),
    ),
  );
}

class ShopApp extends StatelessWidget {
  const ShopApp({Key? key,  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    // _configureAmplify();
    return MaterialApp(

      title: 'Shop_ilion',
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //initialRoute: Routes.home,
      initialRoute: Routes.home,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}



class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}