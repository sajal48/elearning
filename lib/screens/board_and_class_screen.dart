import 'package:elearning/controllers/signup_login_controller.dart';
import 'package:elearning/screens/screens.dart';
import 'package:elearning/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BoardAndClassScreen extends StatefulWidget {
  BoardAndClassScreen({Key? key}) : super(key: key);

  @override
  _BoardAndClassScreenState createState() => _BoardAndClassScreenState();
}

class _BoardAndClassScreenState extends State<BoardAndClassScreen> {
  List<String> number = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xffF4F5F9),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 60, vertical: 30),
            child: Column(
              children: [
                Text(
                  'Select Board & Class',
                  style: TextStyle(
                      fontFamily: 'Milliard',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff3D4C59)),
                ),
                SizedBox(
                  height: 50,
                ),
                Expanded(
                    child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Which class or Grade are you in?',
                        style: TextStyle(
                            fontFamily: 'Milliard',
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: Color(0xff747A92)),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        height: 39,
                        padding: EdgeInsets.fromLTRB(20, 0, 5, 0),
                        margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              Provider.of<SignUpLoginController>(context)
                                  .boardselectText,
                              style: TextStyle(
                                  color: Color(0xff747A92), fontSize: 14),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            BoardSelectScreen()));
                              },
                              child: Container(
                                height: 29,
                                width: 29,
                                decoration: BoxDecoration(
                                    color: Color(0xff5467FF),
                                    borderRadius: BorderRadius.circular(5)),
                                alignment: Alignment.center,
                                child: Icon(
                                  Icons.expand_more,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                      Flexible(
                        child: GridView.builder(
                            physics: BouncingScrollPhysics(),
                            itemCount: 12,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: (90 / 104),
                                    crossAxisCount: 3),
                            itemBuilder: (_, index) {
                              return GestureDetector(
                                onTap: () {
                                  Provider.of<SignUpLoginController>(context,
                                          listen: false)
                                      .classSelect(index);
                                },
                                child: BoardAndClassGrid(
                                  isActive: Provider.of<SignUpLoginController>(
                                              context)
                                          .classSelectindex ==
                                      index,
                                  index: index,
                                ),
                              );
                            }),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return LocatonDialogue();
                                });
                          },
                          child: DefaultButton()),
                      SizedBox(height: 50)
                    ],
                  ),
                )),
              ],
            ),
          ),
        ));
  }
}
