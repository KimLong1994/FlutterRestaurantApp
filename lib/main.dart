import 'package:flutter/material.dart';
import 'package:udemy_meal_thanos_app/screens_login_register/login_screen.dart';

import 'models/meal_model.dart';

import 'data/data_restaurant.dart';

import 'screens_restaurant/category_screen.dart';
import 'screens_restaurant/meal_screen.dart';
import 'screens_restaurant/meal_detail_screen.dart';
import 'screens_restaurant/tab_screen.dart';
import 'screens_restaurant/filter_screen.dart';
import 'screens_restaurant/intro_members_screen.dart';
import 'screens_restaurant/intro_members_detail_screen.dart';

import 'screens_thanos/kitchen_cook_screen.dart';
import 'screens_function/feed_back_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  /// Do filter (filter Screen) for meals (meal Screen)
  Map<String, bool> _filter = {
    "gluten": false,
    "lactose": false,
    "vegan": false,
    "vegetarian": false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filter = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filter["gluten"] && !meal.isGlutenFree) {
          return false;
        }
        if (_filter["lactose"] && !meal.isLactoseFree) {
          return false;
        }
        if (_filter["vegan"] && !meal.isVegan) {
          return false;
        }
        if (_filter["vegetarian"] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  /// Do favorite meals for favorite screen
  void _toggleFavoriteMeals(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);

    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(
          DUMMY_MEALS.firstWhere((meal) => meal.id == mealId),
        );
      });
    }
  }

  bool _isFavoriteMeals(String mealId) {
    return _favoriteMeals.any((meal) => meal.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        appBarTheme: ThemeData.light().appBarTheme.copyWith(
              textTheme: ThemeData.light().textTheme.copyWith(
                    title: TextStyle(
                      fontSize: 24,
                      fontFamily: "RobotoCondensed",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
            ),
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              title: TextStyle(
                fontSize: 22,
                fontFamily: "Raleway",
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      initialRoute: "/",
      routes: {
        "/": (ctx) => LogInScreen(),
        TabScreen.routeName: (ctx) => TabScreen(_favoriteMeals),
        MealScreen.routeName: (ctx) => MealScreen(_availableMeals),
        MealDetailScreen.routeName: (ctx) =>
            MealDetailScreen(_toggleFavoriteMeals, _isFavoriteMeals),
        FilterScreen.routeName: (ctx) => FilterScreen(_filter, _setFilters),
        IntroMembersScreen.routeName: (ctx) => IntroMembersScreen(),
        IntroMembersDetailScreen.routeName: (ctx) => IntroMembersDetailScreen(),
        KitchenCookScreen.routeName: (ctx) => KitchenCookScreen(),
        FeedBackScreen.routeName: (ctx) => FeedBackScreen(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoryScreen());
      },
    );
  }
}
