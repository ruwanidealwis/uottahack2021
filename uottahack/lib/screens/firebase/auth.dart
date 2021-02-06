import 'package:firebase_auth/firebase_auth.dart';

class FirebaseSignIn {
  final FirebaseAuth auth = FirebaseAuth.instance;
  Future regiser() async {
    try {
      UserCredential result = await auth.createUserWithEmailAndPassword(
          email: "ruwanide51@gmail.com", password: "hello!");
      User user = result.user;
      print(user);
      return user;
    } on FirebaseAuthException catch (e) {
      print(e.code);
    } catch (e) {
      print(e);
    }
  }

  Future signIn() async {
    try {
      UserCredential result = await auth.signInAnonymously();
      User user = result.user;
      print(user);
      return user;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}
