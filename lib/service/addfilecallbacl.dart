import 'package:flutter/material.dart';
import 'package:aschoologye/service/pojodata.dart';

class AddSeminarDialog {
  final teName = TextEditingController();
  final teDetail = TextEditingController();
  final teLink = TextEditingController();
  final teInfo = TextEditingController();
  Seminar seminar;

  static const TextStyle linkStyle = const TextStyle(
    color: Colors.blue,
    decoration: TextDecoration.underline,
  );

  Widget buildAboutDialog(BuildContext context,
      AddSeminarCallback _myHomePageState, bool isEdit, Seminar seminar) {
    if (seminar != null) {
      this.seminar = seminar;
      teName.text = seminar.name;
      teDetail.text = seminar.detail;
      teLink.text = seminar.link;
      teInfo.text = seminar.info;
    }

    return new AlertDialog(
      title: new Text(isEdit ? 'Edit detail!' : 'Add Your Seminar !'),
      content: new SingleChildScrollView(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            getTextField("Name", teName),
            getTextField("Detail", teDetail),
            getTextField("Link", teLink),
            getTextField("Info", teInfo),
            new GestureDetector(
              onTap: () => onTap(isEdit, _myHomePageState, context),
              child: new Container(
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                child: getAppBorderButton(isEdit ? "Edit" : "Add",
                    EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getTextField(
      String inputBoxName, TextEditingController inputBoxController) {
    var loginBtn = new Padding(
      padding: const EdgeInsets.all(5.0),
      child: new TextFormField(
        controller: inputBoxController,
        decoration: new InputDecoration(
          hintText: inputBoxName,
        ),
      ),
    );

    return loginBtn;
  }

  Widget getAppBorderButton(String buttonLabel, EdgeInsets margin) {
    var loginBtn = new Container(
      margin: margin,
      padding: EdgeInsets.all(8.0),
      alignment: FractionalOffset.center,
      decoration: new BoxDecoration(
        border: Border.all(color: const Color(0xFF28324E)),
        borderRadius: new BorderRadius.all(const Radius.circular(6.0)),
      ),
      child: new Text(
        buttonLabel,
        style: new TextStyle(
          color: const Color(0xFF28324E),
          fontSize: 20.0,
          fontWeight: FontWeight.w300,
          letterSpacing: 0.3,
        ),
      ),
    );
    return loginBtn;
  }

  Seminar getData(bool isEdit) {
    return new Seminar(isEdit ? seminar.id : "", teName.text, teDetail.text,
        teLink.text, teInfo.text);
  }

  onTap(
      bool isEdit, AddSeminarCallback _seminarPageState, BuildContext context) {
    if (isEdit) {
      _seminarPageState.update(getData(isEdit));
    } else {
      _seminarPageState.addSeminar(getData(isEdit));
    }

    Navigator.of(context).pop();
  }
}

//Call back of Seminar dashboad
abstract class AddSeminarCallback {
  void addSeminar(Seminar seminar);

  void update(Seminar seminar);
}

//------------------------Void Kelas --------------------------//
class AddForumDialog {
  final teNama = TextEditingController();
  final teQuestion = TextEditingController();
  Forum forum;

  static const TextStyle linkStyle = const TextStyle(
    color: Colors.blue,
    decoration: TextDecoration.underline,
  );

  Widget buildAboutDialog(BuildContext context,
      AddForumCallback _myHomePageState, bool isEdit, Forum forum) {
    if (forum != null) {
      this.forum = forum;
      teNama.text = forum.nama;
      teQuestion.text = forum.question;
    }

    return new AlertDialog(
      title: new Text(isEdit ? 'Edit detail!' : 'Add Your Question !'),
      content: new SingleChildScrollView(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            getTextField("Nama", teNama),
            getTextField("Question", teQuestion),
            new GestureDetector(
              onTap: () => onTap(isEdit, _myHomePageState, context),
              child: new Container(
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                child: getAppBorderButton(isEdit ? "Edit" : "Add",
                    EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getTextField(
      String inputBoxName, TextEditingController inputBoxController) {
    var loginBtn = new Padding(
      padding: const EdgeInsets.all(5.0),
      child: new TextFormField(
        controller: inputBoxController,
        decoration: new InputDecoration(
          hintText: inputBoxName,
        ),
      ),
    );

    return loginBtn;
  }

  Widget getAppBorderButton(String buttonLabel, EdgeInsets margin) {
    var loginBtn = new Container(
      margin: margin,
      padding: EdgeInsets.all(8.0),
      alignment: FractionalOffset.center,
      decoration: new BoxDecoration(
        border: Border.all(color: const Color(0xFF28324E)),
        borderRadius: new BorderRadius.all(const Radius.circular(6.0)),
      ),
      child: new Text(
        buttonLabel,
        style: new TextStyle(
          color: const Color(0xFF28324E),
          fontSize: 20.0,
          fontWeight: FontWeight.w300,
          letterSpacing: 0.3,
        ),
      ),
    );
    return loginBtn;
  }

  Forum getData(bool isEdit) {
    return new Forum(
      isEdit ? forum.id : "",
      teNama.text,
      teQuestion.text,
    );
  }

  onTap(bool isEdit, AddForumCallback _forumPageState, BuildContext context) {
    if (isEdit) {
      _forumPageState.update(getData(isEdit));
    } else {
      _forumPageState.addForum(getData(isEdit));
    }

    Navigator.of(context).pop();
  }
}

//Call back of Seminar dashboad
abstract class AddForumCallback {
  void addForum(Forum forum);

  void update(Forum forum);
}
