import "package:flutter/material.dart";

import '../dummy_data.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const screenRouteName = "/category-meals";
  // final String categoryID;
  // final String categoryTitle;

  // CategoryMealsScreen(
  //   this.categoryID,
  //   this.categoryTitle,
  // );

  @override
  Widget build(BuildContext context) {
    // get the arguments from the route and store it as always
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final String categoryTitle = routeArgs["title"];
    final String categoryID = routeArgs["id"];
    final categoryMeals = DUMMY_MEALS
        .where((element) => element.categories.contains(categoryID))
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            mealID: categoryMeals[index].id,
            affordability: categoryMeals[index].affordability,
            complexity: categoryMeals[index].complexity,
            duration: categoryMeals[index].duration,
            imageURL: categoryMeals[index].imageUrl,
            title: categoryMeals[index].title,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
