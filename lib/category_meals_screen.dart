import "package:flutter/material.dart";

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

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: const Text("The Recipes for meals"),
      ),
    );
  }
}
