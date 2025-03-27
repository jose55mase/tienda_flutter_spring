import 'package:intl/intl.dart';
import 'package:shop_app/entitys/invoice/invoice.dart';
import 'package:shop_app/entitys/sale_entity.dart';

class BillModel {

  generateListByFilter(List<SaleEntity> list){
    int count = 0;
    List<String> response = [""];
    list.forEach((item) {
      response.add("SIN CLIENTE");
      response.add(item.clientName!);
    });
    response = response.toSet().toList();
    count = count + 1;
    return response;
  }

  generateListByFilterString(List<String> list){
    List<String> response = [""];
    list.forEach((item) {
      response.add(item);
    });
    response = response.toSet().toList();
    return response;
  }

  generateListByInvoce(List<SaleEntity> list){
    DateFormat isoFormat = DateFormat("yyyy-M-d HH:mm:ssZ");
    List<InvoiceItem> response = [];
    list.forEach((item) {
      response.add(
          InvoiceItem(
            description: item.productName ?? "",
            date: item.date ?? "",
            quantity: item.amount ?? 0,
            vat: 0,
            unitPrice: item.price!.toDouble(),
          )
      );
    });
    return response;
  }
}