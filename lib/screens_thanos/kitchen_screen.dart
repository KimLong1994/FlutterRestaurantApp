import 'package:flutter/material.dart';
import '../data/data_thanos.dart';
import './kitchen_cook_screen.dart';
import '../widgets/vegetable_item.dart';
import '../widgets/stardishes_item.dart';

class KitchenScreen extends StatelessWidget {
  Widget buildTitle(String title, BuildContext ctx) {
    return Text(
      title,
      style: Theme.of(ctx).textTheme.title,
    );
  }

  Widget buildSubtitle(String subtitle) {
    return Text(
      subtitle,
      style: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 18,
        color: Colors.grey,
      ),
    );
  }

  Widget buildExpanded(String text, String subtitle, BuildContext ctx) {
    return Expanded(
      child: Column(
        children: <Widget>[
          buildTitle(text, ctx),
          SizedBox(height: 10),
          buildSubtitle(subtitle),
        ],
      ),
    );
  }

  void pushToKitchenCookScreen(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(KitchenCookScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          // TODO: Build Profile

          Container(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    "assets/images/avatar.png",
                    width: 90,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 30),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      buildTitle("Thanos \nRestaurant", context),
                      SizedBox(height: 10),
                      buildSubtitle("I am evitable"),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                buildExpanded("392k", "Followers", context),
                buildExpanded("328", "Likes", context),
                buildExpanded("256", "Dishes", context)
              ],
            ),
          ),

          // TODO: Build Star Dishes
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.yellow[100],
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(50),
                topLeft: Radius.circular(50),
              ),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          buildTitle("Star Dishes", context),
                          buildSubtitle("Thanos is funny")
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Icon(Icons.star, color: Colors.amber),
                          Icon(Icons.star, color: Colors.amber),
                          Icon(Icons.star, color: Colors.amber),
                          Icon(Icons.star, color: Colors.amber),
                          Icon(Icons.star, color: Colors.amber),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 210,
                  width: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: DUMMY_KITCHEN.length,
                    itemBuilder: (ctx, index) {
                      return StarDishesItem(
                          title: DUMMY_KITCHEN[index].title,
                          image: DUMMY_KITCHEN[index].image);
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          buildTitle("Hot Vegetable", context),
                          buildSubtitle("Excellent for vegan")
                        ],
                      ),
                      Material(
                        elevation: 20,
                        shadowColor: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        child: InkWell(
                          onTap: () => pushToKitchenCookScreen(context),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          splashColor: Theme.of(context).primaryColor,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 17),
                            child: Text(
                              "KITCHEN",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                fontFamily: "Raleway",
                                color: Colors.pink,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 250,
                  width: double.infinity,
                  child: ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      itemCount: DUMMY_VEGETABLE_KITCHEN.length,
                      itemBuilder: (ctx, index) {
                        return VegetableItem(
                          image: DUMMY_VEGETABLE_KITCHEN[index].image,
                          title: DUMMY_VEGETABLE_KITCHEN[index].title,
                        );
                      }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
