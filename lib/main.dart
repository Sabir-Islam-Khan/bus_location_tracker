import 'package:flutter/material.dart';

import './Widgets/login.dart';

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
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}