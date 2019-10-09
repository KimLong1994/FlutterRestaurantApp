import 'package:flutter/material.dart';

class QuestionItem extends StatelessWidget {
  final String text;

  QuestionItem(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 22,
            fontFamily: "Raleway",
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
