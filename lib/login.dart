import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget{

 static const routeName = '/login';

 @override
 Widget build(BuildContext context) {
  return new Scaffold(
   body: new Container(
    padding: const EdgeInsets.all(16.0),
    child: new Column(
     mainAxisAlignment: MainAxisAlignment.end,
     children: <Widget>[
      new Row(
       children: <Widget> [
        new Container(
         width: 70.0,
         child: new Text('Email'),
        ),
        new Flexible(
         child: new TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: new InputDecoration(
           hintText: ''
          )
         )
        )
       ]
      ),
      new Row(
       children: <Widget> [
        new Container(
         width: 70.0,
         child: new Text('Password'),
        ),
        new Flexible(
         child: new TextField(
          obscureText: true,
          decoration: new InputDecoration(
           hintText: ''
          )
         )
        )
       ]
      ),
      new Row(
       mainAxisAlignment: MainAxisAlignment.end,
       children: <Widget>[
        new RaisedButton(
         child: new Text(
          'Login',
          style: new TextStyle(
           color: Colors.white
          )),
         color: Colors.blue,
         onPressed: (){
          Navigator.of(context).pushNamed('/chat');
         }
        )
       ],
      )
     ],
    )
   )
  );
 }
}
