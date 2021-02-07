import 'package:flutter/material.dart';


showRemindersDialog(BuildContext context, String reminderType){
    // set up the buttons

    if (reminderType == "water"){
      print('water');
    }
    if (reminderType == "stretching"){
      print('stretch');
    }
    if (reminderType == "sleep"){
      print('sleep');
    }

    Widget mondayButton = FlatButton(
      child: Text("Monday"),
      onPressed:  () {},
    );
    Widget tuesdayButton = FlatButton(
      child: Text("Tuesday"),
      onPressed:  () {},
    );
    Widget wednesdayButton = FlatButton(
      child: Text("Wednesday"),
      onPressed:  () {},
    );
    Widget thursdayButton = FlatButton(
      child: Text("Thursday"),
      onPressed:  () {},
    );
    Widget fridayButton = FlatButton(
      child: Text("Friday"),
      onPressed:  () {},
    );
    Widget saturdayButton = FlatButton(
      child: Text("Saturday"),
      onPressed:  () {},
    );
    Widget sundayButton = FlatButton(
      child: Text("Sunday"),
      onPressed:  () {},
    );



    // set up the AlertDialog
    Dialog remindersDialog = Dialog(
        child: Container(
          height: 350,
          width: 350,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Text('Choose from Library',
                style: TextStyle(color: Colors.black, fontSize: 22.0),
                ),
              ),
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