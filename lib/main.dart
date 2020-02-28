import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';


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
              // id createData is called with dummy values, data saves on DB 
              // but here i am calling createData through getCurrentLocation
              // so it isn't working
              //see whats the problem
              print("Button pressed");
              _getCurrentLocation();
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


    // function for collecting Lat and Lon
   _getCurrentLocation() {
    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
    print("Geolocator called");
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      double lat = position.latitude;
      double lon = position.longitude;

      print("lat is $lat lon is $lon");
      createData(lat, lon);
    }).catchError((e) {
      print(e);
    });
  }

    // function for putting data in Firebase
    
    void createData(double lat, double lon) async {

      DocumentReference ref = await db.collection('LOCATIONS').add({'lat': '$lat', 'lon': '$lon'});

      print("Create data called");
    
  }
}
