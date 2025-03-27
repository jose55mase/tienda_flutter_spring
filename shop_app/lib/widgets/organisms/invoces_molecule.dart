import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:shop_app/entitys/invoice/customer.dart';
import 'package:shop_app/entitys/invoice/invoice.dart';
import 'package:shop_app/entitys/invoice/supplier.dart';
import 'package:shop_app/models/api/pdf_api.dart';
import 'package:shop_app/models/api/pdf_invoice_api.dart';
import 'package:shop_app/models/api/pdf_paragraph_api.dart';




class InvoicesMolecule extends StatelessWidget {
  final List<InvoiceItem> listItems;
  InvoicesMolecule({Key? key, required this.listItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(32),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ButtonTheme(
              minWidth: 300.0,
              height: 300.0,
              child: FilledButton(
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll<Color>(Colors.green),
                ),
                onPressed: ()async {
                  final date = DateTime.now();
                  final dueDate = date.add(Duration(days: 7));
                  final invoice = Invoice(
                      supplier: Supplier(
                        name: 'Nombre de tienda',
                        address: 'Antioquia-Colombia',
                        paymentInfo: 'Sin metodo de pago',
                      ),
                      customer: Customer(
                        name: 'Servicios Productos',
                        address: 'Carrera 51 # 96 Sur 50, La estrella,',
                      ),
                      info: InvoiceInfo(
                        date: date,
                        dueDate: dueDate,
                        description: '',
                        number: '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}/-${DateTime.now().hour}:${DateTime.now().minute}',
                      ),
                      items: listItems
                  );
                  final pdfFile = await PdfInvoiceApi.generate(invoice);

                  PdfApi.openFile(pdfFile);
                },
                child: Text("Crear",style: TextStyle(fontSize: 10),)),
            ),

          ],
        ),
      ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    Key? key,
    required this.text,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
    style: ElevatedButton.styleFrom(
      minimumSize: Size.fromHeight(40),
    ),
    child: FittedBox(
      child: Text(
        text,
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    ),
    onPressed: onClicked,
  );
}