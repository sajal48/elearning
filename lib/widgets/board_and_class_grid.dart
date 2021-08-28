import 'package:flutter/material.dart';

class BoardAndClassGrid extends StatelessWidget {
  final int index;
  final bool isActive;
  BoardAndClassGrid({Key? key, this.index = 0, this.isActive = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: isActive
              ? Border.all(color: Colors.green)
              : Border.all(color: Colors.white),
          color: Colors.white,
          borderRadius: BorderRadius.circular(9)),
      child: Stack(
        children: [
          isActive
              ? Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Icon(
                      Icons.check_circle,
                      color: Color(0xff12CE8A),
                    ),
                  ),
                )
              : SizedBox.shrink(),
          Center(
              child: Text(
            (index + 1).toString(),
            style: TextStyle(
                color: isActive ? Color(0xff12CE8A) : Color(0xff5C6977),
                fontFamily: 'Roboto',
                fontSize: 34,
                fontWeight: FontWeight.bold),
          )),
        ],
      ),
    );
  }
}
