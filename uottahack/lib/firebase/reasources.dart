import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:uottahack/Models/ReasourceModel.dart';
import 'dart:math';

import 'package:uottahack/Models/ReminderModel.dart';

class Reasources {
  Future<ReasourceData> getReasources(String type) async {
    print("type " + type);
    CollectionReference reasources =
        FirebaseFirestore.instance.collection('Reasources');

    var result = await reasources.where('Type', isEqualTo: type).get();
    dynamic data = result.docs[0].data();
    return ReasourceData(
        links: data['Links'], type: data['Type'], message: data['Message']);
  }
}
