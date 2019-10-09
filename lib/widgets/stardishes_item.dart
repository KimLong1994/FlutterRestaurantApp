import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class StarDishesItem extends StatelessWidget {
  final String title;
  final String image;

  StarDishesItem({
    @required this.title,
    @required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 10,
      ),
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                  width: 150,
                  height: 200,
                ),
              ),
              Positioned(
                top: 20,
                left: 20,
                child: Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    fontFamily: "Raleway",
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
