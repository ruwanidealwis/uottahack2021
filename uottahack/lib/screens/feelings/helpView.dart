import 'package:flutter/material.dart';
import 'package:uottahack/Models/ReasourceModel.dart';
import 'package:uottahack/firebase/reasources.dart';

class HelpView extends StatefulWidget {
  final feeling;
  HelpView({Key key, this.feeling}) : super(key: key);

  @override
  _HelpViewState createState() => _HelpViewState();
}

class _HelpViewState extends State<HelpView> {
  String type;
  String message;
  List<String> links;
  Future getReasource(feeling) async {
    Reasources reasource = new Reasources();
    ReasourceData helpfulReasources = await reasource.getReasources(feeling);
    /*setState(() {
      message = helpfulReasources.message,
      type = helpfulReasources.type,
      links = helpfulReasources.links,
    });*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Text(type),
      Text(message),
    ]));
  }
}
