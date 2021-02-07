import 'package:flutter/material.dart';
import 'package:uottahack/screens/feelings/helpView.dart';

class FeelingSurvey extends StatefulWidget {
  @override
  _FeelingSurveyState createState() => _FeelingSurveyState();
}

class _FeelingSurveyState extends State<FeelingSurvey> {
  String _feeling = "Overwhelmed";

  void loadNextRoute(String feeling) {
    print(feeling);
    if (feeling == "null") {
      //load okay view
    } else {
      //load help view
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => HelpView(type: feeling)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(205, 227, 244, 1),
        body: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child:Text("How Are You \nFeeling Today?",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 40.0,)
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.08,
          ),
          SizedBox(
            height: 80,
            width: 250,
            child: RaisedButton(
                color: Color.fromRGBO(197, 159, 238, 1),
                onPressed: () => loadNextRoute("Overwhelmed"),
                child: Text("Overwhelmed",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,))),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
            SizedBox(
              height: 80,
              width: 250,
              child: RaisedButton(
                color: Color.fromRGBO(197, 159, 238, 1),
                padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.03,
                  horizontal: MediaQuery.of(context).size.width * 0.18,
                ),
                onPressed: () => loadNextRoute("Anxious"),
                  child: Text("Anxious",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,))),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            SizedBox(
              height: 80,
              width: 250,
              child: RaisedButton(
                  color: Color.fromRGBO(197, 159, 238, 1),
                  padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.03,
                    horizontal: MediaQuery.of(context).size.width * 0.18,
                  ),
                  onPressed: () => loadNextRoute("Depressed"),
                  child: Text("Depressed",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,))),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            SizedBox(
              height: 80,
              width: 250,
              child: RaisedButton(
                color: Color.fromRGBO(197, 159, 238, 1),
                padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.03,
                  horizontal: MediaQuery.of(context).size.width * 0.18,
                ),
                onPressed: () => loadNextRoute("Frustrated"),
                child: Text("Frustrated",
                  style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,)
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            SizedBox(
              height: 80,
              width: 250,
              child: RaisedButton(
                  color: Color.fromRGBO(197, 159, 238, 1),
                  onPressed: () => loadNextRoute("I'm Okay!"),
                  child: Text("I'm Okay!",
                      style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,)
                      )
                  )
              ),

        ],
    ));
  }
}
