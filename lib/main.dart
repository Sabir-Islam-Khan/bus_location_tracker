import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

main() {
  runApp(BusLocationTracker());
}

class BusLocationTracker extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BusLocationTrackerState();
  }
}

class BusLocationTrackerState extends State<BusLocationTracker> {
  final db = Firestore.instance; 
  Location location = new Location();
  func() async {
    print("\n\n Func Called");
    LocationData test = await location.getLocation();

    print("Location is $test");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Bus Location Tracker"),
        ),
        body: Container(
          height: 400.0,
          width: 300.0,
          color: Colors.amberAccent,
          child: RaisedButton(
            color: Colors.amberAccent,
            onPressed: () {
              print("Button pressed");
              func();
              createData();
            },
            child: Text(
              "Update Location",
              style: TextStyle(color: Colors.blueAccent, fontSize: 30.0),
            ),
          ),
        ),
      ),
    );
  }
    void createData() async {

      DocumentReference ref = await db.collection('LOCATIONS').add({'lat': 'Test Lat', 'lon': 'test lon'});

      print("Create data called");
    
  }
}
