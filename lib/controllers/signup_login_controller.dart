// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:elearning/Data/validatoritem.dart';
import 'package:restart_app/restart_app.dart';
import 'package:elearning/Api/apiservices.dart';
import 'package:elearning/Data/loginresponse.dart';
import 'package:elearning/Data/registerdata.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpLoginController extends ChangeNotifier {
  bool _passwordvisibility = true;

  ValidatorItem _login_username = ValidatorItem(value: null, error: null);
  ValidatorItem _login_password = ValidatorItem(value: null, error: null);
  ValidatorItem _signup_username = ValidatorItem(value: null, error: null);
  ValidatorItem _signup_email = ValidatorItem(value: null, error: null);
  ValidatorItem _signup_password = ValidatorItem(value: null, error: null);
  ValidatorItem _signup_firstname = ValidatorItem(value: null, error: null);
  ValidatorItem _signup_lastname = ValidatorItem(value: null, error: null);
  ValidatorItem _signup_dob = ValidatorItem(value: null, error: null);
  ValidatorItem _signup_phone = ValidatorItem(value: null, error: null);

  ValidatorItem get login_username => _login_username;
  ValidatorItem get login_password => _login_password;

  ValidatorItem get signup_username => _signup_username;
  ValidatorItem get sign_email => _signup_email;
  ValidatorItem get sign_password => _signup_password;

  ValidatorItem get sign_firstname => _signup_firstname;
  ValidatorItem get sign_lastname => _signup_lastname;
  ValidatorItem get sign_dob => _signup_dob;
  ValidatorItem get sign_phn => _signup_phone;

  void change_login_username(String value) {
    if (value.length > 3) {
      _login_username = ValidatorItem(value: value, error: null);
    } else
      _login_username =
          ValidatorItem(value: null, error: "Username must be 4 charecter");
    notifyListeners();
  }

  void change_login_password(String value) {
    if (RegExp(r'^(?=.*?[A-Za-z])(?=.*?[0-9]).{8,}$').hasMatch(value)) {
      _login_password = ValidatorItem(value: value, error: null);
    } else
      _login_password = ValidatorItem(
          value: null, error: "Password must contains 8 alphanumerics!");
    notifyListeners();
  }

  void change_signup_username(String value) {
    if (value.length > 3) {
      _signup_username = ValidatorItem(value: value, error: null);
    } else
      _signup_username =
          ValidatorItem(value: null, error: "Username must be 4 charecter");
    notifyListeners();
  }

  void change_signup_password(String value) {
    if (RegExp(r'^(?=.*?[A-Za-z])(?=.*?[0-9]).{8,}$').hasMatch(value)) {
      _signup_password = ValidatorItem(value: value, error: null);
    } else
      _signup_password = ValidatorItem(
          value: null, error: "Password must contains 8 alphanumerics!");
    notifyListeners();
  }

  void change_signup_email(String value) {
    if (RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value)) {
      _signup_email = ValidatorItem(value: value, error: null);
    } else
      _signup_email = ValidatorItem(value: null, error: "Enter a valid email");
    notifyListeners();
  }

  void change_sign_firstname(String value) {
    if (value.length > 2) {
      _signup_firstname = ValidatorItem(value: value, error: null);
    } else
      _signup_firstname =
          ValidatorItem(value: null, error: " Must be at least 3 charecter");
    notifyListeners();
  }

  void change_sign_lastname(String value) {
    if (value.length > 2) {
      _signup_lastname = ValidatorItem(value: value, error: null);
    } else
      _signup_lastname =
          ValidatorItem(value: null, error: " Must be at least 3 charecter");
    notifyListeners();
  }

  void change_sign_dob(String value) {
    try {
      DateTime.parse(value);
      _signup_dob = ValidatorItem(value: value, error: null);
    } catch (e) {
      _signup_dob = ValidatorItem(value: null, error: "Enter a valid date");
    }
    notifyListeners();
  }

  void change_sign_phn(String value) {
    if (value.length > 9) {
      _signup_phone = ValidatorItem(value: value, error: null);
    } else
      _signup_phone = ValidatorItem(value: null, error: " atleast 9 charecter");
    notifyListeners();
  }

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
    _signup_username.value = null;
    _signup_password.value = null;
    _signup_email.value = null;
    _signup_firstname.value = null;
    _signup_lastname.value = null;
    _signup_phone.value = null;
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
    if (_login_username.value == null || _login_password.value == null) {
      return false;
    } else {
      return true;
    }
  }

  bool validator_Signup_1() {
    if (_signup_username.value == null ||
        _signup_email.value == null ||
        _signup_password.value == null) {
      return false;
    } else {
      return true;
    }
  }

  bool validator_Signup() {
    if (_signup_username.value == null ||
        _signup_email.value == null ||
        _signup_password.value == null ||
        _signup_firstname.value == null ||
        _signup_lastname.value == null ||
        _signup_dob.value == null ||
        _signup_phone.value == null ||
        gender == null) {
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
        await Services.login(_login_username.value!, _login_password.value!);
    notifyListeners();
    if (loginResponse.result != null) {
      setloginstatus(true);
      storeUserData(loginResponse.result!.userId);
    }

    //login_Clear();

    return loginResponse;
  }

  Future<RegisterRespons> register() async {
    print(_signup_email.value);
    Registerdata a = Registerdata(
        firstName: _signup_firstname.value!,
        lastName: _signup_lastname.value!,
        username: _signup_username.value!,
        password: _signup_password.value!,
        dateOfBirth: DateTime.tryParse(_signup_dob.value!)!,
        joiningDate: DateTime.now(),
        joiningDate: DateTime.now(),
        joiningDate: DateTime.now(),
        joiningDate: DateTime.now(),
        joiningDate: DateTime.now(),
        joiningDate: DateTime.now(),
        joiningDate: DateTime.now(),
        joiningDate: DateTime.now(),
        joiningDate: DateTime.now(),
        joiningDate: DateTime.now(),
        gender: gender!,
        phone: _signup_phone.value!,
        email: _signup_email.value!);

    registerRespons = await Services.register(a);
    print(a.username);
    notifyListeners();
    if (registerRespons.result!.id != null) {
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
    Restart.restartApp();
    return true;
  }
}
