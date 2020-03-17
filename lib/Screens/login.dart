import 'package:bus_location_tracker/Screens/HomePage.dart';
import 'package:bus_location_tracker/Services/Auth.dart';
import 'package:flutter/material.dart';
import "package:rflutter_alert/rflutter_alert.dart";
import 'package:shared_preferences/shared_preferences.dart';

import '../Animation/FadeAnimation.dart';
import './CreateAccountPage.dart';
import 'package:bus_location_tracker/Screens/BusFilter.dart';
import '../Screens/Loading.dart';

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

  bool loading = false; 
  bool isLogged = false; 

  // app initializer 

  @override
  void initState() {

    super.initState();

    screenChecker();

  }

  // function to determine loggedIn status. Called in Log in Button if true

    Future<bool> _loggedIn(bool state) async {
    final prefs = await SharedPreferences.getInstance();


    final test = await prefs.setBool('loginCheck', state);

    return test;

  }

  // fuction to determine which screen to show

  void screenChecker() async {

    final prefs = await SharedPreferences.getInstance();

    final checker = await prefs.getBool('loginCheck');

    if(checker == true ){

       Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>  BusFilter())
       );
    }
  }
  @override
  Widget build(BuildContext context) {

    return loading ? Loading() : Scaffold(
        
        // this line fix the error when keyboard pops up
        //whole pages background colour
        backgroundColor: Color.fromRGBO(26, 26, 48, .9),
        body: SingleChildScrollView(
                  child:  Column(
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
                          height: MediaQuery.of(context).size.height * 0.323,
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
                          height: MediaQuery.of(context).size.height * 0.327,
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
                          height: MediaQuery.of(context).size.height * 0.75,
                          width: MediaQuery.of(context).size.width * 1,
                          child: FadeAnimation(
                              2.0,
                              Container(
                                
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
                  Container(
                      width: MediaQuery.of(context).size.width * 1,
                      height: MediaQuery.of(context).size.height * 0.55,

                      child: Column(
                      // Column for User name and password
                      children: <Widget>[
                        Padding(padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.06),
                          ),
                        FadeAnimation(
                            2.4,
                            Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: MediaQuery.of(context).size.height * 0.175,
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
                            ),),
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

                                setState(() {
                                  loading = true;
                                });    
                                dynamic result =
                                    await _auth.signInWithMail(mail, password);

                                if (result == null) {

                                  setState(() {
                                    loading = false; 
                                  });

                                  _loggedIn(false);
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
                                  _loggedIn(true);
                                   Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) =>  BusFilter())
                                  ); 

                                }
                              } else {
                                print("Invalid");
                              }

                              nameController.clear();
                              passwordController.clear();
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.9,

                              height: MediaQuery.of(context).size.height * 0.06,
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
                    ),
                ],
              ),
            ),
          );
  }

}
