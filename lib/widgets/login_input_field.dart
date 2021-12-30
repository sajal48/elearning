import 'package:elearning/controllers/signup_login_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:form_field_validator/form_field_validator.dart';

class LoginInputField extends StatefulWidget {
  final String? labelText;
  final TextEditingController? controller;
  final bool? isPassword;
  final String? error;

  final TextInputType? type;
  LoginInputField({
    Key? key,
    this.labelText,
    this.controller,
    this.isPassword = false,
    this.type = TextInputType.name,
    this.error,
  }) : super(key: key);

  @override
  _LoginInputFieldState createState() => _LoginInputFieldState();
}

class _LoginInputFieldState extends State<LoginInputField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.always,
      validator: RequiredValidator(errorText: 'this field is required'),
      key: widget.key,
      keyboardType: widget.type,
      style: TextStyle(
          color: Colors.white,
          fontSize: 22.0,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.bold),
      controller: widget.controller,
      cursorColor: Color(0x4dE3E3E3),
      obscureText:
          Provider.of<SignUpLoginController>(context).passwordvisibility &&
              widget.isPassword!,
      decoration: InputDecoration(
          suffixIcon: widget.isPassword!
              ? IconButton(
                  onPressed: () {
                    Provider.of<SignUpLoginController>(context, listen: false)
                        .changeVisibility();
                  },
                  icon: Provider.of<SignUpLoginController>(context)
                          .passwordvisibility
                      ? Icon(
                          Icons.visibility_off,
                          color: Colors.white,
                        )
                      : Icon(
                          Icons.visibility,
                          color: Colors.white,
                        ),
                )
              : Padding(padding: EdgeInsets.zero),
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
