import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  static const String screenRouteName = "/meal-detail";

  @override
  Widget build(BuildContext context) {
    final String mealID = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text("Meal Details"),
      ),
      body: Center(
        child: Text("The Meal with id: " + mealID),
      ),
    );
  }
}
