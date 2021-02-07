import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:uottahack/screens/authentication/welcome.dart';
import 'package:uottahack/screens/home/home.dart';
import 'package:uottahack/screens/authentication/welcome.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    print(auth.currentUser);

    if (auth.currentUser == null) {
      return Welcome();
    } else {
      return HomePage();
    }
  }
}
