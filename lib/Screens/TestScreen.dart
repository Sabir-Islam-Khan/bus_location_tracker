import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Container(
     height: 400.0,
     width: 300.0,
     color: Colors.amberAccent,
     child: Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left:30.0, top: 30.0),
          child: Text("Test Screen", style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),),
        ),
        Container(
          padding: EdgeInsets.only(left:30.0, top: 30.0),
          child: Text("Registration Succesfull", style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),),
        ),
      ], 
     ),
    );
  }
}