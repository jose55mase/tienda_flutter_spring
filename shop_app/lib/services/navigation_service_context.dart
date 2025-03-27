// key navigation
import 'package:flutter/material.dart';

class NavigationServiceContext {
  GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();
  static NavigationServiceContext instance = NavigationServiceContext._();

  NavigationServiceContext._(){
    navigatorKey = new GlobalKey<NavigatorState>();
  }

}