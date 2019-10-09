import 'package:flutter/material.dart';

class LoadingDialog {
  static void showLoadingDialog(BuildContext ctx, String msg) {
    showDialog(
      context: ctx,
      barrierDismissible: false,
      builder: (ctx) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            color: Colors.white,
            height: 120,
            child: Column(
              children: <Widget>[
                SizedBox(height: 15),
                CircularProgressIndicator(
                  backgroundColor: Colors.pink,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Text(
                    msg,
                    style: Theme.of(ctx).textTheme.title,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static void hideLoadingDialog(BuildContext ctx) {
    Navigator.of(ctx).pop(LoadingDialog);
  }
}
