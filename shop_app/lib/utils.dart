import 'package:intl/intl.dart';

class Utils {


  static formatPrice(double price) => '\$ ${price.toStringAsFixed(2)}';
  static formatDate(DateTime date) => DateFormat.yMd().format(date);
  static formatPriceCOL(int prices){
    var format =  NumberFormat("#,##0.00", "en_US");
    return format.format(prices);
  }
}