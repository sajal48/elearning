import 'package:elearning/Data/userdetails.dart';
import 'package:elearning/controllers/homepage_controller.dart';
import 'package:elearning/controllers/signup_login_controller.dart';

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
    return SafeArea(
      child: Container(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 33, vertical: 25),
            child: Container(
              width: double.infinity,
              child: Column(
                children: [
                  SizedBox(
                    height: 33,
                  ),
                  FutureBuilder<UserDetails>(
                    future: Provider.of<HomepageController>(context)
                        .getUserDetails(),
                    builder: (context, data) {
                      if (data.connectionState == ConnectionState.waiting) {
                        return Container(
                          height: MediaQuery.of(context).size.height / 1.8,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      } else {
                        return Consumer<HomepageController>(
                          builder: (context, cont, child) => Column(
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
                                  "Username : ${cont.userDetails.result!.firstName}",
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
                                  "Email : ${cont.userDetails.result!.email} ",
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
                                  "Phone : ${cont.userDetails.result!.phone}",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'Milliard',
                                      color: Color(0xff3D4C59),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
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
                          await Provider.of<SignUpLoginController>(context,
                                  listen: false)
                              .logOut();
                          Navigator.popAndPushNamed(context, '/');
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
