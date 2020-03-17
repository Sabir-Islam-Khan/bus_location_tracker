import 'package:flutter/material.dart';

import '../Widgets/MapWidget.dart';
class HomePage extends StatefulWidget {

  final String busId;

  HomePage(this.busId);

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

        body: Container(
         child: MapWidget(
           widget.busId,
         ),
           
        ),
      ),
    );
  }
}