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
                  error: signupCont.nameerro,
                  labelText: "User Name",
                  controller: signupCont.username,
                ),
                SizedBox(
                  height: 25.0,
                ),
                LoginInputField(
                  labelText: "Email",
                  error: signupCont.emailerror,
                  type: TextInputType.emailAddress,
                  controller: signupCont.email,
                ),
                SizedBox(
                  height: 25.0,
                ),
                LoginInputField(
                  labelText: "Password",
                  error: signupCont.passworderror,
                  isPassword: true,
                  controller: signupCont.password,
                  type: TextInputType.visiblePassword,
                ),
                SizedBox(
                  height: 97.0,
                ),
                GestureDetector(
                  behavior: HitTestBehavior.deferToChild,
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUpNext()));
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
                SizedBox(height: 20.0),
                LoginInputField(
                  error: Provider.of<SignUpLoginController>(context)
                      .firstnameerror,
                  labelText: "First Name",
                  controller:
                      Provider.of<SignUpLoginController>(context).firstname,
                ),
                SizedBox(
                  height: 20.0,
                ),
                LoginInputField(
                  error: Provider.of<SignUpLoginController>(context)
                      .lasttnameerror,
                  labelText: "Last Name",
                  controller:
                      Provider.of<SignUpLoginController>(context).lastname,
                ),
                SizedBox(
                  height: 20.0,
                ),
                DateTimePicker(
                  type: DateTimePickerType.date,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1950),
                  lastDate: DateTime.now(),
                  style: textfeild,
                  controller:
                      Provider.of<SignUpLoginController>(context).dateofbirth,
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
                        groupValue:
                            Provider.of<SignUpLoginController>(context).gender,
                        onChanged: (v) {
                          Provider.of<SignUpLoginController>(context,
                                  listen: false)
                              .selectGender(v.toString());
                        }),
                    Text(
                      "Female",
                      style: normal,
                    ),
                    Radio(
                        value: "Female",
                        groupValue:
                            Provider.of<SignUpLoginController>(context).gender,
                        onChanged: (v) {
                          Provider.of<SignUpLoginController>(context,
                                  listen: false)
                              .selectGender(v.toString());
                        }),
                    Text(
                      "Other",
                      style: normal,
                    ),
                    Radio(
                        value: "Other",
                        groupValue:
                            Provider.of<SignUpLoginController>(context).gender,
                        onChanged: (v) {
                          Provider.of<SignUpLoginController>(context,
                                  listen: false)
                              .selectGender(v.toString());
                        }),
                  ],
                ),
                SizedBox(
                  height: 25.0,
                ),
                LoginInputField(
                  labelText: "Phone",
                  error: Provider.of<SignUpLoginController>(context).phnnoerror,
                  isPassword: false,
                  controller: Provider.of<SignUpLoginController>(context).phn,
                  type: TextInputType.visiblePassword,
                ),
                SizedBox(
                  height: 97.0,
                ),
                GestureDetector(
                  behavior: HitTestBehavior.deferToChild,
                  onTap: () async {
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
                    if (a.result!.status != null) {
                      NAlertDialog(
                        title: Text("Error"),
                        content: Text(a.result!.message!),
                        blur: 2,
                      ).show(context,
                          transitionType: DialogTransitionType.Bubble);
                    } else {
                      // Provider.of<SignUpLoginController>(context, listen: false)
                      //     .clearController();
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => NavScreen()));
                    }

                    // Navigator.push(

                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => VerificationScreen()));
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
