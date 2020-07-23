import 'package:aschoologye/material/constans.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class MyYutub extends StatefulWidget {
  @override
  _MyYutubState createState() => _MyYutubState();
}

class _MyYutubState extends State<MyYutub> {
  VideoPlayerController playerController;
  VoidCallback listener;

  void initState() {
    super.initState();
    listener = () {
      setState(() {});
    };
  }

  void createVideo() {
    if (playerController == null) {
      playerController =
          VideoPlayerController.asset("vidasset/imagestorage.mp4")
            ..addListener(listener)
            ..setVolume(1.0)
            ..setLooping(true)
            ..seekTo(Duration(seconds: 1))
            ..initialize()
            ..play();
    } else {
      if (playerController.value.isPlaying) {
        playerController.pause();
      } else {
        playerController.initialize();
        playerController.play();
      }
    }
  }

  @override
  void deactivate() {
    playerController.setVolume(0.0);
    playerController.removeListener(listener);
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    Widget videoplayer = Center(
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Container(
          child: (playerController != null
              ? VideoPlayer(
                  playerController,
                )
              : Container()),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Class'),
      ),
      body: Container(
        color: AsPalette.kLightYellow,
        padding: EdgeInsets.all(15.1),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40.2),
              Text(
                'HOW TO STORAGE IMAGE ON FIREBASE STORE',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 35,
                ),
              ),
              videoplayer,
              SizedBox(height: 40.5),
              Text(
                '        Has we know that Firebase is one of the mBaaS that is quite well known among mobile developers because of its quite complete and good features including the following, Firebase Authentication, Firebase Database, Firebase Storag, Firebase Crashlytics, Firebase Cloud Messaging',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 20.5, width: 20.20),
              Text(
                '        Please note that to be able to start the project example this time we need a project in the Firebase Console. So, for those of you who havent been there or havent made a project in Firebase Console, please make it first. In this article I will not explain it because in my opinion the steps for making it are quite easy. Just make sure you all can download the google-service.json file for Android and GoogleService-Info.plist for iOS and enter the file into our project.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 10.1),
              Text(
                '        Pubspec.yaml preparation Now we need to open the pubspec.yaml file and change the dependencies section to look like this.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 10.1),
              Text(
                '        Pubspec.yaml preparation Now we need to open the pubspec.yaml file and change the dependencies section to look like this.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 10.5),
              Text(
                '        Pubspec.yaml preparation Now we need to open the pubspec.yaml file and change the dependencies section to look like this.',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
              ),
              Divider(),
              Container(
                padding: EdgeInsets.all(15.1),
                color: AsPalette.kLightYellow2,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20.0),
                    Text(
                      'Conclusion',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                    SizedBox(height: 20.5),
                    Text(
                      '      So the conclusion is that we have succeeded in making an application that uploads, displays images and deletes images from Firebase Storage in Flutter. And it is expected that with this Firebase Storage we have limited backend infrastructure resources for storing files from client side can be more helped, especially for mobile developers. For the complete code from the example project this time can be seen on Github.     ',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          createVideo();
          playerController.play();
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
