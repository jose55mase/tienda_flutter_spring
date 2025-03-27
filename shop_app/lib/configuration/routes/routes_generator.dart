import 'package:flutter/material.dart';
import 'package:shop_app/configuration/routes/routes.dart';
import 'package:shop_app/pages/client_page.dart';
import 'package:shop_app/pages/initial_page.dart';
import 'package:shop_app/pages/login_page.dart';
import 'package:shop_app/pages/product_page.dart';
import 'package:shop_app/pages/trade_page.dart';
import 'package:shop_app/widgets/templates/sale_template.dart';


class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const InitialPage());
      case Routes.SaleTemplate:
        return MaterialPageRoute(builder: (_) =>  SaleTemplate());
      case Routes.clientPage:
        return MaterialPageRoute(builder: (_) =>  ClientPage());
      case Routes.productPage:
        return MaterialPageRoute(builder: (_) =>  ProductPage());
      case Routes.tradePage:
        return MaterialPageRoute(builder: (_) =>  TradePage());
      case Routes.loginPage:
        return MaterialPageRoute(builder: (_) =>  LoginPage());


      default:
        return _error();
    }
  }

  static Route<dynamic> _error() {
    return MaterialPageRoute(builder: (_) {
      return Container(
        child: const Text('error!!!'),
      );
    });
  }
}
