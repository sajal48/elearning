import 'package:elearning/screens/catagory_screen.dart';
import 'package:elearning/widgets/myItem.dart';
import 'package:flutter/material.dart';

class LanguageSelectScreen extends StatefulWidget {
  LanguageSelectScreen({Key? key}) : super(key: key);

  @override
  _LanguageSelectScreenState createState() => _LanguageSelectScreenState();
}

class _LanguageSelectScreenState extends State<LanguageSelectScreen> {
  List<int> exampleList = [0, 1, 2, 3, 4, 5, 6];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.fromLTRB(34, 50, 34, 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 72,
                backgroundImage: AssetImage('assets/images/avatar.png'),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'HI!!!\nPetay Cruiser',
                style: TextStyle(
                    fontFamily: 'Milliard',
                    fontSize: 54,
                    color: Color(0xff3D4C59),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                  'Please select your preferred language\nto facilitate communication',
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      color: Color(0xff3D4C59))),
              SizedBox(
                height: 25,
              ),
              Wrap(
                direction: Axis.horizontal,
                children: exampleList.map((i) {
                  return myItem(
                    index: i,
                    isSelected: (i == 0),
                  );
                }).toList(),
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                behavior: HitTestBehavior.deferToChild,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CatagoryScreen()));
                },
                child: Container(
                  height: 56,
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
            ],
          ),
        ),
      ),
    );
  }
}
