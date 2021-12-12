import 'dart:convert';

import 'package:elearning/Api/apiservices.dart';
import 'package:elearning/Data/loginresponse.dart';
import 'package:elearning/Data/registerdata.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpLoginController extends ChangeNotifier {
  bool _passwordvisibility = true;
  TextEditingController username = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController firstname = new TextEditingController();
  TextEditingController lastname = new TextEditingController();
  TextEditingController phn = new TextEditingController();
  TextEditingController dateofbirth = new TextEditingController();
  TextEditingController loginUsername = new TextEditingController();
  TextEditingController loginPassword = new TextEditingController();
  bool loading = false;

  TextEditingController verificationcode = new TextEditingController();
  late LoginResponse loginResponse;
  late RegisterRespons registerRespons;
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
  String? firstnameerror;
  String? lasttnameerror;
  String? emailerror;
  String? passworderror;
  String? phnnoerror;
  String? gender;
  DateTime? boderror;

  void clearController() {
    username.clear();
    password.clear();
    email.clear();
    firstname.clear();
    lastname.clear();
    dateofbirth.clear();
    loginPassword.clear();
    loginUsername.clear();
  }

  void classSelect(int i) {
    _classSelectindex = i;
    notifyListeners();
  }

  void setloading(bool b) {
    loading = b;
    notifyListeners();
  }

  void selectGender(String value) {
    gender = value;
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
    if (username.text.isEmpty) {
      nameerro = "Empty";
    } else
      nameerro = null;
    if (email.text.isEmpty) {
      emailerror = "Emptyr";
    } else
      emailerror = null;
    if (password.text.isEmpty) {
      passworderror = "Empty";
    } else {
      passworderror = null;
    }
    if (firstname.text.isEmpty) {
      firstnameerror = "Empty";
    } else
      firstnameerror = null;
    if (lastname.text.isEmpty) {
      lasttnameerror = "Empty";
    } else
      lasttnameerror = null;
    if (phn.text.isEmpty) {
      phnnoerror = "Empty";
    } else {
      phnnoerror = null;
    }
    if (loginUsername.text.isEmpty) {
      nameerro = "Empty";
    } else {
      nameerro = null;
    }
    if (loginPassword.text.isEmpty) {
      passworderror = "Empty";
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
    print(username.text);
    print(email.text);
    print(password.text);
    username.clear();
    email.clear();
    password.clear();
    notifyListeners();
  }

  Future<LoginResponse> logIn() async {
    loginResponse =
        await Services.login(loginUsername.text, loginPassword.text);
    ChangeNotifier();
    if (loginResponse.result != null) {
      storeUserData(loginResponse.result!.userId);
    }

    return loginResponse;
  }

  Future<RegisterRespons> register() async {
    Registerdata a = Registerdata(
        firstName: firstname.text,
        lastName: lastname.text,
        username: username.text,
        password: password.text,
        dateOfBirth: DateTime.tryParse(dateofbirth.text)!,
        joiningDate: DateTime.now(),
        gender: gender!,
        phone: phn.text,
        email: email.text);

    registerRespons = await Services.register(a);
    ChangeNotifier();
    if (registerRespons.result != null) {
      storeUserData(registerRespons.result!.id!);
    }
    return registerRespons;
  }

  Future<void> storeUserData(String userID) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('RivguruUser', userID);
  }

  Future<bool> logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    return true;
  }
}
