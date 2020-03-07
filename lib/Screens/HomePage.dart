import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Scaffold(

        appBar: AppBar( title: Text("Bus App"),
        backgroundColor: Color.fromRGBO(26, 26, 48, .9),),
      ),
    );
  }
}