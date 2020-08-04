import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String mealID;
  final String imageURL;
  final String title;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealItem({
    @required this.mealID,
    @required this.affordability,
    @required this.complexity,
    @required this.duration,
    @required this.imageURL,
    @required this.title,
  });

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return "Simple";
      case Complexity.Challenging:
        return "Challenging";
      case Complexity.Hard:
        return "Hard";
      default:
        return "Unkown";
    }
  }

  List<Widget> get affordabilityIcon {
    switch (affordability) {
      case Affordability.Affordable:
        return [Icon(Icons.attach_money)];
      case Affordability.Pricey:
        return [
          Icon(Icons.attach_money),
          Icon(Icons.attach_money),
        ];
      case Affordability.Luxurious:
        return [
          Icon(Icons.attach_money),
          Icon(Icons.attach_money),
          Icon(Icons.attach_money)
        ];
      default:
        return [Icon(Icons.error)];
    }
  }

  void selectMeal(BuildContext ctx) {
    Navigator.of(ctx)
        .pushNamed(
      MealDetailScreen.screenRouteName,
      arguments: mealID,
    )
        .then(
      (result) {
        // if (result != null) removeItem(result);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: const Radius.circular(15),
                    topRight: const Radius.circular(15),
                  ),
                  child: Image.network(
                    imageURL,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    width: 250,
                    color: Colors.black54,
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.schedule),
                      SizedBox(width: 5),
                      Text("$duration min"),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.work),
                      SizedBox(width: 5),
                      Text(complexityText),
                    ],
                  ),
                  Row(children: affordabilityIcon), // display the # of $
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
