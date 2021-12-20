import 'package:elearning/controllers/homepage_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class CheckoutScreen extends StatefulWidget {
  final String course_price;
  final String course_name;
  final String course_id;
  final String customer_name;
  final String customer_email;
  final String uid;
  const CheckoutScreen(
      {Key? key,
      required this.course_price,
      required this.course_name,
      required this.course_id,
      required this.customer_name,
      required this.customer_email,
      required this.uid})
      : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  bool loading = false;

  refreshScreen() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.greenAccent,
        child: Column(
          children: [
            Container(
              child: Text("Cousrse Name : ${widget.course_name}"),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Text("Cousrse price : ${widget.course_price}"),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () async {
                  loading = true;
                  refreshScreen();
                  var pr = await Provider.of<HomepageController>(context,
                          listen: false)
                      .purchase(
                          widget.course_price,
                          "description",
                          widget.customer_email,
                          widget.customer_name,
                          widget.course_id,
                          widget.uid,
                          widget.course_name);
                  print(pr.statuscode);

                  await launch(pr.result!.invoiceUrl!);

                  loading = false;
                  refreshScreen();
                },
                child: Container(
                    width: MediaQuery.of(context).size.width / 3,
                    child: Center(
                        child: loading
                            ? Container(
                                padding: EdgeInsets.symmetric(vertical: 5),
                                child: CircularProgressIndicator(
                                  strokeWidth: 3,
                                  color: Colors.white,
                                ),
                              )
                            : Text("Proceed with Xendit"))))
          ],
        ),
      )),
    );
  }
}
