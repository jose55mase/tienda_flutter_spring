import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonTab extends StatefulWidget{

  final int index;
  final int selected;
  final String label;
  final Function(int) onTap;
  ButtonTab({required this.index, required this.selected, this.label = "", required this.onTap});

  @override
  State<ButtonTab> createState() => _ButtonTabState();
}

class _ButtonTabState extends State<ButtonTab> {
  var selected = 0;
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: this.widget.label.length > 0,
      child: GestureDetector(
        onTap: (){
          setState(() {
            print('----------> ${widget.selected}');
            selected = widget.selected;
          });
        },
        child: Container(
          margin: EdgeInsets.all(4.0),
          width: 100,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            borderRadius:  BorderRadius.circular(10),
            color:  selected == widget.index ? Colors.white : Colors.transparent ,
          ),
          child: Center(child: Text(this.widget.label, style: TextStyle(color: widget.selected == widget.index ? Colors.orange : Colors.black))),
        ),
      ),
      replacement: Container(
        width: selected == widget.index ? 40 : 20 ,
        height: 6,
        decoration: BoxDecoration(
          borderRadius:  BorderRadius.circular(10),
          color:  selected == widget.index ? Colors.orange : Colors.white ,
        ),
       ),
    );
  }
}