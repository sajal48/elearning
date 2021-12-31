import 'package:elearning/Data/userdetails.dart';
import 'package:elearning/controllers/homepage_controller.dart';
import 'package:elearning/controllers/signup_login_controller.dart';
import 'package:elearning/widgets/relogin.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final cont_home = Provider.of<HomepageController>(context);
    final cont_home_btn =
        Provider.of<HomepageController>(context, listen: false);
    final cont_sign = Provider.of<SignUpLoginController>(context);
    final cont_sign_btn =
        Provider.of<SignUpLoginController>(context, listen: false);
    return SafeArea(
      child: Container(
        color: Color(0xffF3F5F9),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 33, vertical: 25),
            child: Container(
              width: double.infinity,
              child: cont_sign.loggedin
                  ? Column(
                      children: [
                        SizedBox(
                          height: 33,
                        ),
                        FutureBuilder<UserDetails>(
                          future: cont_home.getUserDetails(),
                          builder: (context, data) {
                            if (data.connectionState ==
                                ConnectionState.waiting) {
                              return Container(
                                height:
                                    MediaQuery.of(context).size.height / 1.8,
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            } else {
                              var udata = cont_home.userDetails;
                              return Column(
                                children: [
                                  Container(
                                    child: CircleAvatar(
                                      backgroundColor: Colors.black12,
                                      radius: 60,
                                      child: Icon(
                                        Icons.person,
                                        size: 60,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 50,
                                  ),
                                  Container(
                                    child: Text(
                                      "Username : ${udata.result!.firstName}",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Milliard',
                                          color: Color(0xff3D4C59),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    child: Text(
                                      "Email : ${udata.result!.email} ",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Milliard',
                                          color: Color(0xff3D4C59),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    child: Text(
                                      "Phone : ${udata.result!.phone}",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Milliard',
                                          color: Color(0xff3D4C59),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              );
                            }
                          },
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            child: ElevatedButton(
                              child: Text('LOG OUT'),
                              onPressed: () async {
                                await Provider.of<SignUpLoginController>(
                                        context,
                                        listen: false)
                                    .logOut();
                                cont_home_btn.clearloaded();
                                Navigator.popAndPushNamed(context, '/');
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                      ],
                    )
                  : Center(
                      child: ReLogin(title: 'Login to view Profile'),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
