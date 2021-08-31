import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomTabBar extends StatelessWidget {
  final List<String> icons;
  final List<String> label;
  final int selectedIndex;
  final Function(int) onTap;
  const CustomTabBar(
      {Key? key,
      required this.label,
      required this.icons,
      required this.selectedIndex,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      labelPadding: EdgeInsets.zero,
      labelColor: Color(0xff5467FF),
      labelStyle: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.normal,
        fontSize: 14,
      ),
      unselectedLabelColor: Color(0xff354356),
      unselectedLabelStyle: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.normal,
        fontSize: 14,
      ),
      indicatorPadding: EdgeInsets.zero,
      indicator: const BoxDecoration(
          border: Border(
              top: BorderSide(
        color: Color(0xff5467FF),
        width: 3.0,
      ))),
      tabs: icons
          .asMap()
          .map((i, e) => MapEntry(
                i,
                Tab(
                  text: label[i],
                  icon: SvgPicture.asset(
                    e,
                    color: i == selectedIndex
                        ? Color(0xff5467FF)
                        : Color(0xff354356),
                    height: 20,
                    width: 20,
                  ),
                ),
              ))
          .values
          .toList(),
      onTap: onTap,
    );
  }
}
