import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogAtom {

  final BuildContext context;
  final Widget content;
  final String title;
  final Function onEdit;

  DialogAtom(this.context,  {
     required this.onEdit,
    required this.content,
    required this.title
  });

  Future<void> dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title:  Text('${this.title}'),
          content: this.content,
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Cerrar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.amberAccent,
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Editar'),
              onPressed: () {
                Navigator.of(context).pop();
                this.onEdit();
              },
            )
          ],
        );
      },
    );
  }



}
