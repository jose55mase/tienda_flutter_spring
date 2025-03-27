import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectedFilterAtom extends StatefulWidget {

  final String title;
  List<String> list;
  Function(String) action;
  SelectedFilterAtom({super.key, required this.list, this.title="", required this.action });

  @override
  State<SelectedFilterAtom> createState() => _SelectedFilterAtomState();
}

class _SelectedFilterAtomState extends State<SelectedFilterAtom> {
  var selectedItem = "";
  @override
  Widget build(BuildContext context, ) {


    return DropdownButton<String>(
      value: selectedItem,
      onChanged: (String? value) {
        widget.action(value!);
        setState(() => { selectedItem = value! });
      },
      selectedItemBuilder: (BuildContext context) {
        return widget.list.map<Widget>((String item) {
          return Column(
            children: [
              Text(widget.title),
              Container(
                alignment: Alignment.centerLeft,
                constraints: const BoxConstraints(minWidth: 100),
                child: Text(
                  item,
                  style: const TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          );
        }).toList();
      },
      items: widget.list.map<DropdownMenuItem<String>>((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
    );
  }
}