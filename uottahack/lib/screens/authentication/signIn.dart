import 'package:flutter/material.dart';
import 'package:uottahack/screens/authentication/authentication.dart';
import 'package:uottahack/screens/firebase/auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final FirebaseSignIn _auth = FirebaseSignIn();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: RaisedButton(
                child: Text("Sign In"),
                onPressed: () async {
                  dynamic result = await _auth.regiser();
                  return (result);
                })));
  }
}
