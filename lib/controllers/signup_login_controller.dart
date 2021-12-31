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
  bool loggedin = false;

  void setloginstatus(bool status) {
    loggedin = status;
    notifyListeners();
  }

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

  bool validator_Login() {
    if (loginUsername.text.isEmpty || loginPassword.text.isEmpty) {
      return false;
    } else
      return true;
  }

  bool validator_Signup() {
    if (username.text.isEmpty ||
        email.text.isEmpty ||
        password.text.isEmpty ||
        firstname.text.isEmpty ||
        lastname.text.isEmpty ||
        dateofbirth.text.isEmpty ||
        gender!.isEmpty) {
      return false;
    } else
      return true;
  }

  bool get passwordvisibility => _passwordvisibility;

  void changeVisibility() {
    _passwordvisibility = _passwordvisibility ? false : true;
    notifyListeners();
  }

  // void signUp_Clear() {
  //   firstname.clear();
  //   lastname.clear();
  //   username.clear();
  //   email.clear();
  //   password.clear();
  //   notifyListeners();
  // }

  // void login_Clear() {
  //   loginUsername.clear();
  //   loginPassword.clear();
  //   notifyListeners();
  // }

  Future<LoginResponse> logIn() async {
    loginResponse =
        await Services.login(loginUsername.text, loginPassword.text);
    notifyListeners();
    if (loginResponse.result != null) {
      setloginstatus(true);
      storeUserData(loginResponse.result!.userId);
    }

    //login_Clear();

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
    notifyListeners();
    if (registerRespons.result != null) {
      setloginstatus(true);
      storeUserData(registerRespons.result!.id!);
    }
    //signUp_Clear();
    return registerRespons;
  }

  Future<void> storeUserData(String userID) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('RivguruUser', userID);
  }

  Future<bool> logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    setloginstatus(false);
    return true;
  }
}
