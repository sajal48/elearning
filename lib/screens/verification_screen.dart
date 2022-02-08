import 'package:elearning/controllers/signup_login_controller.dart';
import 'package:elearning/screens/verified_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';

class VerificationScreen extends StatefulWidget {
  VerificationScreen({Key? key}) : super(key: key);

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  PhoneNumber phoneNumber = PhoneNumber(isoCode: 'BD');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xffF4F5F9),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Skip',
                      style: TextStyle(color: Color(0xffF4F5F9)),
                    ),
                    Text(
                      'Let\'s Get Started ',
                      style: TextStyle(
                          fontFamily: 'Milliard',
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff3D4C59)),
                    ),
                    Text('Skip',
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff657E93)))
                  ],
                ),
                Expanded(
                    child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/images/verify.svg'),
                      SizedBox(
                        height: 25.0,
                      ),
                      Text(
                        "Enter your mobile number to\nenable 2 step verification",
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
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: InternationalPhoneNumberInput(
                            cursorColor: Color(0xff747A92),
                            inputDecoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white))),
                            onInputChanged: (PhoneNumber number) {},
                            onInputValidated: (bool value) {
                              print(value);
                            },
                            hintText: 'Phone Number',
                            selectorConfig: SelectorConfig(
                              selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                            ),
                            ignoreBlank: false,
                            spaceBetweenSelectorAndTextField: 0,
                            autoValidateMode: AutovalidateMode.disabled,
                            selectorTextStyle: TextStyle(
                              color: Color(0xff747A92),
                              fontFamily: 'Roboto',
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                            initialValue: phoneNumber,
                            // textFieldController:
                            //     Provider.of<SignUpLoginController>(context).phn,
                            formatInput: false,
                            maxLength: 11,
                            textStyle: TextStyle(
                              color: Color(0xff747A92),
                              fontFamily: 'Roboto',
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                            keyboardType: TextInputType.numberWithOptions(
                                signed: true, decimal: true),
                            inputBorder: OutlineInputBorder(),
                            onSaved: (PhoneNumber number) {
                              print('On Saved: $number');
                            },
                          ),
                        ),
                      ),
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
                            builder: (context) => VerifiedScreen()));
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
                  height: 150,
                )
              ],
            ),
          ),
        ));
  }
}
