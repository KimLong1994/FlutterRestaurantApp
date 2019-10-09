import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AnswerItem extends StatelessWidget {
  final String text;
  final Function selectAnswer;

  AnswerItem({
    @required this.text,
    @required this.selectAnswer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      margin: EdgeInsets.all(15),
      child: RaisedButton(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
        color: Theme.of(context).primaryColor,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 19,
            fontWeight: FontWeight.w700,
            fontFamily: " RobotoCondensed",
          ),
        ),
        onPressed: selectAnswer,
      ),
    );
  }
}
