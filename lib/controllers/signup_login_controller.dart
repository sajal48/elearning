import 'package:elearning/Api/apiservices.dart';
import 'package:elearning/Data/loginresponse.dart';
import 'package:elearning/Data/registerdata.dart';
import 'package:flutter/material.dart';

class SignUpLoginController extends ChangeNotifier {
  bool _passwordvisibility = true;
  TextEditingController name = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController phno = new TextEditingController();
  TextEditingController verificationcode = new TextEditingController();
  late Registerdata registerdata;
  late LoginResponse loginResponse;
  int _languageindex = 0;
  int _catagoryindex = 0;
  int _selectboard = 0;
  int _preparationgoal = 0;
  String _boardselectText = "Select Board";
  int _classSelectindex = 0;

  int get languageindex => _languageindex;
  int get catagoryindex => _catagoryindex;
  int get selectboard => _selectboard;
  int get classSelectindex => _classSelectindex;
  int get preparationgoal => _preparationgoal;
  String get boardselectText => _boardselectText;

  String? nameerro;
  String? emailerror;
  String? passworderror;
  String? phnno;

  void classSelect(int i) {
    _classSelectindex = i;
    notifyListeners();
  }

  void selectLaguage(int index) {
    _languageindex = index;
    notifyListeners();
  }

  void selectCatagory(int index) {
    _catagoryindex = index;
    notifyListeners();
  }

  void selectBoard(int index) {
    _selectboard = index;
    notifyListeners();
  }

  void selectpreparationgoal(int index) {
    _preparationgoal = index;
    notifyListeners();
  }

  void selectedBoard(String s) {
    _boardselectText = s;
    notifyListeners();
  }

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
    name.clear();
    email.clear();
    password.clear();
    notifyListeners();
  }

  void logIn() async {
    print(email.text);
    print(password.text);
    loginResponse = await log_in(email.text, password.text);
    email.clear();
    password.clear();
    notifyListeners();
  }

  Future<LoginResponse> log_in(String email, String password) async {
    return await Services.login(email, password);
  }
}
