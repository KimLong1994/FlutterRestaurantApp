import 'package:flutter/material.dart';
import '../models/meal_model.dart';
import '../widgets/res_meal_item.dart';

class MealScreen extends StatefulWidget {
  static const routeName = "/Meal-Screen";

  final List<Meal> availableMeal;

  MealScreen(this.availableMeal);

  @override
  _MealScreenState createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
  String routeArgsTitle;
  List<Meal> selectMeals;
  var _loadingData = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadingData) {
      final receivedRouteArgsFromCategoryItem =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      final routeArgsId = receivedRouteArgsFromCategoryItem["id"];
      routeArgsTitle = receivedRouteArgsFromCategoryItem["title"];
      selectMeals = widget.availableMeal
          .where((meal) => meal.categories.contains(routeArgsId))
          .toList();
    }
    _loadingData = true;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          routeArgsTitle,
          style: Theme.of(context).appBarTheme.textTheme.title,
        ),
      ),
      body: ListView.builder(
        itemCount: selectMeals.length,
        itemBuilder: (ctx, index) {
          return MealItem(
            id: selectMeals[index].id,
            title: selectMeals[index].title,
            duration: selectMeals[index].duration,
            imageUrl: selectMeals[index].imageUrl,
            affordability: selectMeals[index].affordability,
            complexity: selectMeals[index].complexity,
          );
        },
      ),
    );
  }
}
