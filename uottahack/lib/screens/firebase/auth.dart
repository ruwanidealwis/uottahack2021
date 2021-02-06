import 'package:firebase_auth/firebase_auth.dart';

class Firebase {
  final FirebaseAuth auth = FirebaseAuth.instance;
  Future signIn() async {
    try {
      UserCredential result = await auth.signInAnonymously();
      User user = result.user;
      return user;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}
