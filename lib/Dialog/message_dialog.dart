import 'package:flutter/material.dart';

class MsgDialog {
  static showMsgDialog(BuildContext ctx, String msg, String title) {
    showDialog(
      context: ctx,
      builder: (ctx) {
        return AlertDialog(
          title: Text(
            title,
            style: Theme.of(ctx).textTheme.title,
          ),
          content: Text(
            msg,
            style: TextStyle(
              color: Colors.pink,
              fontWeight: FontWeight.bold,
              fontFamily: "Raleway",
              fontSize: 19,
            ),
          ),
          actions: <Widget>[
            FlatButton(
              splashColor: Colors.pink,
              onPressed: () => Navigator.of(ctx).pop(MsgDialog),
              child: Text(
                "OK",
                style: TextStyle(
                  color: Colors.pink,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Raleway",
                  fontSize: 19,
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
