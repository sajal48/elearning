import 'package:flutter/material.dart';

class PreparationDialog extends StatelessWidget {
  const PreparationDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(100)),
        height: 339,
        width: 303,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('What are you preparing for?'),
            ListTile(
              title: Text('School & Compitative exam'),
              leading: Radio(
                value: 1,
                groupValue: 1,
                onChanged: (a) {},
              ),
            ),
            ListTile(
              title: Text('School Exam'),
              leading: Radio(
                value: 1,
                groupValue: 1,
                onChanged: (a) {},
              ),
            ),
            ListTile(
              title: Text('Compitative exam'),
              leading: Radio(
                value: 1,
                groupValue: 1,
                onChanged: (a) {},
              ),
            ),
            Container(
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
          ],
        ),
      ),
    );
  }
}
