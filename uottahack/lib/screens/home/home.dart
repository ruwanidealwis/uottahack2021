import 'package:flutter/material.dart';

//This will become the home page (see Sandy's prototypes)

// We will probably need a s
class HomePage extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> {

  //define any class variables here
  //

  //define any state altering functions here
  //

  //the following method is run every time setState() is called
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('APP NAME'),
        ),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            //padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
            //center: true,
            //width: MediaQuery.of(context).size.width,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              QuoteBlock(),
              Reminders(),
              Feelings(),
            ]
          ),
        ),
    );
  }
}

class QuoteBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Container(
          child: Text('QuoteBlock'),
          color: Colors.grey,
          width: MediaQuery.of(context).size.width * 0.95,
          height: MediaQuery.of(context).size.height * 0.30,
        )
    );
  }
}

class Reminders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Container(
          child: Text('reminders'),
          color: Colors.red,
          width: MediaQuery.of(context).size.width * 0.95,
          height: MediaQuery.of(context).size.height * 0.20,
        ),
    );
  }
}

class Feelings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Container(
          child: Text('feelings'),
          color: Colors.green,
          width: MediaQuery.of(context).size.width * 0.95,
          height: MediaQuery.of(context).size.height * 0.35,
        )
    );
  }
}