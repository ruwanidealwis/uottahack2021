import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:uottahack/Models/ReasourceModel.dart';

class Reasources {
  Future getReasources(String type) {
    CollectionReference reasources =
        FirebaseFirestore.instance.collection('Reasources');

    reasources.where('Type', isEqualTo: type).get().then((value) {
      print(value);
      //ReasourceData data = new ReasourceData(type, value.metadata.message, value.link);
      return value;
    });
    return null;
  }
}
