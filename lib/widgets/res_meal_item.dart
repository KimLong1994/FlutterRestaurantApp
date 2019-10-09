import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../screens_restaurant/meal_detail_screen.dart';
import '../models/meal_model.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String imageUrl;
  final String title;
  final int duration;
  final Affordability affordability;
  final Complexity complexity;

  MealItem({
    @required this.id,
    @required this.imageUrl,
    @required this.title,
    @required this.duration,
    @required this.affordability,
    @required this.complexity,
  });

  String get complexityText {
    String text = "";
    switch (complexity) {
      case Complexity.Simple:
        text = "Simple";
        break;
      case Complexity.Challenging:
        text = "Challenging";
        break;
      case Complexity.Hard:
        text = "Hard";
        break;
    }
    return text;
  }

  String get affordabilityText {
    String text = "";
    switch (affordability) {
      case Affordability.Affordable:
        text = "Affordable";
        break;
      case Affordability.Pricey:
        text = "Pricey";
        break;
      case Affordability.Luxurious:
        text = "Luxurious";
        break;
    }
    return text;
  }

  void selectMealDetailItem(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(MealDetailScreen.routeName, arguments: {
      "id": id,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMealDetailItem(context),
      splashColor: Color.fromRGBO(255, 255, 255, 0.7),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.all(10),
        color: Colors.white,
        elevation: 10,
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.schedule),
                      SizedBox(width: 6),
                      Text("$duration min")
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.work),
                      SizedBox(width: 6),
                      Text(complexityText)
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.monetization_on),
                      SizedBox(width: 6),
                      Text(affordabilityText)
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
