import 'package:flutter/material.dart';
import 'Second.dart';

void main() => runApp(First());

class First extends StatelessWidget{
  Widget build (BuildContext context){
    return MaterialApp(
      home: Second (),
      theme: ThemeData(
        primaryColor: Color(0xFF0A0E21),
        accentColor: Colors.white,
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        textTheme: TextTheme(
         bodyText2: TextStyle(color: Colors.white)
        )
      ),
    );
  }
}

