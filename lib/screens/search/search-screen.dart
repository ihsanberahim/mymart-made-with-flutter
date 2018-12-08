import 'package:flutter/material.dart';
import '../../app-singleton.dart';

class SearchScreen extends StatefulWidget{
 static const String routeName = '/search';

 @override
 _SearchScreen createState() => new _SearchScreen();
}

class _SearchScreen extends State<SearchScreen> {
  static AppSingleton appSlt = new AppSingleton();

  @override
  Widget build(BuildContext context) {
    List<Container> _catList = new Iterable.generate(12, (i) => i)
        .map((i) => new Container(
              height: 60.0,
              width: 60.0,
              color: Colors.grey,
              margin: const EdgeInsets.only(left: 3.0, bottom: 3.0),
            ))
        .toList();

    List<Container> _productList = new Iterable.generate(30, (i) => i)
        .map((i) => new Container(height: 170.0, color: Colors.grey))
        .toList();

    return new Scaffold(
        appBar: new AppBar(
          backgroundColor: appSlt.appBarBgColor,
          title: new Text('Catalog Category'),
          actions: appSlt.defaultActions,
        ),
        body: new Column(
          children: <Widget>[
            new Container(
              margin: const EdgeInsets.only(top: 3.0),
              height: 60.0,
              child: new ListView(
                scrollDirection: Axis.horizontal,
                children: _catList,
              ),
            ),
            new Expanded(
                flex: 1,
                child: new GridView.count(
                  crossAxisCount:
                      MediaQuery.of(context).orientation == Orientation.portrait
                          ? 2
                          : 3,
                  mainAxisSpacing: 3.0,
                  crossAxisSpacing: 3.0,
                  padding: const EdgeInsets.only(left: 3.0, right: 3.0),
                  children: _productList,
                ))
          ],
        ));
  }
}
