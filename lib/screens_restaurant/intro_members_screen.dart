import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import '../data/data_chef.dart';
import '../screens_restaurant/intro_members_detail_screen.dart';
import '../widgets/chef_item.dart';
import '../widgets/chef_food_item.dart';
import '../widgets/main_drawer_item.dart';

class IntroMembersScreen extends StatelessWidget {
  static const routeName = "/Intro-Members-Screen";

  Widget buildContainerTitle(BuildContext ctx, String text) {
    return Container(
      margin: EdgeInsets.only(bottom: 40),
      child: Center(
        child: Text(
          text,
          style: Theme.of(ctx).textTheme.title,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Intro Our Members"),
      ),
      drawer: MainDrawer(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 40),
              height: screenHeight / 2,
              width: double.infinity,
              child: Carousel(
                boxFit: BoxFit.cover,
                animationDuration: Duration(milliseconds: 4000),
                animationCurve: Curves.easeInToLinear,
                images: [
                  AssetImage("assets/images/chef_1.jpg"),
                  AssetImage("assets/images/chef_2.jpg"),
                  AssetImage("assets/images/chef_3.jpg"),
                  AssetImage("assets/images/chef_4.jpg"),
                  AssetImage("assets/images/chef_5.jpg"),
                  AssetImage("assets/images/chef_6.jpg"),
                ],
              ),
            ),
            buildContainerTitle(context, "Top Chefs In The World"),
            Container(
              margin: EdgeInsets.only(bottom: 40),
              width: double.infinity,
              height: screenHeight / 2.2,
              child: ListView.builder(
                itemCount: DUMMY_CHEFS.length,
                itemBuilder: (ctx, index) {
                  return ChefItem(
                    id: DUMMY_CHEFS[index].id,
                    title: DUMMY_CHEFS[index].title,
                    description: DUMMY_CHEFS[index].description,
                    image: DUMMY_CHEFS[index].image,
                  );
                },
              ),
            ),
            buildContainerTitle(context, "Top Foods In The World"),
            Container(
              width: double.infinity,
              height: screenHeight / 2,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: DUMMY_FOODS.length,
                itemBuilder: (ctx, index) {
                  return ChefFoodItem(
                    title: DUMMY_FOODS[index].title,
                    image: DUMMY_FOODS[index].image,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
