import 'package:elearning/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Category extends StatelessWidget {
  final bool isSelected;
  final int? index;
  final List<String> title = [
    'Education',
    'Development',
    'Finance',
    'Business'
  ];
  Category({Key? key, this.index, this.isSelected = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            maxRadius: 71.5,
            minRadius: 66.5,
            backgroundColor: isSelected ? Color(0xffBDC5FF) : Colors.white,
            child: CircleAvatar(
              backgroundColor: catagorycolor[index!],
              maxRadius: 57.5,
              minRadius: 52.5,
              child: Center(
                child: SvgPicture.asset('assets/images/grid$index.svg'),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            title[index!],
            style: TextStyle(
                fontFamily: "Roboto",
                fontSize: 18,
                color: Color(0xff657E93),
                fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
