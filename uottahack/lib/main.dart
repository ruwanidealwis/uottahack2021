import 'package:flutter/material.dart';
import 'package:uottahack/screens/authentication/authentication.dart';
import 'package:uottahack/screens/home/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:uottahack/screens/authentication/authentication.dart';

import 'package:uottahack/screens/home/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new HomePage(), //widget for first screen you're on!
    );
  }
}
