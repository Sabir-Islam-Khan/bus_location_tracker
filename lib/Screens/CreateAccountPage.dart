import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Widgets/BezierContainer.dart';
import '../Animation/FadeAnimation.dart';

class CreateAccount extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CreateAccountState();
  }
}

class CreateAccountState extends State<CreateAccount> {

  TextEditingController nameController;
  TextEditingController mailController;
  TextEditingController passwordController;
  @override
  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Color(0xffe46b10)),
            ),
            Text('Back',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Color(0xffe46b10)))
          ],
        ),
      ),
    );
  }

  Widget _entryField(String title, {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color(0xffe46b10)),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
              obscureText: isPassword,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true),
          )
        ],
      ),
    );
  }

  Widget _submitButton() {
    return FadeAnimation(
      3.4, 
      GestureDetector(
        onTap: (){
          print("Name is $nameController");
          print("mail is $mailController");
          print("password is $passwordController");
        },
       child: Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.shade200,
                offset: Offset(2, 4),
                blurRadius: 5,
                spreadRadius: 2)
          ],
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xfffbb448), Color(0xfff7892b)])),
      child: FadeAnimation(
        1.5, 
        Text(
        'Register Now',
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
      )
    ),
      ),
    );
  }

  Widget _loginAccountLabel() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FadeAnimation(
            3.7, 
            Text(
            'Already have an account ?',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.white)
          ),
          ),
          SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {
            
            },
            child: FadeAnimation(
              3.7,
              Text(
              'Login',
              style: TextStyle(
                  color: Color(0xfff79c4f),
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),)
          )
        ],
      ),
    );
  }

  Widget _title() {
    return FadeAnimation(
      1.8,
      RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'B',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Color(0xffe46b10),
          ),
          children: [
            TextSpan(
              text: 'u',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
             TextSpan(
              text: 'S',
              style: TextStyle(color: Color(0xffe46b10), fontSize: 30),
            ),
            TextSpan(
              text: '  A',
              style: TextStyle(color: Color(0xffe46b10), fontSize: 30),
            ),
            TextSpan(
              text: 'p',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            TextSpan(
              text: 'P',
              style: TextStyle(color: Color(0xffe46b10), fontSize: 30),
            ),
          ]),
    ),
    );
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        FadeAnimation(2.2, _entryField("Username",),),
        FadeAnimation(2.6, _entryField("Email id",)),
        FadeAnimation(3.0, _entryField("Password",  isPassword: true)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(26, 26, 48, .9),
      body: SingleChildScrollView(
        child:Container(
          height: MediaQuery.of(context).size.height,
          child:Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: SizedBox(),
                    ),
                    _title(),
                    SizedBox(
                      height: 50,
                    ),
                    _emailPasswordWidget(),
                    SizedBox(
                      height: 20,
                    ),
                    _submitButton(),
                    Expanded(
                      flex: 2,
                      child: SizedBox(),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: _loginAccountLabel(),
              ),
              Positioned(top: 40, left: 0, child: _backButton()),
              Positioned(
                  top: -MediaQuery.of(context).size.height * .15,
                  right: -MediaQuery.of(context).size.width * .4,
                  child: FadeAnimation(1, BezierContainer()))
            ],
          ),
        )
      )
    );
  }
}

