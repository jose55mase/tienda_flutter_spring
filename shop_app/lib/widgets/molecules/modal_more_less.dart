import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogMoreLess {

  BuildContext context;
  final VoidCallback  less;

  DialogMoreLess(this.context,  {
    required this.less,
  });

  Future<void> dialogBuilderEmpty(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            width: 400,
            height: 250,
            child: AlertDialog(
              backgroundColor: Color(0xFFE8D45D),
              title: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.hourglass_empty, color: Color(0xFFA8996B),size: 40,),
                ],
              ),
              content: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 15),
                    child: Row(
                      children: [
                        IconButton(onPressed: less, icon: Icon(Icons.remove,color: Colors.green,)),
                        Spacer(),
                        IconButton(onPressed: less, icon: Icon(Icons.add,color: Colors.green,))
                      ],
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.amber,
                      textStyle: Theme.of(context).textTheme.labelLarge,
                    ),
                    child: const Text("Cerrar"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),

            ),
          ),
        );
      },
    );
  }



}
