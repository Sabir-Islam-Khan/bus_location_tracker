import 'package:flutter/material.dart';
import '../Animation/FadeAnimation.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //whole pages background colour
        backgroundColor: Color.fromRGBO(26, 26, 48, .9),
        body: SingleChildScrollView(
          // container for every other element
          child: Container(
            child: Column(
              children: <Widget>[
                // main image on the top
                Container(
                  height: 400,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/background.png'),
                          fit: BoxFit.fill)),
                  child: Stack(
                    children: <Widget>[
                      // Fast animation text
                      Positioned(
                        left: 50,
                        width: 180,
                        height: 300,
                        child: FadeAnimation(
                            1,
                            Container(
                              width: 120.0,
                              margin: EdgeInsets.only(top: 235.0),
                              child: Text(
                                "Fast, Free",
                                style: TextStyle(
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            )),
                      ),
                      // second animation text
                      Positioned(
                        left: 230,
                        width: 190,
                        height: 270,
                        child: FadeAnimation(
                            2.5,
                            Container(
                              margin: EdgeInsets.only(top: 235.0),
                              child: Text(
                                "Anywhere",
                                style: TextStyle(
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            )),
                      ),
                      // App title animation
                      Positioned(
                        child: FadeAnimation(
                            1.6,
                            Container(
                              margin: EdgeInsets.only(top: 260),
                              child: Center(
                                child: Text(
                                  "Bus App",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )),
                      )
                    ],
                  ),
                  // End of top section
                ),
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    // Column for User name and password
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(top: 20.0)),
                      FadeAnimation(
                          1.8,
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(201, 146, 8, 1),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.indigoAccent,
                                      blurRadius: 20.0,
                                      offset: Offset(0, 10))
                                ]),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom:
                                              BorderSide(color: Colors.white))),
                                  child: TextField(
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Email or Phone number",
                                        hintStyle:
                                            TextStyle(color: Colors.white)),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  child: TextField(
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Password",
                                        hintStyle:
                                            TextStyle(color: Colors.white)),
                                  ),
                                )
                              ],
                            ),
                          )),
                      SizedBox(
                        height: 40,
                      ),
                      FadeAnimation(
                          2,
                          // container for log in button
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.indigoAccent,
                                      blurRadius: 20.0,
                                      offset: Offset(0, 10)),
                                ],
                                gradient: LinearGradient(colors: [
                                  Color.fromRGBO(212, 153, 6, 1),
                                  Color.fromRGBO(250, 180, 5, 1),
                                ])),
                            child: Center(
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.grey[300],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25.0),
                              ),
                            ),
                          )),
                      SizedBox(
                        height: 30,
                      ),
                      // Forget password text
                      FadeAnimation(
                          1.5,
                          Text(
                            "Forgot Password?",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      // animated create id button
                      FadeAnimation(
                        1.5,
                        RaisedButton(
                          onPressed: () {},
                          color: Colors.white,
                          child: Text(
                            "Create Account",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}