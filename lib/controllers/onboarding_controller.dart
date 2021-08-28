import 'package:elearning/styles/styles.dart';
import 'package:flutter/material.dart';

class OnboardingController extends ChangeNotifier {
  int _index = 0;

  List<Color> _bg = [bg1, bg2, bg3, Color(0xff2a324a)];
  List<String> _img = [
    'assets/images/ob1.svg',
    'assets/images/ob2.svg',
    'assets/images/ob3.svg',
    'assets/images/ob4.svg',
  ];

  List<String> _name = ['Teacher', 'Learner', 'Schedule', ''];
  List<String> _title = [
    'I am a',
    'I am a',
    'Select a',
    'Woohoo!\nYou are all set!'
  ];
  List<Color> _btnclr = [
    Color(0xff3b6f7d),
    Color(0xffc55d54),
    Color(0xff1294b7),
    Color(0xff5790ff),
  ];
  List<Color> _btnsltclr = [
    Color(0xff2f5a65),
    Color(0xffa14c43),
    Color(0xff0e7e9c),
    Color(0xff3c55f0),
  ];
  List<Color> _txtclr = [
    Color(0xff88c1cf),
    Color(0xffffccc8),
    Color(0xff92e6fc),
    Color(0xFFFFFFFF)
  ];

  int get index => _index;
  Color get color => _bg[_index];
  Color get btnclr => _btnclr[_index];
  Color get btnsltclr => _btnsltclr[_index];
  Color get txtclr => _txtclr[_index];
  String get img => _img[_index];
  String get name => _name[index];
  String get title => _title[index];
  void nxt() {
    if (_index < 3) {
      _index = _index + 1;
    }

    notifyListeners();
  }

  bool islast() {
    if (_index == 3) {
      return true;
    } else
      return false;
  }
}
