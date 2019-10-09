import 'package:flutter/material.dart';
import '../models/meal_model.dart';
import '../screens_restaurant/category_screen.dart';
import '../screens_restaurant/favorite_screen.dart';
import '../screens_thanos/kitchen_screen.dart';
import '../widgets/main_drawer_item.dart';

class TabScreen extends StatefulWidget {
  static const routeName = "/Tab-Screen";

  final List<Meal> favoriteMeals;

  TabScreen(this.favoriteMeals);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _currentIndex = 0;

  List<Map<String, Object>> _pages;

  @override
  void initState() {
    _pages = [
      {
        "page": CategoryScreen(),
        "title": "Categories",
      },
      {
        "page": FavoriteScreen(widget.favoriteMeals),
        "title": "Favorites",
      },
      {
        "page": KitchenScreen(),
        "title": "Thanos Kitchen",
      }
    ];
    super.initState();
  }

  void _selectedIndexPages(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _pages[_currentIndex]["title"],
          style: Theme.of(context).appBarTheme.textTheme.title,
        ),
      ),
      drawer: MainDrawer(),
      body: _pages[_currentIndex]["page"],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.black54,
        currentIndex: _currentIndex,
        onTap: _selectedIndexPages,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text(
              "Categories",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text(
              "Favorites",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.kitchen),
            title: Text(
              "Thanos Kitchen",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
