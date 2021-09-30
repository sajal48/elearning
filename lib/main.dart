import 'package:elearning/controllers/homepage_controller.dart';
import 'package:elearning/controllers/signup_login_controller.dart';
import 'package:elearning/screens/boarding_screen.dart';
import 'package:elearning/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

import 'controllers/onboarding_controller.dart';

void main() async {
  await GetStorage.init();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => OnboardingController()),
      ChangeNotifierProvider(create: (context) => SignUpLoginController()),
      ChangeNotifierProvider(create: (context) => HomepageController()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    final box = GetStorage();

    return MaterialApp(
      theme: ThemeData(unselectedWidgetColor: Color(0xff5790FF)),
      debugShowCheckedModeBanner: false,
      home: box.read('boarding') == null ? BoardingPage() : LoginScreen(),
    );
  }
}
