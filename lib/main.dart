import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './Services/Auth.dart';

import './Screens/login.dart';
import './Models/User.dart';

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