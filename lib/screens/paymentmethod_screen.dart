import 'package:elearning/controllers/homepage_controller.dart';
import 'package:elearning/screens/checkout_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaymentMethodScreen extends StatelessWidget {
  final String course_name;
  final String course_id;
  final String course_price;
  const PaymentMethodScreen(
      {Key? key,
      required this.course_name,
      required this.course_id,
      required this.course_price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.fromLTRB(10, 30, 10, 10),
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Select a Payment Method",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: MediaQuery.of(context).size.height * .08,
                width: MediaQuery.of(context).size.width * .3,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Paypal"),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: MediaQuery.of(context).size.height * .08,
                width: MediaQuery.of(context).size.width * .3,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.orangeAccent),
                  ),
                  onPressed: () async {
                    var userdetails =
                        Provider.of<HomepageController>(context, listen: false)
                            .userDetails
                            .result!;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CheckoutScreen(
                                course_id: course_id,
                                course_name: course_name,
                                course_price: course_price,
                                uid: userdetails.id!,
                                customer_name: userdetails.username!,
                                customer_email: userdetails.email!)));
                  },
                  child: Text("Xendit"),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
