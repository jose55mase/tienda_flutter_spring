import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ModalGeneralAtom {

  Future<void> dialogBuilder(BuildContext context,{required content, title, double height = 400,double width=200}) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            height:  height,
            width: width ,
            child: AlertDialog(
              title:  Text('${title}'),
              content: content,
              actions: <Widget>[
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.amber,
                    textStyle: Theme.of(context).textTheme.labelLarge,
                  ),
                  child: const Text('Cerrar'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),

              ],
            ),
          ),
        );
      },
    );
  }



}
