import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:aschoologye/service/addfilecallbacl.dart';
import 'package:aschoologye/material/constans.dart';

import 'package:aschoologye/service/pojodata.dart';
import 'package:aschoologye/service/firebase_database_auth.dart';

class SeminarDashboard extends StatefulWidget {
  @override
  _SeminarPageState createState() => new _SeminarPageState();
}

class _SeminarPageState extends State<SeminarDashboard>
    implements AddSeminarCallback {
  bool _anchorToBottom = false;

  // instance of util class

  FirebaseDatabaseUtil databaseUtil;

  @override
  void initState() {
    super.initState();
    databaseUtil = new FirebaseDatabaseUtil();
    databaseUtil.initState();
  }

  @override
  void dispose() {
    super.dispose();
    databaseUtil.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // it will show title of screen

    Widget _buildTitle(BuildContext context) {
      return new InkWell(
        child: new Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                'Seminar Info',
                style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      );
    }

//It will show new seminar icon
    List<Widget> _buildActions() {
      return <Widget>[
        new IconButton(
          icon: const Icon(
            Icons.add_circle_outline,
            color: Colors.white,
          ), // display pop for new entry
          onPressed: () => showEditWidget(null, false),
        ),
      ];
    }

    return new Scaffold(
        backgroundColor: AsPalette.kLightYellow,
        appBar: new AppBar(
          backgroundColor: AsPalette.blue,
          title: _buildTitle(context),
          actions: _buildActions(),
        ),

        // Firebase predefile list widget. It will get Seminar info from firebase database
        body: new FirebaseAnimatedList(
          key: new ValueKey<bool>(_anchorToBottom),
          query: databaseUtil.getSeminar(),
          reverse: _anchorToBottom,
          sort: _anchorToBottom
              ? (DataSnapshot a, DataSnapshot b) => b.key.compareTo(a.key)
              : null,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            return new SizeTransition(
              sizeFactor: animation,
              child: showSeminar(snapshot),
            );
          },
        ),
        bottomNavigationBar: new Theme(
          data: Theme.of(context).copyWith(
            canvasColor: const Color.fromRGBO(8, 59, 102, 1),
          ), // sets the inactive color of the `BottomNavigationBar`
          child: new BottomNavigationBar(
            items: [
              new BottomNavigationBarItem(
                  icon: new IconButton(
                      icon: Icon(Icons.book, color: const Color(0xFFFFFFFF)),
                      onPressed: () => Navigator.pushNamed(context, '/Book')),
                  title: new Text(
                    "Class",
                    style: new TextStyle(
                      color: const Color(0xFFFFFFFF),
                    ),
                  )),
              new BottomNavigationBarItem(
                  icon: new IconButton(
                      icon: Icon(Icons.people, color: const Color(0xFFFFFFFF)),
                      onPressed: () =>
                          Navigator.pushNamed(context, '/Profile')),
                  title: new Text(
                    "Account",
                    style: new TextStyle(
                      color: const Color(0xFFFFFFFF),
                    ),
                  )),
              new BottomNavigationBarItem(
                  icon: new IconButton(
                      icon: Icon(Icons.home, color: const Color(0xFFFFFFFF)),
                      onPressed: () => Navigator.pushNamed(context, '/Home')),
                  title: new Text(
                    "Home",
                    style: new TextStyle(
                      color: const Color(0xFFFFFFFF),
                    ),
                  )),
            ],
          ),
        ));
  }

  @override // Call util method for add Seminar information
  void addSeminar(Seminar seminar) {
    setState(() {
      databaseUtil.addSeminar(seminar);
    });
  }

  @override // call util method for update old data.
  void update(Seminar seminar) {
    setState(() {
      databaseUtil.updateSeminar(seminar);
    });
  }

  //It will display a item in the list of Seminar

  Widget showSeminar(DataSnapshot res) {
    Seminar seminar = Seminar.fromSnapshot(res);

    var item = new Card(
      child: new Container(
          child: new Center(
            child: new Row(
              children: <Widget>[
                new CircleAvatar(
                  radius: 30.0,
                  child: new Text(getShortName(seminar)),
                  backgroundColor: const Color(0xFF20283e),
                ),
                new Expanded(
                  child: new Padding(
                    padding: EdgeInsets.all(10.0),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Text(
                          seminar.name,
                          // set some style to text
                          style: new TextStyle(
                              fontSize: 20.0, color: Colors.lightBlueAccent),
                        ),
                        new Text(
                          seminar.detail,
                          // set some style to text
                          style: new TextStyle(
                              fontSize: 20.0, color: Colors.lightBlueAccent),
                        ),
                        new Text(
                          seminar.link,
                          // set some style to text
                          style: new TextStyle(
                              fontSize: 20.0, color: Colors.lightBlueAccent),
                        ),
                        new Text(
                          seminar.info,
                          // set some style to text
                          style: new TextStyle(
                              fontSize: 20.0, color: Colors.amber),
                        ),
                      ],
                    ),
                  ),
                ),
                new Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new IconButton(
                      icon: const Icon(
                        Icons.edit,
                        color: const Color(0xFF167F67),
                      ),
                      onPressed: () => showEditWidget(seminar, true),
                    ),
                    new IconButton(
                      icon: const Icon(Icons.delete_forever,
                          color: const Color(0xFF167F67)),
                      onPressed: () => deleteSeminar(seminar),
                    ),
                  ],
                ),
              ],
            ),
          ),
          padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0)),
    );

    return item;
  }

  //Get first letter from the name of Seminar
  String getShortName(Seminar seminar) {
    String shortName = "";
    if (!seminar.name.isNotEmpty) {
      shortName = seminar.name.substring(0, 1);
    }
    return shortName;
  }

  //Display popup in Seminar info update mode.
  showEditWidget(Seminar seminar, bool isEdit) {
    showDialog(
      context: context,
      builder: (BuildContext context) => new AddSeminarDialog()
          .buildAboutDialog(context, this, isEdit, seminar),
    );
  }

  //Delete a entry from the Firebase console.
  deleteSeminar(Seminar seminar) {
    setState(() {
      databaseUtil.deleteSeminar(seminar);
    });
  }
}
