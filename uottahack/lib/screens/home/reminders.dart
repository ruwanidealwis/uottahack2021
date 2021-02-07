import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uottahack/firebase/user.dart';

showRemindersDialog(BuildContext context, String reminderType) {
  // set up the buttons

  String titleText = "";

  if (reminderType == "water") {
    print('water');
    titleText = "drink water";
  }
  if (reminderType == "stretching") {
    print('stretch');
    titleText = "stretch";
  }
  if (reminderType == "sleep") {
    print('sleep');
    titleText = "sleep early";
  }

  // set up the AlertDialog
  Dialog remindersDialog = Dialog(
    child: Container(
      height: 350,
      width: 350,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(25.0),
            child: Text(
              'Set your scheduled reminders to ' + titleText,
              style: TextStyle(color: Colors.black, fontSize: 20.0),
            ),
          ),
          Main(reminderType: reminderType),
        ],
      ),
    ),
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return remindersDialog;
    },
  );
}

class Main extends StatefulWidget {
  final reminderType;
  Main({Key key, this.reminderType}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  String reminderType;
  void initState() {
    reminderType = widget.reminderType;
    super.initState();
  }

  /*
   CollectionReference reminders = FirebaseFirestore.instance.collection('Users');
   weekdata.forEach((k,v) => {
      reminders
        .add({k: v})
   });

    users
        .add({'name': name, 'email': email, 'UID': UID})
        .then((value) => print("User Added"))
        .catchError((error) {
      print("Failed to add user: $error");
      return false;
    });
    return true;
  }*/

  List<bool> isSelectedOne = [false, false, false, false];
  List<bool> isSelectedTwo = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: <Widget>[
      ToggleButtons(
        children: <Widget>[
          Text("Mon"),
          Text("Tue"),
          Text("Wed"),
          Text("Thur"),
        ],
        isSelected: isSelectedOne,
        onPressed: (int index) {
          setState(() {
            isSelectedOne[index] = !isSelectedOne[index];
          });
        },
      ),
      ToggleButtons(
        children: <Widget>[
          Text("Fri"),
          Text("Sat"),
          Text("Sun"),
        ],
        isSelected: isSelectedTwo,
        onPressed: (int index) {
          setState(() {
            isSelectedTwo[index] = !isSelectedTwo[index];
          });
        },
      ),
      Container(
          margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.10),
          color: Colors.deepPurpleAccent,
          child: TextButton(
            onPressed: () {
              DatabaseUser databaseUser = new DatabaseUser();
              databaseUser.addReminders(
                  reminderType, isSelectedOne, isSelectedTwo);
            },
            child: Text("Submit",
                style: TextStyle(color: Colors.black, fontSize: 20.0)),
          )),
    ]));
  }
}
