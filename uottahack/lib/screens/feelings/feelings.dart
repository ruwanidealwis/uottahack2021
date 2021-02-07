import 'package:flutter/material.dart';
import 'package:uottahack/screens/feelings/helpView.dart';

class FeelingSurvey extends StatefulWidget {
  @override
  _FeelingSurveyState createState() => _FeelingSurveyState();
}

class _FeelingSurveyState extends State<FeelingSurvey> {
  String _feeling = "Overwhelmed";

  void loadNextRoute(String feeling) {
    if (feeling == "null") {
      //load okay view
    } else {
      //load help view
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => HelpView(feeling: feeling)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Text("How Are You Feeling Today?"),
        RaisedButton(onPressed: null, child: Text("Overwhelmed")),
        RaisedButton(onPressed: null, child: Text("Anxious")),
        RaisedButton(onPressed: null, child: Text("Depressed")),
        RaisedButton(onPressed: null, child: Text("Frustrated")),
        RaisedButton(onPressed: null, child: Text("I'm Okay!")),
        ListTile(
          title: const Text('Depressed'),
          leading: Radio(
            value: "Depressed",
            groupValue: _feeling,
            onChanged: (String value) {
              setState(() {
                _feeling = value;
              });
            },
          ),
        ),
        ListTile(
            title: const Text('Anxious'),
            leading: Radio(
              value: "Anxious",
              groupValue: _feeling,
              onChanged: (String value) {
                setState(() {
                  _feeling = value;
                });
              },
            )),
        ListTile(
            title: const Text('Angry/Frustrated'),
            leading: Radio(
              value: "Angry/Frustratedous",
              groupValue: _feeling,
              onChanged: (String value) {
                setState(() {
                  _feeling = value;
                });
              },
            )),
        ListTile(
          title: const Text("I'm Okay!"),
          leading: Radio(
            value: "none",
            groupValue: _feeling,
            onChanged: (String value) {
              setState(() {
                _feeling = value;
              });
            },
          ),
        ),
      ],
    ));
  }
}
