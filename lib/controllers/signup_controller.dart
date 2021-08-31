import 'package:flutter/material.dart';

class SignUpController extends ChangeNotifier {
  bool _passwordvisibility = true;
  TextEditingController name = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();

  String? nameerro;
  String? emailerror;
  String? passworderror;

  void validator() {
    if (name.text.isEmpty) {
      nameerro = "Name error";
    } else
      nameerro = null;
    if (email.text.isEmpty) {
      emailerror = "email error";
    } else
      emailerror = null;
    if (password.text.isEmpty) {
      passworderror = "password error";
    } else {
      passworderror = null;
    }
    notifyListeners();
  }

  bool get passwordvisibility => _passwordvisibility;

  void changeVisibility() {
    _passwordvisibility = _passwordvisibility ? false : true;
    notifyListeners();
  }

  void signUp() {
    print(name.text);
    print(email.text);
    print(password.text);
  }
}
