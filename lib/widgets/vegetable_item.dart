import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class VegetableItem extends StatelessWidget {
  final String title;

  final String image;

  VegetableItem({
    @required this.title,
    @required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              child: Image.asset(
                image,
                height: 100,
                width: 80,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        title,
                        style: Theme.of(context).textTheme.title,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: <Widget>[
                      Icon(Icons.star, color: Theme.of(context).accentColor),
                      Icon(Icons.star, color: Theme.of(context).accentColor),
                      Icon(Icons.star, color: Theme.of(context).accentColor),
                      Icon(Icons.star, color: Theme.of(context).accentColor),
                      Icon(Icons.star, color: Theme.of(context).accentColor),
                    ],
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
