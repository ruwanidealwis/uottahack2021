import 'package:firebase_auth/firebase_auth.dart';
import 'package:uottahack/firebase/user.dart';

class FirebaseSignIn {
  final FirebaseAuth auth = FirebaseAuth.instance;
  Future regiser(String name, String email, String password) async {
    try {
      print(name);
      print(email);
      print(password);
      UserCredential result = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;

      DatabaseUser databaseUser = new DatabaseUser();
      databaseUser.addUser(name, email, user.uid);
      return user;
    } on FirebaseAuthException catch (e) {
      print(e.code);
      return e.code;
    } catch (e) {
      print(e);
      return e;
    }
  }

  Future signIn(String email, String password) async {
    try {
      UserCredential result = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      print(user);
      return user;
    } on FirebaseAuthException catch (e) {
      print(e.code);
      return e.code;
    } catch (error) {
      print(error.toString());
      return error;
    }
  }
}
