import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ChefFoodItem extends StatelessWidget {
  final String title;
  final String image;

  ChefFoodItem({
    @required this.title,
    @required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: Theme.of(context).primaryColor,
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(25),
        ),
      ),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: Image.asset(
              image,
              height: 250,
              width: 300,
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontFamily: "Raleway",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
