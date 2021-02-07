import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uottahack/Models/ReminderModel.dart';
import 'package:uottahack/Models/UserModel.dart';
import 'package:intl/intl.dart';

class DatabaseUser {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<bool> addUser(String name, String email, String UID) async {
    CollectionReference users = FirebaseFirestore.instance.collection('Users');
    UserModel userModel = new UserModel(name: name, email: email, UID: UID);
    Map<String, dynamic> userData = userModel.toJson();

    try {
      await users.doc(UID).set(userData);
    } catch (e) {
      print(e);
      return false;
    }
    return true;
  }

  addReminders(String reminderType, List<bool> isSelectedOne,
      List<bool> isSelectedTwo) async {
    print(reminderType);
    //List weekDays =
    print(isSelectedOne);
    print(isSelectedTwo);
    isSelectedOne.addAll(isSelectedTwo);
    print(isSelectedOne);

    List weekdays = [
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday",
      "Sunday"
    ];

    var dictionaryWeek = {
      '0': 'Monday',
      '1': 'Tuesday',
      '2': 'Wednesday',
      '3': 'Thursday',
      '4': 'Friday',
      '5': 'Saturday',
      '6': 'Sunday',
    };
    var weekdata = new Map<String, bool>();

    for (var i = 0; i < weekdays.length; i++) {
      weekdata[weekdays[i]] = isSelectedOne[i];
    }
    print(weekdata);

    String uid = auth.currentUser.uid;

    for (var i = 0; i < isSelectedOne.length; i++) {
      String key = i.toString();
      print(dictionaryWeek[key]);
      print("Weekdata: ");
      print(isSelectedOne);
      if (isSelectedOne[i]) {
        await FirebaseFirestore.instance.collection('Users').doc(uid).update({
          "reminders.${dictionaryWeek[key]}":
              FieldValue.arrayUnion([reminderType])
        });
      }
    }
  }

  Future<List<ReminderModel>> getUsersReminders() async {
    DateTime date = DateTime.now();
    print("hellloooo!");
    var dictionaryWeek = {
      '0': 'Monday',
      '1': 'Tuesday',
      '2': 'Wednesday',
      '3': 'Thursday',
      '4': 'Friday',
      '5': 'Saturday',
      '6': 'Sunday',
    };
    int dayOfWeek = date.weekday - 1;
    String uid = auth.currentUser.uid;
    List<ReminderModel> reminderList = [];
    CollectionReference users = FirebaseFirestore.instance.collection('Users');
    print("GOT DATA.>>>");
    print(dictionaryWeek[dayOfWeek.toString()]);

    var result = await users.where('UID', isEqualTo: uid).get();
    dynamic data = result.docs[0].data();

    dynamic resultData =
        data['reminders'][dictionaryWeek[dayOfWeek.toString()]];
    //get all reminders for the specific day...
// .where('reminders.${dictionaryWeek[dayOfWeek.toString()]}')
    CollectionReference graphics =
        FirebaseFirestore.instance.collection('Graphics');
    print(resultData);
    for (var reminders in resultData) {
      print(reminders);
      var graphicData =
          await graphics.where('Type', isEqualTo: reminders).get();

      var reminderData = graphicData.docs[0].data();
      print(reminderData);
      reminderList.add(new ReminderModel(
          type: reminders,
          message: reminderData['Message'],
          imageURL: reminderData['ImageURL']));
    }
    print(reminderList[0].imageURL);
    return reminderList;
  }
}
