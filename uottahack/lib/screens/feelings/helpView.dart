import 'package:flutter/material.dart';
import 'package:uottahack/Models/ReasourceModel.dart';
import 'package:uottahack/firebase/reasources.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HelpView extends StatefulWidget {
  final String type;

  HelpView({Key key, this.type}) : super(key: key);

  @override
  _HelpViewState createState() => _HelpViewState();
}

class _HelpViewState extends State<HelpView> {
  String message;

  List<String> links;

  Reasources reasource = new Reasources();
  @override
  void initState() {
    super.initState();
  }

  Future getReasource(feeling) async {
    print(feeling);
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
          .getReasources(widget.type), // function where you call your api
      builder: (BuildContext context, AsyncSnapshot<ReasourceData> snapshot) {
        // AsyncSnapshot<Your object type>
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(
                child: Text('Please wait its loading...',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 40.0,)
                    ),
                )
            );
        } else {
          if (snapshot.hasError)
            return Center(
                child: Text('Error: ${snapshot.error}')
            );
          else
            return Scaffold(
                backgroundColor: Color.fromRGBO(205, 227, 244, 1),
                body: Column(children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Text('${snapshot.data.type}',
                    style: TextStyle(
                    color: Colors.black,
                      fontSize: 40.0,)
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Text('${snapshot.data.message}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,)
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  YoutubePlayer(
                    controller: YoutubePlayerController(
                      initialVideoId:
                          YoutubePlayer.convertUrlToId(snapshot.data.links[0]),
                      flags: YoutubePlayerFlags(
                        autoPlay: false,
                        mute: true,
                      ),
                    ),
                    showVideoProgressIndicator: true,
                    progressIndicatorColor: Colors.amber,
                    onReady: () {
                      print("player ready..");
                    },
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  YoutubePlayer(
                    controller: YoutubePlayerController(
                      initialVideoId:
                          YoutubePlayer.convertUrlToId(snapshot.data.links[1]),
                      flags: YoutubePlayerFlags(
                        autoPlay: false,
                        mute: true,
                      ),
                    ),
                    showVideoProgressIndicator: true,
                    progressIndicatorColor: Colors.amber,
                    onReady: () {
                      print("player ready..");
                    },
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  YoutubePlayer(
                    controller: YoutubePlayerController(
                      initialVideoId:
                          YoutubePlayer.convertUrlToId(snapshot.data.links[2]),
                      flags: YoutubePlayerFlags(
                        autoPlay: false,
                        mute: true,
                      ),
                    ),
                    showVideoProgressIndicator: true,
                    progressIndicatorColor: Colors.amber,
                    onReady: () {
                      print("player ready..");
                    },
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                ]
                )
            ); // snapshot.data  :- get your object which is pass from your downloadData() function
        }
      },
    );
  }
}
