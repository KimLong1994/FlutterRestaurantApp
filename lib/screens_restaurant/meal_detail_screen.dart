import 'package:flutter/material.dart';
import '../data/data_restaurant.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = "/Meal-Detail-Screen";

  final Function toggleFavoriteMeals;
  final Function isFavoriteMeal;

  MealDetailScreen(this.toggleFavoriteMeals, this.isFavoriteMeal);

  Widget buildTitle(String text, BuildContext ctx) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(ctx).textTheme.title,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      height: 150,
      width: 300,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final receivedRouteArgsFromMealItem =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    //  receivedRouteArgsFromMealItem (m1,m2,m3...)

    final mealId = receivedRouteArgsFromMealItem["id"];
    final selectMealDetail =
        DUMMY_MEALS.firstWhere((item) => item.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text("${selectMealDetail.title}"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child:
                  Image.network(selectMealDetail.imageUrl, fit: BoxFit.cover),
            ),
            buildTitle("Ingredients", context),
            buildContainer(
              ListView.builder(
                itemCount: selectMealDetail.ingredients.length,
                itemBuilder: (ctx, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      child: Text(
                        "${selectMealDetail.ingredients[index]}",
                        style: TextStyle(
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            buildTitle("Steps", context),
            buildContainer(
              ListView.builder(
                itemCount: selectMealDetail.steps.length,
                itemBuilder: (ctx, index) {
                  return Column(
                    children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Theme.of(context).primaryColor,
                          child: Text(
                            "# ${index + 1}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        title: Text(
                          selectMealDetail.steps[index],
                          style: TextStyle(
                            fontSize: 18,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                      Divider(color: Theme.of(context).primaryColor),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: isFavoriteMeal(mealId)
            ? Icon(
                Icons.star,
                color: Theme.of(context).accentColor,
              )
            : Icon(
                Icons.star_border,
                color: Theme.of(context).accentColor,
              ),
        hoverColor: Theme.of(context).accentColor,
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () => toggleFavoriteMeals(mealId),
      ),
    );
  }
}
