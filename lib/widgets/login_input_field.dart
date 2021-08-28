import 'package:flutter/material.dart';

class LoginInputField extends StatefulWidget {
  final String? labelText;
  final TextEditingController? controller;
  final bool? isPassword;
  final Icon? icon;
  final TextInputType? type;
  LoginInputField(
      {Key? key,
      this.labelText,
      this.controller,
      this.isPassword = false,
      this.icon,
      this.type = TextInputType.name})
      : super(key: key);

  @override
  _LoginInputFieldState createState() => _LoginInputFieldState();
}

class _LoginInputFieldState extends State<LoginInputField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.type,
      style: TextStyle(
          color: Colors.white,
          fontSize: 22.0,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.bold),
      controller: widget.controller,
      cursorColor: Color(0x4dE3E3E3),
      decoration: InputDecoration(
          suffixIcon: widget.icon,
          labelText: widget.labelText,
          labelStyle: TextStyle(
              color: Colors.white,
              fontFamily: 'Roboto',
              fontSize: 22.0,
              fontWeight: FontWeight.w400),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0x4dE3E3E3)),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0x4dE3E3E3)),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0x4dE3E3E3)),
          )),
    );
  }
}
