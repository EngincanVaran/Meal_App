import 'package:flutter/material.dart';

import './screens/tabs_screen.dart';
import 'screens/categories_screen.dart';
import 'screens/category_meals_screen.dart';
import 'screens/meal_detail_screen.dart';

// Dummy Code to implement to to

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
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
      //initialRoute: "/", // default is /
      home: TabsScreen(), //first screen to our App
      routes: {
        // "/": (_) => CategoriesScreen(),
        CategoryMealsScreen.screenRouteName: (_) => CategoryMealsScreen(),
        MealDetailScreen.screenRouteName: (_) => MealDetailScreen(),
      },

      // DEFAULT SCREEN
      onGenerateRoute: (settings) {
        print(settings.arguments);
        return MaterialPageRoute(
          builder: (ctx) => CategoriesScreen(),
        );
      },

      // 404 - PAGE NOT FOUND
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => CategoriesScreen(),
        );
      },
    );
  }
}
