import 'package:flutter/material.dart';

import 'screens/search/search-screen.dart';

class AppSingleton {
  static AppSingleton instance;

  Color dividerColor = Colors.white30;
  Color drawerBackground = Colors.black87;
  Color titleColor = Colors.white;
  Color appBarBgColor = Colors.red;

  List<Widget> defaultActions = <Widget>[
    new Builder(
     builder: (BuildContext context){
      return new IconButton(
       icon: new Icon(Icons.search, color: Colors.white),
       onPressed: (){
        Navigator.pushNamed(context, SearchScreen.routeName);
       },
      );
     },
    ),
    new IconButton(
        icon: new Icon(Icons.add_shopping_cart, color: Colors.white)),
  ];

  factory AppSingleton() {
    if (instance == null) {
      instance = new AppSingleton._internal();
    }

    return instance;
  }

  AppSingleton._internal();
}
