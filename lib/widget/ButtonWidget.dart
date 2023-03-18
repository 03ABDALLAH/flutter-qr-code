import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;
  final Color color;
  const ButtonWidget({Key? key, required this.text, required this.onClicked, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(
        text,
        style: TextStyle(),
      ),
      // shape: StadiumBorder(),
      color: color,
      textColor: Colors.white,
      onPressed: onClicked,
    );
  }
}