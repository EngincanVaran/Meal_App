import 'package:flutter/material.dart';

import "../screens/filters_screen.dart";

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, Icon icon, Function tapHandler) {
    return ListTile(
      onTap: tapHandler,
      leading: icon,
      title: Text(
        title,
        style: TextStyle(
          fontFamily: "RobotoCondensed",
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: const Text(
              "Cooking Up!",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Colors.pink, //Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile("Meals", Icon(Icons.restaurant, size: 26), () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile("Filters", Icon(Icons.settings, size: 26), () {
            Navigator.of(context)
                .pushReplacementNamed(FiltersScreen.screenRouteName);
          }),
        ],
      ),
    );
  }
}