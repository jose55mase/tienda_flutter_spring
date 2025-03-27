import 'package:flutter/material.dart';

class CardMolecule extends StatelessWidget {

  final String name;
  final IconData iconData;
  final Function onPressed;

  CardMolecule({
     required this.name,
      required this.iconData,
      required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => (this.onPressed()),
      child: Card(
          child: SizedBox(
            width: 200,
            height: 100,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipOval(
                    child: SizedBox(
                      width: 46,
                      height: 46,
                      child: Icon(
                        color: Colors.blue.shade400,
                        iconData,
                        size: 25,
                      )
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${this.name}',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Color(0xFFF64209),
                        fontWeight: FontWeight.bold
                    ),
                  )
                ],
              ),
            ),
          )
      
      ),
    );
  }
  
}