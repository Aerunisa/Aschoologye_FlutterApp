import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:aschoologye/material/constans.dart';

import 'package:aschoologye/service/kelasaddback.dart';
import 'package:aschoologye/service/pojodata.dart';
import 'package:aschoologye/service/firebaseclass.dart';

class KelasDashboard extends StatefulWidget {
  @override
  _KelasDashboardState createState() => new _KelasDashboardState();
}

class _KelasDashboardState extends State<KelasDashboard>
    implements AddKelasCallback {
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
                'Choose Your Class',
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

//It will show new user icon
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

      // Firebase predefile list widget. It will get user info from firebase database
      body: new FirebaseAnimatedList(
        key: new ValueKey<bool>(_anchorToBottom),
        query: databaseUtil.getKelas(),
        reverse: _anchorToBottom,
        sort: _anchorToBottom
            ? (DataSnapshot a, DataSnapshot b) => b.key.compareTo(a.key)
            : null,
        itemBuilder: (BuildContext context, DataSnapshot snapshot,
            Animation<double> animation, int index) {
          return new SizeTransition(
            sizeFactor: animation,
            child: showKelas(snapshot),
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
                    onPressed: () => Navigator.pushNamed(context, '/Profile')),
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
      ),
    );
  }

  @override // Call util method for add user information
  void addKelas(Kelas kelas) {
    setState(() {
      databaseUtil.addKelas(kelas);
    });
  }

  @override // call util method for update old data.
  void update(Kelas kelas) {
    setState(() {
      databaseUtil.updateKelas(kelas);
    });
  }

  //It will display a item in the list of users.

  Widget showKelas(DataSnapshot res) {
    Kelas kelas = Kelas.fromSnapshot(res);

    var item = new Card(
      child: new Container(
          child: new Center(
            child: new Row(
              children: <Widget>[
                new CircleAvatar(
                  radius: 30.0,
                  child: new Text(getShortName(kelas)),
                ),
                new Expanded(
                  child: new Padding(
                    padding: EdgeInsets.all(10.0),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Text(
                          kelas.judul,
                          // set some style to text
                          style: new TextStyle(
                              fontSize: 20.0, color: Colors.lightBlueAccent),
                        ),
                        new Text(
                          kelas.linkyutube,
                          // set some style to text
                          style: new TextStyle(
                              fontSize: 10.0, color: Colors.lightBlueAccent),
                        ),
                        new Text(
                          kelas.materikelas,
                          // set some style to text
                          style: new TextStyle(
                              fontSize: 10.0, color: Colors.lightBlueAccent),
                        ),
                        new Text(
                          kelas.resume,
                          // set some style to text
                          style: new TextStyle(
                              fontSize: 10.0, color: Colors.lightBlueAccent),
                        ),
                        new Text(
                          kelas.info,
                          // set some style to text
                          style: new TextStyle(
                              fontSize: 10.0, color: Colors.amber),
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
                      onPressed: () => showEditWidget(kelas, true),
                    ),
                    new IconButton(
                      icon: const Icon(Icons.delete_forever,
                          color: const Color(0xFF167F67)),
                      onPressed: () => deleteKelas(kelas),
                    ),
                    // new IconButton(
                    //   icon: const Icon(
                    //     Icons.arrow_forward,
                    //     color: const Color(0xFF167F67),
                    //   ),
                    //   onPressed: () =>
                    //       Navigator.pushNamed(context, '/Realclass'),
                    // ),
                    ///////////////////////////////////////////////////////////
                  ],
                ),
              ],
            ),
          ),
          padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0)),
    );

    return item;
  }

  //Get first letter from the name of user
  String getShortName(Kelas kelas) {
    String shortName = "";
    if (!kelas.judul.isNotEmpty) {
      shortName = kelas.judul.substring(0, 1);
    }
    return shortName;
  }

  //Display popup in user info update mode.
  showEditWidget(Kelas kelas, bool isEdit) {
    showDialog(
      context: context,
      builder: (BuildContext context) => new AddKelasDialog()
          .buildAboutDialogKelas(context, this, isEdit, kelas),
    );
  }

  //Delete a entry from the Firebase console.
  deleteKelas(Kelas kelas) {
    setState(() {
      databaseUtil.deleteKelas(kelas);
    });
  }
}
