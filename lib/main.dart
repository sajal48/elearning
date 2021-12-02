import 'package:elearning/controllers/homepage_controller.dart';
import 'package:elearning/controllers/signup_login_controller.dart';
import 'package:elearning/screens/boarding_screen.dart';
import 'package:elearning/screens/home_screen.dart';
import 'package:elearning/screens/login_screen.dart';
import 'package:elearning/screens/nav_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'controllers/onboarding_controller.dart';

void main() async {
  await GetStorage.init();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => OnboardingController()),
      ChangeNotifierProvider(create: (context) => SignUpLoginController()),
      ChangeNotifierProvider(create: (context) => HomepageController()),
    ],
    child: MyApp(prefs),
  ));
}

class MyApp extends StatelessWidget {
  final SharedPreferences pref;

  const MyApp(this.pref, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    final box = GetStorage();
    String? userId = pref.getString("RivguruUser");

    Widget check() {
      if (box.read('boarding') == null) {
        return BoardingPage();
      } else {
        if (userId != null) {
          return NavScreen();
        } else {
          return LoginScreen();
        }
      }
    }

    return MaterialApp(
      theme: ThemeData(unselectedWidgetColor: Color(0xff5790FF)),
      debugShowCheckedModeBanner: false,
      home: check(),
    );
  }
}
