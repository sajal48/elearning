import 'package:flutter/material.dart';

class BoardSelector extends StatelessWidget {
  final int index;
  final bool isSelected;
  const BoardSelector(
      {Key? key, this.index = 0, this.isSelected = false, this.boardname = ""})
      : super(key: key);
  final String boardname;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              width: 2, color: isSelected ? Color(0xff12ce8a) : Colors.white)),
      child: Stack(
        children: [
          isSelected
              ? Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                      padding: EdgeInsets.all(5),
                      child:
                          Icon(Icons.check_circle, color: Color(0xff12ce8a))))
              : SizedBox.shrink(),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset('assets/images/board$index.png'),
                Text(boardname,
                    style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 16,
                        color: Color(0xff5C6977),
                        fontWeight: FontWeight.w700))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
