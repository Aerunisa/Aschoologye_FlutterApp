import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:aschoologye/service/addfilecallbacl.dart';
import 'package:aschoologye/material/constans.dart';

import 'package:aschoologye/service/pojodata.dart';
import 'package:aschoologye/service/firebase_database_auth.dart';

class ForumPage extends StatefulWidget {
  @override
  _ForumPageState createState() => new _ForumPageState();
}

class _ForumPageState extends State<ForumPage> implements AddForumCallback {
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
                'Forum',
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

//It will show new Forum icon
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

      // Firebase predefile list widget. It will get Forum info from firebase database
      body: new FirebaseAnimatedList(
        key: new ValueKey<bool>(_anchorToBottom),
        query: databaseUtil.getForum(),
        reverse: _anchorToBottom,
        sort: _anchorToBottom
            ? (DataSnapshot a, DataSnapshot b) => b.key.compareTo(a.key)
            : null,
        itemBuilder: (BuildContext context, DataSnapshot snapshot,
            Animation<double> animation, int index) {
          return new SizeTransition(
            sizeFactor: animation,
            child: showForum(snapshot),
          );
        },
      ),
    );
  }

  @override // Call util method for add Forum information
  void addForum(Forum forum) {
    setState(() {
      databaseUtil.addForum(forum);
    });
  }

  @override // call util method for update old data.
  void update(Forum forum) {
    setState(() {
      databaseUtil.updateForum(forum);
    });
  }

  //It will display a item in the list of Forum

  Widget showForum(DataSnapshot res) {
    Forum forum = Forum.fromSnapshot(res);

    var item = new Card(
      child: new Container(
          child: new Center(
            child: new Row(
              children: <Widget>[
                new CircleAvatar(
                  radius: 30.0,
                  child: new Text(getShortName(forum)),
                  backgroundColor: const Color(0xFF20283e),
                ),
                new Expanded(
                  child: new Padding(
                    padding: EdgeInsets.all(10.0),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Text(
                          forum.nama,
                          // set some style to text
                          style: new TextStyle(
                              fontSize: 20.0, color: Colors.lightBlueAccent),
                        ),
                        new Text(
                          forum.question,
                          // set some style to text
                          style: new TextStyle(
                              fontSize: 20.0, color: Colors.lightBlueAccent),
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
                      onPressed: () => showEditWidget(forum, true),
                    ),
                    new IconButton(
                      icon: const Icon(Icons.delete_forever,
                          color: const Color(0xFF167F67)),
                      onPressed: () => deleteForum(forum),
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

  //Get first letter from the name of Forum
  String getShortName(Forum forum) {
    String shortName = "";
    if (!forum.nama.isNotEmpty) {
      shortName = forum.nama.substring(0, 1);
    }
    return shortName;
  }

  //Display popup in Forum info update mode.
  showEditWidget(Forum forum, bool isEdit) {
    showDialog(
      context: context,
      builder: (BuildContext context) =>
          new AddForumDialog().buildAboutDialog(context, this, isEdit, forum),
    );
  }

  //Delete a entry from the Firebase console.
  deleteForum(Forum forum) {
    setState(() {
      databaseUtil.deleteForum(forum);
    });
  }
}
