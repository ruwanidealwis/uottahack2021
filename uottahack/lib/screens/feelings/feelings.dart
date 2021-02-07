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
        body: Column(
      children: <Widget>[
        Text("How Are You Feeling Today?"),
        RaisedButton(
            onPressed: () => loadNextRoute("Overwhelmed"),
            child: Text("Overwhelmed")),
        RaisedButton(
            onPressed: () => loadNextRoute("Anxious"), child: Text("Anxious")),
        RaisedButton(
            onPressed: () => loadNextRoute("Depressed"),
            child: Text("Depressed")),
        RaisedButton(
            onPressed: () => loadNextRoute("Frustrated"),
            child: Text("Frustrated")),
        RaisedButton(
            onPressed: () => loadNextRoute("I'm Okay!"),
            child: Text("I'm Okay!")),
      ],
    ));
  }
}
