import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:uottahack/Models/ReminderModel.dart';
import 'package:uottahack/firebase/user.dart';
import 'package:uottahack/screens/feelings/feelings.dart';
import 'package:uottahack/screens/home/carouselCard.dart';
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
        title: Text('Wellness App: Home Pagez'),
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

class QuoteBlock extends StatefulWidget {
  @override
  _QuoteBlockState createState() => _QuoteBlockState();
}

class _QuoteBlockState extends State<QuoteBlock> {
  DatabaseUser user = new DatabaseUser();
  Future future;
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();

    // assign this variable your Future
    future = user.getUsersReminders();
  }

  @override
  Widget build(BuildContext context) {
    List<T> map<T>(List list, Function handler) {
      List<T> result = [];
      for (var i = 0; i < list.length; i++) {
        result.add(handler(i, list[i]));
      }
      return result;
    }

    return FutureBuilder<List<ReminderModel>>(
      future: future, // function where you call your api
      builder:
          (BuildContext context, AsyncSnapshot<List<ReminderModel>> snapshot) {
        // AsyncSnapshot<Your object type>
        if (snapshot.connectionState == ConnectionState.waiting) {
          return ClipRRect(child: Text('Loading Your Reminders...'));
        } else {
          if (snapshot.hasError)
            return ClipRRect(child: Text('Error: ${snapshot.error}'));
          else
            return ClipRRect(
                child: Column(children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: 200.0,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  pauseAutoPlayOnTouch: true,
                  aspectRatio: 2.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
                items: snapshot.data.map((card) {
                  return Builder(builder: (BuildContext context) {
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.30,
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        color: Color.fromRGBO(197, 160, 238, 1),
                        child: CaraouselCard(reminderModel: card),
                      ),
                    );
                  });
                }).toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: map<Widget>(snapshot.data, (index, url) {
                  return Container(
                    width: 10.0,
                    height: 10.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == index
                          ? Colors.blueAccent
                          : Colors.grey,
                    ),
                  );
                }),
              ),
            ])); // snapshot.data  :- get your object which is pass from your downloadData() function
        }
      },
    );
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
                child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/icon_water.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Text('water'),
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.height))));
  }
}

class Stretch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
        onTap: () {
          print('INSERT STRETCH REMINDER');
          showRemindersDialog(context, "stretching");
        },
        child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/icon_stretch.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Text('stretch'),
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
          showRemindersDialog(context, "sleep");
        },
        child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/icon_sleep.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Text('sleep'),
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
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => FeelingSurvey()));
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
