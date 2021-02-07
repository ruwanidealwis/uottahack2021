import 'package:flutter/material.dart';
import 'reminders.dart';

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
        title: Text('Wellness App: Home Page'),
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
            ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        //tooltip: 'Increment',
        child: Text('profile'),
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
          //child: Image.asset('assets/images/raj_in_a_slumber.png'),
          //Text('QuoteBlock'),

          //color: Colors.grey,
          width: MediaQuery.of(context).size.width * 0.95,
          height: MediaQuery.of(context).size.height * 0.30,

          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "https://images.unsplash.com/photo-1579202673506-ca3ce28943ef"),
                  fit: BoxFit.cover)),
        ));
  }
}

class Reminders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.15,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Water(),
              Stretch(),
              Sleep(),
              //sleep
              //stretch
            ]));
  }
}

class Water extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
        onTap: () {
          print('INSERT WATER Reminder');
          showRemindersDialog(context, "water"); //, 'water');
        },
        child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Container(
                child: Text('water'),
                color: Colors.red,
                width: MediaQuery.of(context).size.width * 0.3,
                height: MediaQuery.of(context).size.height)));
  }
}

class Stretch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
        onTap: () {
          print('INSERT STRETCH REMINDER');
        },
        child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Container(
              child: Text('stretch'),
              color: Colors.red,
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.height * 0.35,
            )));
  }
}

class Sleep extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
        onTap: () {
          print('INSERT SLEEP REMINDER');
        },
        child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Container(
              child: Text('sleep'),
              color: Colors.red,
              width: MediaQuery.of(context).size.width * 0.30,
              height: MediaQuery.of(context).size.height * 0.35,
            )));
  }
}

class Feelings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
        onTap: () {
          print('INSERT FEELINGS REMINDER');
        },
        child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Container(
              child: Text('feelings'),
              color: Colors.green,
              width: MediaQuery.of(context).size.width * 0.95,
              height: MediaQuery.of(context).size.height * 0.35,
            )));
  }
}
