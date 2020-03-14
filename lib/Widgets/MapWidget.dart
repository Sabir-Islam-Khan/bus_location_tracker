
import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:geocoder/geocoder.dart';
import 'package:location/location.dart';

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
   locationTimer();
  }

  // function for updating location each 5 second

  void locationTimer() {
     Timer.periodic(Duration(seconds: 5), (timer) {
        print("Location Updated");
        updateLocation();
      });
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
    });
  }

  // map zoom position NOTE: it's better with the range from 15-19
  double zoom = 16;

  // geocoding section NOT WORKING
  void getAddress() async {

    final coordinates = new Coordinates(25.91505833333334, 89.43475666666669);
    var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
    print(addresses);

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(

      height: MediaQuery.of(context).size.height * 0.8,
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
    RaisedButton(
      onPressed: (){
        
      },
      child: Text("Get Address"),
    ),
      ],
    );
  }
}
