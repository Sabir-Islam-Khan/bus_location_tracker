import 'package:bus_location_tracker/Services/Auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:rflutter_alert/rflutter_alert.dart";

import '../Animation/FadeAnimation.dart';
import './CreateAccountPage.dart';
import '../Screens/HomePage.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  final AuthService _auth = AuthService();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //whole pages background colour
        backgroundColor: Color.fromRGBO(26, 26, 48, .9),
        body: SingleChildScrollView(
          // container for every other element
          child: Container(
            height: MediaQuery.of(context).size.height * 1,
            child: Column(
              children: <Widget>[
                // main image on the top
                Container(
                  height: MediaQuery.of(context).size.height * 0.45,
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
                            1.4,
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
                            2.0,
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
                          2.4,
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Color(0xffe46b10),
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
                                    style: new TextStyle(
                                      color: Colors.white,
                                    ),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Email Id",
                                      hintStyle: TextStyle(color: Colors.white),
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                    controller: nameController,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  child: TextField(
                                    style: new TextStyle(
                                      color: Colors.white,
                                    ),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Password",
                                      hintStyle: TextStyle(color: Colors.white),
                                    ),
                                    obscureText: true,
                                    controller: passwordController,
                                  ),
                                )
                              ],
                            ),
                          )),
                      SizedBox(
                        height: 40,
                      ),
                      FadeAnimation(
                        2.8,
                        // container for log in button
                        GestureDetector(
                          onTap: () async {
                            String mail = nameController.value.text;
                            String password = passwordController.value.text;

                            if (mail.isNotEmpty &&
                                password.isNotEmpty &&
                                password.length >= 6) {
                              dynamic result =
                                  await _auth.signInWithMail(mail, password);

                              if (result == null) {
                                Alert(
                                  context: context,
                                  type: AlertType.error,
                                  title: "Error !!",
                                  desc:
                                      "User not Found. Check credentials !",
                                  buttons: [
                                    DialogButton(
                                      child: Text(
                                        "Okay",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                      onPressed: () => Navigator.pop(context),
                                      width: 120,
                                    )
                                  ],
                                ).show();
                              } else {
                                
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>  HomePage())
                                );

                              }
                            } else {
                              print("Invalid");
                            }

                            nameController.clear();
                            passwordController.clear();
                          },
                          child: Container(
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
                                  Color(0xffe46b10),
                                  Color(0xffe46b10)
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
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      // Forget password text
                      FadeAnimation(
                          3.0,
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
                        3.2,
                        RaisedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CreateAccount()),
                            );
                          },
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
