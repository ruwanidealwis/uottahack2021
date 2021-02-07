import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class DatabaseUser {
  bool addUser(String name, String email, String UID) {
    CollectionReference users = FirebaseFirestore.instance.collection('Users');

    users
        .add({'name': name, 'email': email, 'UID': UID})
        .then((value) => print("User Added"))
        .catchError((error) {
          print("Failed to add user: $error");
          return false;
        });
    return true;
  }

  bool addReminders(String UID, String day, String reminder)
  {

  }
  {

  }
}
