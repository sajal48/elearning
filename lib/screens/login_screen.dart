import 'package:elearning/Api/apiservices.dart';
import 'package:elearning/Data/coursecategory.dart';
import 'package:elearning/Data/loginresponse.dart';

import 'package:elearning/controllers/signup_login_controller.dart';
import 'package:elearning/screens/nav_screen.dart';
import 'package:elearning/screens/resetpassword_screen.dart';
import 'package:elearning/screens/signup_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:elearning/widgets/login_input_field.dart';
import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:provider/provider.dart';

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool? isChecked = false;
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
            padding: EdgeInsets.fromLTRB(30, 25, 90, 30),
            child: Column(
              children: [
                Expanded(child: SizedBox.shrink()),
                Text(
                  'Welcome Back',
                  style: TextStyle(
                      fontSize: 54,
                      color: Colors.white,
                      fontFamily: 'Milliard',
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 25.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xff4869D4),
                      ),
                      height: 57.0,
                      width: 130.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.facebookF,
                            size: 15,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Sign in with Facebook",
                            style: TextStyle(
                                fontFamily: "Roboto",
                                fontSize: 11,
                                color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 57.0,
                      width: 130.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xffEB4132),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.google,
                            size: 15,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Sign in with Google",
                            style: TextStyle(
                                fontFamily: "Roboto",
                                fontSize: 11,
                                color: Colors.white),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 25.0),
                Divider(
                  color: Color(0x4dffffff),
                  endIndent: 127.0,
                ),
                LoginInputField(
                  labelText: "User Name",
                  error: Provider.of<SignUpLoginController>(context).nameerro,
                  type: TextInputType.emailAddress,
                  controller:
                      Provider.of<SignUpLoginController>(context).loginUsername,
                ),
                SizedBox(
                  height: 25.0,
                ),
                LoginInputField(
                  labelText: "Password",
                  type: TextInputType.visiblePassword,
                  isPassword: true,
                  controller:
                      Provider.of<SignUpLoginController>(context).loginPassword,
                  error:
                      Provider.of<SignUpLoginController>(context).passworderror,
                ),
                SizedBox(
                  height: 25.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          materialTapTargetSize: MaterialTapTargetSize.padded,
                          activeColor: Color(0xff5790FF),
                          value: isChecked,
                          onChanged: (bool? b) {
                            setState(() {
                              isChecked = b;
                            });
                          },
                        ),
                        Text(
                          "Remember me",
                          style: TextStyle(color: Color(0xff5790FF)),
                        )
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ResetPasswordScreen()));
                      },
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Roboto',
                            fontSize: 14),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25.0,
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

                    LoginResponse a = await Provider.of<SignUpLoginController>(
                            context,
                            listen: false)
                        .logIn();
                    progressDialog.dismiss();

                    if (a.statuscode == 0) {
                      NAlertDialog(
                        title: Text("Error"),
                        content: Text(a.message),
                        blur: 2,
                      ).show(context,
                          transitionType: DialogTransitionType.Bubble);
                    } else if (a.statuscode == 200) {
                      Provider.of<SignUpLoginController>(context, listen: false)
                          .clearController();
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => NavScreen()));
                    }

                    // CourseCategory a = await Services.getCourseCategory();
                    // print("btm press ended");
                    // print(a.result[0].categoryName);
                    // FeaturedPaidCourse f = await Services.getFeaturedPaidCourses();
                    // print(f.result[8].courseName);
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
                          'SIGN IN',
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
                      "Don't have an account?",
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
                                builder: (context) => SignUpScreen()));
                      },
                      child: Text(
                        "Sign Up",
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
