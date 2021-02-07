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
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Check In",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 50.0,
                  //fontFamily: c
              )),
          Image.asset('assets/images/timbit.png',
              height: 500,
              width: 500
              ),
          Container(
            child: Row(
              children: [
                RaisedButton(
                    onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => SignIn()));
                    },
                    padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.width * 0.10,
                      horizontal: MediaQuery.of(context).size.width * 0.15,
                    ),
                    child: Text("Sign In")),
                Spacer(),
                RaisedButton(
                    onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => Register()));
                    },
                    padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.width * 0.10,
                      horizontal: MediaQuery.of(context).size.width * 0.15,
                    ),
                    child: Text("Sign Up"))
              ],
            ),
          ),
        ],

      ),
    );
  }
}
