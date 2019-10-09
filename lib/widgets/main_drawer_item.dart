import 'package:flutter/material.dart';
import '../screens_function/feed_back_screen.dart';
import '../screens_login_register/login_screen.dart';
import '../screens_restaurant/tab_screen.dart';
import '../screens_restaurant/filter_screen.dart';
import '../screens_restaurant/intro_members_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTitle(String text, IconData icon, Function handleOnTap) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        text,
        style: TextStyle(
          color: Colors.black54,
          fontFamily: "Raleway",
          fontSize: 22,
        ),
      ),
      onTap: handleOnTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 15),
            color: Theme.of(context).accentColor,
            width: double.infinity,
            height: 100,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 35),
              child: Text(
                "Welcome Guest !",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  fontFamily: "RobotoCondensed",
                ),
              ),
            ),
          ),
          buildListTitle(
            "Intro Our Members",
            Icons.people,
            () {
              Navigator.of(context)
                  .pushReplacementNamed(IntroMembersScreen.routeName);
            },
          ),
          buildListTitle(
            "Back To Categories",
            Icons.restaurant,
            () {
              Navigator.of(context).pushReplacementNamed(TabScreen.routeName);
            },
          ),
          buildListTitle(
            "Filter Your Meals",
            Icons.fastfood,
            () {
              Navigator.of(context)
                  .pushReplacementNamed(FilterScreen.routeName);
            },
          ),
          buildListTitle(
            "FeedBack To Us",
            Icons.feedback,
            () {
              Navigator.of(context)
                  .pushReplacementNamed(FeedBackScreen.routeName);
            },
          ),
          buildListTitle(
            "Log Out",
            Icons.backspace,
            () {
              Navigator.of(context).pushReplacementNamed("/");
            },
          ),
        ],
      ),
    );
  }
}
