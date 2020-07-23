import 'package:aschoologye/Screen/Maps.dart';
import 'package:aschoologye/Screen/Seminar.dart';
import 'package:aschoologye/Screen/about.dart';
import 'package:aschoologye/Screen/signup.dart';
import 'package:aschoologye/service/AuthService.dart';
import 'package:aschoologye/Screen/HomeIcon.dart';
import 'package:aschoologye/Screen/screen.dart';
import 'package:aschoologye/Screen/materi.dart';
import 'package:aschoologye/Screen/signin.dart';
import 'package:aschoologye/Screen/wrapper.dart';
import 'package:aschoologye/Screen/forum.dart';
import 'package:aschoologye/Screen/classAct.dart';
import 'package:aschoologye/Screen/Activity.dart';
import 'package:aschoologye/Screen/Profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:aschoologye/service/usersevice.dart';
import 'package:aschoologye/Screen/MainClas.dart';
import 'package:aschoologye/Screen/aclass.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.blueAccent,
    ),
  );
  runApp(MyAschoologye());
}

class MyAschoologye extends StatefulWidget {
  @override
  _MyAschoologyeState createState() => _MyAschoologyeState();
}

class _MyAschoologyeState extends State<MyAschoologye> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(home: Wrapper(), routes: <String, WidgetBuilder>{
        '/SignGoo': (BuildContext context) => new ScreenPage(),
        '/Home': (BuildContext context) => new HomeIcon(),
        '/SignUp': (BuildContext context) => new Signup(),
        '/EmailandPass': (BuildContext context) => new SigninPage(),
        '/Materi': (BuildContext context) => new Materi1(),
        '/Forum': (BuildContext context) => new ForumPage(),
        '/Accon': (BuildContext context) => new SeminarDashboard(),
        '/About': (BuildContext context) => new AboutPages(),
        '/Kelas': (BuildContext context) => new KelasDashboard(),
        '/Maps': (BuildContext context) => new MapsPage(),
        '/CalActiv': (BuildContext context) => new CalendarPage(),
        '/Profile': (BuildContext context) => new ProfilePages(),
        '/yutub': (BuildContext context) => new MyYutub(),
        '/listclas': (BuildContext context) => new Aclaas()
      }),
    );
  }
}
