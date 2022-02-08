import 'package:date_time_picker/date_time_picker.dart';
import 'package:elearning/Data/registerdata.dart';
import 'package:elearning/controllers/signup_login_controller.dart';
import 'package:elearning/screens/home_screen.dart';
import 'package:elearning/screens/screens.dart';
import 'package:elearning/screens/verification_screen.dart';
import 'package:elearning/styles/styles.dart';
import 'package:elearning/widgets/login_input_field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ndialog/ndialog.dart';
import 'package:provider/provider.dart';

import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool? isChecked = false;
  @override
  Widget build(BuildContext context) {
    final signupCont = Provider.of<SignUpLoginController>(context);
    final signupCont_btn =
        Provider.of<SignUpLoginController>(context, listen: false);

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff14181D),
        image: DecorationImage(
            image: ExactAssetImage("assets/images/login_bg.png"),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.fromLTRB(30, 25, 100, 30),
            child: Column(
              children: [
                Expanded(child: SizedBox.shrink()),
                Text(
                  'Create Account',
                  style: TextStyle(
                      fontSize: 54,
                      color: Colors.white,
                      fontFamily: 'Milliard',
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 25.0),
                LoginInputField(
                  error: signupCont.signup_username.error,
                  labelText: "User Name",
                  myFormatter: [
                    FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9]')),
                  ],
                  onChanged: (value) =>
                      signupCont.change_signup_username(value),
                ),
                SizedBox(
                  height: 25.0,
                ),
                LoginInputField(
                    labelText: "Email",
                    error: signupCont.sign_email.error,
                    type: TextInputType.emailAddress,
                    myFormatter: [
                      FilteringTextInputFormatter.allow(
                          RegExp('[a-zA-Z0-9@.]')),
                    ],
                    onChanged: (value) =>
                        signupCont.change_signup_email(value)),
                SizedBox(
                  height: 25.0,
                ),
                LoginInputField(
                    labelText: "Password",
                    error: signupCont.sign_password.error,
                    isPassword: true,
                    type: TextInputType.visiblePassword,
                    onChanged: (value) =>
                        signupCont.change_signup_password(value)),
                SizedBox(
                  height: 97.0,
                ),
                GestureDetector(
                  behavior: HitTestBehavior.deferToChild,
                  onTap: () {
                    if (signupCont_btn.validator_Signup_1()) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpNext()));
                    } else {
                      NAlertDialog(
                        title: Text("Error"),
                        content: Text("Fill all field correctly"),
                        blur: 2,
                      ).show(context,
                          transitionType: DialogTransitionType.Bubble);
                    }
                  },
                  child: Container(
                    height: 56,
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                        color: Color(0xff5790FF),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 35,
                        ),
                        Text(
                          'Next ',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                              letterSpacing: 1.5,
                              fontSize: 16),
                        ),
                        CircleAvatar(
                            radius: 17,
                            backgroundColor: Color(0xff3C55F0),
                            child: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 20,
                            ))
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
                Row(
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Roboto',
                          fontSize: 16.0),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      },
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                            color: Color(0xff5790FF),
                            fontFamily: 'Roboto',
                            fontSize: 16.0),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignUpNext extends StatelessWidget {
  const SignUpNext({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final signupCont = Provider.of<SignUpLoginController>(context);
    final signupCont_btn =
        Provider.of<SignUpLoginController>(context, listen: false);
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff14181D),
        image: DecorationImage(
            image: ExactAssetImage("assets/images/login_bg.png"),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.fromLTRB(30, 25, 90, 30),
            child: Column(
              children: [
                Expanded(child: SizedBox.shrink()),
                SizedBox(height: 20.0),
                LoginInputField(
                    error: signupCont.sign_firstname.error,
                    labelText: "First Name",
                    onChanged: (value) =>
                        signupCont.change_sign_firstname(value),
                    myFormatter: [
                      FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
                    ]),
                SizedBox(
                  height: 20.0,
                ),
                LoginInputField(
                    error: signupCont.sign_lastname.error,
                    labelText: "Last Name",
                    onChanged: (value) =>
                        signupCont.change_sign_lastname(value),
                    myFormatter: [
                      FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
                    ]),
                SizedBox(
                  height: 20.0,
                ),
                DateTimePicker(
                  type: DateTimePickerType.date,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1950),
                  lastDate: DateTime.now(),
                  style: textfeild,
                  onChanged: (value) => signupCont.change_sign_dob(value),
                  decoration: InputDecoration(
                    label: Text("Date of Birth"),
                    labelStyle: labelTextStyle,
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0x4dE3E3E3)),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0x4dE3E3E3)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
                Row(
                  children: [
                    Text(
                      "Male",
                      style: normal,
                    ),
                    Radio(
                        value: "Male",
                        groupValue: signupCont_btn.gender,
                        onChanged: (v) {
                          signupCont_btn.selectGender(v.toString());
                        }),
                    Text(
                      "Female",
                      style: normal,
                    ),
                    Radio(
                        value: "Female",
                        groupValue: signupCont_btn.gender,
                        onChanged: (v) {
                          signupCont_btn.selectGender(v.toString());
                        }),
                    Text(
                      "Other",
                      style: normal,
                    ),
                    Radio(
                        value: "Other",
                        groupValue: signupCont_btn.gender,
                        onChanged: (v) {
                          signupCont_btn.selectGender(v.toString());
                        }),
                  ],
                ),
                SizedBox(
                  height: 25.0,
                ),
                LoginInputField(
                  myFormatter: [FilteringTextInputFormatter.digitsOnly],
                  labelText: "Phone",
                  error: signupCont.sign_phn.error,
                  isPassword: false,
                  type: TextInputType.phone,
                  onChanged: (value) => signupCont.change_sign_phn(value),
                ),
                SizedBox(
                  height: 97.0,
                ),
                GestureDetector(
                  behavior: HitTestBehavior.deferToChild,
                  onTap: () async {
                    if (Provider.of<SignUpLoginController>(context,
                            listen: false)
                        .validator_Signup()) {
                      CustomProgressDialog? progressDialog = CustomProgressDialog(
                          context,
                          blur: 10,
                          dismissable:
                              false); //You can set Loading Widget using this function
                      progressDialog.setLoadingWidget(CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(Colors.blue)));
                      progressDialog.show();
                      RegisterRespons a =
                          await Provider.of<SignUpLoginController>(context,
                                  listen: false)
                              .register();
                      progressDialog.dismiss();
                      if (a.statuscode == 0) {
                        NAlertDialog(
                          title: Text("Error"),
                          content: Text(a.message!),
                          blur: 2,
                        ).show(context,
                            transitionType: DialogTransitionType.Bubble);
                      } else if (a.statuscode == 200) {
                        if (a.result!.response != null) {
                          NAlertDialog(
                            title: Text("Error"),
                            content: Text(a.result!.response!),
                            blur: 2,
                          ).show(context,
                              transitionType: DialogTransitionType.Bubble);
                        } else {
                          Provider.of<SignUpLoginController>(context,
                                  listen: false)
                              .clearController();
                          Navigator.popAndPushNamed(context, '/home');
                        }
                      }
                    } else {
                      NAlertDialog(
                        title: Text("Error"),
                        content: Text("Fill all fields correctly"),
                        blur: 2,
                      ).show(context,
                          transitionType: DialogTransitionType.Bubble);
                    }
                  },
                  child: Container(
                    height: 56,
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                        color: Color(0xff5790FF),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 35,
                        ),
                        Text(
                          'Sign Up ',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                              letterSpacing: 1.5,
                              fontSize: 16),
                        ),
                        CircleAvatar(
                            radius: 17,
                            backgroundColor: Color(0xff3C55F0),
                            child: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 20,
                            ))
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
                Row(
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Roboto',
                          fontSize: 16.0),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      },
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                            color: Color(0xff5790FF),
                            fontFamily: 'Roboto',
                            fontSize: 16.0),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
