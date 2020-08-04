import 'package:flutter/material.dart';

import './dummy_data.dart';
import './screens/tabs_screen.dart';
import 'models/meal.dart';
import 'screens/category_meals_screen.dart';
import 'screens/meal_detail_screen.dart';
import "screens/filters_screen.dart";

// Dummy Code to implement to to

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    "gluten": false,
    "lactose": false,
    "vegan": false,
    "vegetarian": false,
  };

  List<Meal> _avaliableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _avaliableMeals = DUMMY_MEALS.where((element) {
        if (_filters["gluten"] && !element.isGlutenFree) {
          return false;
        }
        if (_filters["lactose"] && !element.isLactoseFree) {
          return false;
        }
        if (_filters["vegan"] && !element.isVegan) {
          return false;
        }
        if (_filters["vegetarian"] && !element.isVegetarian) {
          return false;
        }

        return true; // filters passed add to the list
      }).toList();
    });
  }

  void _toggleFavorite(String mealID) {
    final int index =
        _favoriteMeals.indexWhere((element) => element.id == mealID);

    if (index >= 0)
      setState(() {
        _favoriteMeals.removeAt(index);
      });
    else
      setState(() {
        _favoriteMeals
            .add(DUMMY_MEALS.firstWhere((element) => element.id == mealID));
      });
  }

  bool _isMealFavorite(String mealID) {
    return _favoriteMeals.any((element) => element.id == mealID);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        //colorScheme: ColorScheme.fromSwatch(),
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: "Raleway",
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              bodyText2: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              headline6: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: "RobotoCondensed",
              ),
            ),
      ),
      initialRoute: '/', // default is /
      // home: TabsScreen(), //first screen to our App
      routes: {
        '/': (_) => TabsScreen(_favoriteMeals),
        CategoryMealsScreen.screenRouteName: (_) =>
            CategoryMealsScreen(_avaliableMeals),
        MealDetailScreen.screenRouteName: (_) =>
            MealDetailScreen(_toggleFavorite, _isMealFavorite),
        FiltersScreen.screenRouteName: (_) =>
            FiltersScreen(_setFilters, _filters),
      },

      // DEFAULT SCREEN
      onGenerateRoute: (settings) {
        print(settings.arguments);
        return MaterialPageRoute(
          builder: (ctx) => TabsScreen(_favoriteMeals),
        );
      },

      // 404 - PAGE NOT FOUND
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => TabsScreen(_favoriteMeals),
        );
      },
    );
  }
}
