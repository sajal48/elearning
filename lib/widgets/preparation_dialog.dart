import 'package:flutter/material.dart';

class PreparationDialog extends StatelessWidget {
  const PreparationDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 339,
        width: 303,
        color: Colors.amber,
      ),
    );
  }
}
