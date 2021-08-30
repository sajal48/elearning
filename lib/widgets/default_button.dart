import 'package:flutter/material.dart';

class DefaultButton extends StatefulWidget {
  final String text;

  DefaultButton({Key? key, this.text = 'CONTINUE'}) : super(key: key);

  @override
  _DefaultButtonState createState() => _DefaultButtonState();
}

class _DefaultButtonState extends State<DefaultButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 47,
      width: 233,
      padding: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
          color: Color(0xff5790FF), borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 35,
          ),
          Text(
            widget.text,
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
                letterSpacing: 1.5,
                fontSize: 16),
          ),
          CircleAvatar(
              radius: 17,
              backgroundColor: Color(0xff3C55F0),
              child: Icon(
                Icons.arrow_forward,
                color: Colors.white,
                size: 20,
              ))
        ],
      ),
    );
  }
}
