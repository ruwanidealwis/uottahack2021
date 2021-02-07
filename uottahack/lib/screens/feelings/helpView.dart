import 'package:flutter/material.dart';
import 'package:uottahack/Models/ReasourceModel.dart';
import 'package:uottahack/firebase/reasources.dart';

class HelpView extends StatefulWidget {
  final String type;
  HelpView({Key key, this.type}) : super(key: key);

  @override
  _HelpViewState createState() => _HelpViewState();
}

class _HelpViewState extends State<HelpView> {
  String message;
  List<String> links;
  String type = "Overwhelmed";
  Reasources reasource = new Reasources();
  @override
  void initState() {
    super.initState();
  }

  Future getReasource(feeling) async {
    print("in get reasources?");
    Reasources reasource = new Reasources();
    ReasourceData helpfulReasources = await reasource.getReasources(feeling);
    print("hello in gerReasources");
    print(helpfulReasources);
    return helpfulReasources;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ReasourceData>(
      future: reasource
          .getReasources(this.type), // function where you call your api
      builder: (BuildContext context, AsyncSnapshot<ReasourceData> snapshot) {
        // AsyncSnapshot<Your object type>
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: Text('Please wait its loading...'));
        } else {
          if (snapshot.hasError)
            return Center(child: Text('Error: ${snapshot.error}'));
          else
            return Scaffold(
                body: Column(children: [
              new Text('${snapshot.data.type}'),
              new Text('${snapshot.data.message}'),
            ])); // snapshot.data  :- get your object which is pass from your downloadData() function
        }
      },
    );
  }
}
