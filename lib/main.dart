import 'package:flutter/material.dart';

import 'animations/base-sliding-route.dart';

import 'screens/explore/explore-screen.dart';
import 'screens/search/search-screen.dart';
import 'login.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'MyMart',
    home: new ExploreScreen(),
    onGenerateRoute: (RouteSettings settings) {
      switch (settings.name) {
        case ExploreScreen.routeName:
          return new BaseSlidingRoute(
              builder: (_) => new ExploreScreen(), settings: settings);
        case LoginScreen.routeName:
          return new BaseSlidingRoute(
              builder: (_) => new LoginScreen(), settings: settings);
        case SearchScreen.routeName:
          return new BaseSlidingRoute(
              builder: (_) => new SearchScreen(), settings: settings);
      }
      assert(false);
    },
  ));
}
