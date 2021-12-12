import 'package:elearning/controllers/signup_login_controller.dart';
import 'package:elearning/screens/notificationpermission_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

class VerifiedScreen extends StatefulWidget {
  VerifiedScreen({Key? key}) : super(key: key);

  @override
  _VerifiedScreenState createState() => _VerifiedScreenState();
}

class _VerifiedScreenState extends State<VerifiedScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xffF4F5F9),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
            child: Column(
              children: [
                Text(
                  'Verification ',
                  style: TextStyle(
                      fontFamily: 'Milliard',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff3D4C59)),
                ),
                Expanded(
                    child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/images/verified.svg'),
                      SizedBox(
                        height: 25.0,
                      ),
                      Text(
                        "We send you a code to verify\nyour phone number",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xff758FA4),
                            fontSize: 16.0,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          height: 50,
                          width: 275,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          child: PinCodeTextField(
                            controller:
                                Provider.of<SignUpLoginController>(context)
                                    .verificationcode,
                            appContext: context,
                            pastedTextStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Roboto",
                                fontSize: 34),
                            length: 4,
                            obscureText: true,
                            obscuringCharacter: '*',
                            blinkWhenObscuring: true,
                            animationType: AnimationType.fade,
                            pinTheme: PinTheme(
                              inactiveColor: Color(0xffC9CCD7),
                              disabledColor: Colors.white,
                              activeColor: Colors.white,
                              selectedFillColor: Colors.white,
                              selectedColor: Colors.white,
                              activeFillColor: Colors.white,
                              inactiveFillColor: Color(0xffF4F5F9),
                              shape: PinCodeFieldShape.box,
                              borderRadius: BorderRadius.circular(5),
                              fieldHeight: 50,
                              fieldWidth: 40,
                            ),
                            cursorColor: Color(0xff758FA4),
                            animationDuration: Duration(milliseconds: 300),
                            enableActiveFill: true,
                            keyboardType: TextInputType.number,
                            onCompleted: (v) {
                              print("Completed");
                            },
                            // onTap: () {
                            //   print("Pressed");
                            // },
                            onChanged: (value) {
                              print(value);
                              setState(() {});
                            },
                            beforeTextPaste: (text) {
                              print("Allowing to paste $text");
                              //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                              //but you can show anything you want here, like your pop up saying wrong paste format or etc
                              return true;
                            },
                          )),
                      SizedBox(
                        height: 25.0,
                      ),
                      Text(
                        'I didn\’t receive a  code',
                        style: TextStyle(
                            color: Color(0xff758FA4),
                            fontSize: 16.0,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        'RESEND',
                        style: TextStyle(
                            color: Color(0xff5467FF),
                            fontSize: 16.0,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                )),
                SizedBox(
                  height: 25.0,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                NotificationPermissionScreen()));
                  },
                  child: Container(
                    height: 47,
                    width: 233,
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
                          'CONTINUE',
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
                  height: size.height * .10,
                )
              ],
            ),
          ),
        ));
  }
}
