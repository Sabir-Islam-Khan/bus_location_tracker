import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Container(

      color: Color.fromRGBO(26, 26, 48, .9),

      child: Center(
        child: SpinKitCubeGrid(
          color: Colors.white,
          size: 100,
          
        ),
      ),
    );
  }


}