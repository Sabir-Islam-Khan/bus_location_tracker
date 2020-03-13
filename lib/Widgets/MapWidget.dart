
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';


import 'package:http/http.dart' as http;

var JSONURL = "https://bus-location-tracker-3313f.firebaseio.com/vehicles/test001.json";

class MapWidget extends StatefulWidget {

  @override
  createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {

  MapController mapController;

  // initial location for testing
  double lat = 24.91515, long = 84.43516666666666;
  @override
  void initState() {
    super.initState();
    mapController = MapController();
   updateLocation();
  }


  // function to fetch data from database and decode that
  void updateLocation(){
    http.get(JSONURL).then((response){
      print(response.body);
      var json_data = json.decode(response.body);
      setState(() {
        lat = json_data["gps_pos_x"];
        long = json_data["gps_pos_y"];
        mapController.move(LatLng(lat, long), zoom);
      });
       print("$lat, $long");
    });
  }

  // map zoom position NOTE: it's better with the range from 15-19
  double zoom = 17;

  @override
  Widget build(BuildContext context) {
    return Column(

      children: <Widget>[
        Container(

      height: MediaQuery.of(context).size.height * 0.6,
      width: MediaQuery.of(context).size.width * 1,
      child: new FlutterMap(
        mapController: mapController,
      options: new MapOptions(
        center: new LatLng(lat, long),
        zoom: zoom,
      ),
      layers: [
        new TileLayerOptions(
          urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
          subdomains: ['a', 'b', 'c']
        ),
        new MarkerLayerOptions(
          markers: [
            new Marker(
              width: 80.0,
              height: 80.0,
              point: new LatLng(lat, long),
              builder: (ctx) =>
              new Container(
                child: Image(
                  image: AssetImage('assets/bus-2.png')
                ),
              ),
            ),
          ],
        ),
      ],
    ),
    ),

    // button for testing purpose
    RaisedButton(
      onPressed: (){
        print("Called");
       updateLocation();
      },

      elevation: 20.0,
      color: Colors.blueAccent,
      child: Text("Refresh", style: TextStyle(fontSize: 20.0),),
    ),
      ],
    );
  }
}
