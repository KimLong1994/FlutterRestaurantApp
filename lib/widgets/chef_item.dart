import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../screens_restaurant/intro_members_detail_screen.dart';

class ChefItem extends StatelessWidget {
  final String id;
  final String image;
  final String title;
  final String description;

  ChefItem({
    @required this.id,
    @required this.image,
    @required this.title,
    @required this.description,
  });

  void selectChef(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      IntroMembersDetailScreen.routeName,
      arguments: {
        "id": id,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectChef(context),
      child: Card(
        elevation: 10,
        color: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        margin: EdgeInsets.all(10),
        child: Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
                width: 100,
                height: 100,
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Raleway",
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    description,
                    style: TextStyle(
                      color: Colors.blueGrey[100],
                      fontFamily: "Raleway",
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
