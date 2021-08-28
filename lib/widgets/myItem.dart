import 'package:flutter/material.dart';

class myItem extends StatelessWidget {
  final List<String> languages = [
    "English",
    "Chiness",
    "Hindi",
    "Portuguese",
    "Spanish",
    "Arabic",
    "Russian"
  ];
  final int index;
  final bool isSelected;
  myItem({Key? key, this.index = 0, this.isSelected = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 8, 8),
      child: Container(
          decoration: BoxDecoration(
              color: isSelected ? Color(0xff5467FF) : Color(0xffE6EAF2),
              borderRadius: BorderRadius.circular(20)),
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Text(
                '${languages[index]}',
                maxLines: 1,
                style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 14,
                    color: isSelected ? Colors.white : Color(0xff7D9FBB)),
              ))),
    );
  }
}
