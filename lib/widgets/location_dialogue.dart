import 'dart:ui';

import 'package:elearning/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LocatonDialogue extends StatelessWidget {
  const LocatonDialogue({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            height: 317,
            width: 291,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SvgPicture.asset('assets/images/location.svg'),
              Text(
                'Enable Your Location',
                style: TextStyle(
                    color: Color(0xff5467FF),
                    fontSize: 18,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Please allow to use your location to show\nnearby services on the map',
                style: TextStyle(
                    color: Color(0xff3D4C59),
                    fontSize: 14,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              DefaultButton(),
            ]),
          ),
        ));
  }
}
