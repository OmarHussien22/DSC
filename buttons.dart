import 'package:flutter/material.dart';

class MyButtons extends StatelessWidget {
  final color;
  final textColor;
  final String buttontext;
  final buttonTapped;

  MyButtons({this.color, this.textColor, this.buttontext,this.buttonTapped});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:buttonTapped,
   child: Padding(
      padding: EdgeInsets.all(8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Container(
          color: color,
          child: Center(
            child: Text(
              buttontext,
              style: TextStyle(color: textColor),
            ),
          ),
        ),
      ),
    ));
  }
}
