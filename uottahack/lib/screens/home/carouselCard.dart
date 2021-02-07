import 'package:flutter/material.dart';
import 'package:uottahack/Models/ReminderModel.dart';

class CaraouselCard extends StatefulWidget {
  final ReminderModel reminderModel;
  CaraouselCard({Key key, this.reminderModel}) : super(key: key);

  @override
  _CaraouselCardState createState() => _CaraouselCardState();
}

class _CaraouselCardState extends State<CaraouselCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(widget.reminderModel.imageURL),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Hi",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold)),
          Text(widget.reminderModel.message,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
