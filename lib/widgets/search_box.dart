import 'package:flutter/material.dart';

class SearchBox extends StatefulWidget {
  SearchBox({Key? key}) : super(key: key);

  @override
  _SearchBoxState createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 274,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Search',
                style: TextStyle(color: Color(0xff747A92), fontSize: 16)),
            Container(
              height: 29,
              width: 29,
              decoration: BoxDecoration(
                  color: Color(0xff5467FF),
                  borderRadius: BorderRadius.circular(5)),
              child: Icon(
                Icons.search,
                color: Colors.white,
                size: 18,
              ),
            )
          ],
        ),
      ),
    );
  }
}
