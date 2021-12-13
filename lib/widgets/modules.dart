import 'package:flutter/material.dart';

class ModuleSection extends StatelessWidget {
  final String moduleTitle;
  final bool isPurchased;
  const ModuleSection(
      {Key? key, this.moduleTitle = "Module name", this.isPurchased = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Container(
        height: 70,
        decoration: BoxDecoration(
            color: Colors.green[100], borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Icon(Icons.settings),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.8,
              child: Text(
                moduleTitle,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              child: isPurchased ? Icon(Icons.lock_open) : Icon(Icons.lock),
            )
          ],
        ),
      ),
    );
  }
}
