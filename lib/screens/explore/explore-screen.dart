import 'package:flutter/material.dart';
import '../../app-singleton.dart';
import '../search/search-screen.dart';

class ExploreScreen extends StatefulWidget{
 static const routeName = '/';

 @override
 _ExploreScreen createState() => new _ExploreScreen();
}

class _ExploreScreen extends State<ExploreScreen> {
  static AppSingleton appSlt = new AppSingleton();
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  String _appBarTitle = 'MyMart';
  Widget _body;

  @override
  Widget build(BuildContext context) {

    if(_body==null)
    {
     _body = _buildDefault();
    }

    return new Scaffold(
      key: scaffoldKey,
      appBar: new AppBar(
       title: new Text(_appBarTitle),
       centerTitle: false,
       primary: true,
       backgroundColor: appSlt.appBarBgColor,
       leading: new Row(
         children: <Widget>[
           new IconButton(
               icon: new Icon(Icons.menu, color: Colors.white),
               onPressed: () {
                 scaffoldKey.currentState.openDrawer();
               })
         ],
       ),
       actions: appSlt.defaultActions,
      ),
      drawer: new Drawer(
       child: new Container(
         color: appSlt.drawerBackground,
         child: new ListView(
           padding: const EdgeInsets.only(top: 16.0),
           children: <Widget>[
             drawerButton('Explore', ExploreScreen.routeName),
             drawerButton('Account', ''),
             new Divider(color: appSlt.dividerColor),
             drawerButton('On Sale', ''),
             drawerButton('New', ''),
             drawerButton('Shop By Store', ''),
             new Divider(color: appSlt.dividerColor),
             drawerButton('Help', ''),
             drawerButton('Q & A', ''),
           ],
         ),
       ),
      ),
      backgroundColor: Colors.grey,
      body: _body,
    );
  }

  Widget _buildDefault(){
   return new ListView(
     children: <Widget>[
       new Container(
         height: 270.0,
         color: Colors.grey,
         margin: const EdgeInsets.only(bottom: 6.0),
         child: new Image(
             fit: BoxFit.cover,
             image: new NetworkImage(
                 'http://lorempixel.com/240/160/business/',
                 scale: 2.0)),
       ),
       _productCategoryCard(
           'http://lorempixel.com/240/100/food/',
           'Kichen & Dining',
           '8,324 Products',
           SearchScreen.routeName),
       _productCategoryCard(
           'http://lorempixel.com/240/100/people/',
           'Professional Hair Care',
           '820 Products',
           SearchScreen.routeName),
       _productCategoryCard(
           'http://lorempixel.com/240/100/technics/',
           'Professional Hair Care',
           '820 Products',
           SearchScreen.routeName),

     ],
   );
  }

  Widget _productCategoryCard(String imageUrl, String categoryTitle,
      String productCount, String namedRoute) {
    return new Builder(builder: (BuildContext context) {
       return new InkResponse(
        onTap: (){
         setState(() {
           _appBarTitle = 'Catalog Category';
           _body = _buildCatalogCategory();
         });
         // Navigator.pushNamed(context, namedRoute);
        },
        child: new Container(
         margin: const EdgeInsets.only(bottom: 6.0),
         color: Colors.white,
         child: new Column(
           children: <Widget>[
             new Container(
               color: Colors.grey,
               height: 175.0,
               child: new Image(
                   fit: BoxFit.cover,
                   image: new NetworkImage(imageUrl, scale: 2.0)),
             ),
             new Container(
               margin: const EdgeInsets.all(6.0),
               child: new Row(
                 mainAxisSize: MainAxisSize.max,
                 children: <Widget>[
                   new Expanded(
                     flex: 1,
                     child: new Text(categoryTitle),
                   ),
                   new Flexible(
                     child: new Align(
                       alignment: FractionalOffset.centerRight,
                       child: new Text(productCount),
                     ),
                   )
                 ],
               ),
             )
           ],
         ),
        ),
       );
    });
  }

  Widget drawerButton(String label, String routeName) {
    return new Builder(
      builder: (BuildContext context) {
        return new Align(
          alignment: FractionalOffset.centerLeft,
          child: new FlatButton(
            child: new Text(label,
             textAlign: TextAlign.left,
             style: new TextStyle(
               color: appSlt.titleColor,
             )
            ),
            onPressed: () {
              Navigator.pushNamed(context, routeName);
            },
          ),
        );
      },
    );
  }

  Widget _buildCatalogCategory(){
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

    return new Column(
     children: <Widget>[
      new Expanded(
       child: new Container(
        color: Colors.white,
        child: new Column(
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
        ),
       ),
      )
     ],
    );
  }
}
