import 'package:flutter/material.dart';
import 'package:uottahack/screens/authentication/signIn.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return Container(child: SignIn());
  }
}
