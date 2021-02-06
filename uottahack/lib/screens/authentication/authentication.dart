import 'package:flutter/material.dart';
import 'package:uottahack/screens/authentication/register.dart';
import 'package:uottahack/screens/authentication/signIn.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        RaisedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => SignIn()));
            },
            child: Text("Sign In")),
        RaisedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Register()));
            },
            child: Text("Sign Up"))
      ],
    ));
  }
}
