import 'package:elearning/Data/coursedata.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ModuleSection extends StatelessWidget {
  final ModuleClass moduleData;
  final bool isPurchased;
  const ModuleSection(
      {Key? key, required this.moduleData, this.isPurchased = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Container(
          decoration: BoxDecoration(
              color: Colors.green[100],
              borderRadius: BorderRadius.circular(10)),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: Theme(
            data: ThemeData().copyWith(
                dividerColor: Colors.transparent,
                unselectedWidgetColor: Colors.black, // here for close state
                colorScheme: ColorScheme.light(
                  primary: Colors.green,
                )),
            child:
                ExpandedTile(moduleData: moduleData, isPurchased: isPurchased),
          )),
    );
  }
}

class ExpandedTile extends StatelessWidget {
  const ExpandedTile({
    Key? key,
    required this.moduleData,
    required this.isPurchased,
  }) : super(key: key);

  final ModuleClass moduleData;
  final bool isPurchased;

  @override
  Widget build(BuildContext context) {
    return !isPurchased
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 1.8,
                child: Text(
                  moduleData.moduleName ?? "No Data",
                  maxLines: 2,
                  textAlign: TextAlign.start,
                ),
              ),
              Container(
                child: isPurchased ? Icon(Icons.lock_open) : Icon(Icons.lock),
              )
            ],
          )
        : ExpansionTile(
            title: Container(
              width: MediaQuery.of(context).size.width / 1.8,
              child: Text(
                moduleData.moduleName ?? "No Data",
                maxLines: 2,
                textAlign: TextAlign.start,
              ),
            ),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Type: " + (moduleData.moduleType ?? "No data"),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SelectAndClickableText(
                        title: "Zoomlink", data: moduleData.zoomLink),
                    SizedBox(
                      height: 10,
                    ),
                    SelectAndClickableText(
                        title: "Resource", data: moduleData.resources),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              )
            ],
          );
  }
}

class SelectAndClickableText extends StatelessWidget {
  const SelectAndClickableText({
    Key? key,
    required this.data,
    required this.title,
  }) : super(key: key);

  final String? data;
  final String title;

  @override
  Widget build(BuildContext context) {
    return (data != null) && (data!.isNotEmpty)
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("$title : "),
              GestureDetector(
                onTap: () async {
                  if (data!.isNotEmpty) {
                    await launch(data!);
                  }
                },
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.9,
                  child: Text(
                    (data ?? "No Data"),
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          )
        : Text("$title: No Data");
  }
}
