import 'package:elearning/screens/login_screen.dart';
import 'package:flutter/material.dart';

class ReLogin extends StatelessWidget {
  const ReLogin({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title),
        SizedBox(
          height: 50,
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            },
            child: Text('Login'))
      ],
    );
  }
}
