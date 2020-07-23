import 'package:flutter/material.dart';
import 'package:aschoologye/service/pojodata.dart';

class AddKelasDialog {
  final teJudul = TextEditingController();
  final teLinkyutub = TextEditingController();
  final teMaterikelas = TextEditingController();
  final teResume = TextEditingController();
  final teInfo = TextEditingController();
  Kelas kelas;

  static const TextStyle linkStyle = const TextStyle(
    color: Colors.blue,
    decoration: TextDecoration.underline,
  );

  Widget buildAboutDialogKelas(BuildContext context,
      AddKelasCallback _kelasDashboardState, bool isEdit, Kelas kelas) {
    if (kelas != null) {
      this.kelas = kelas;
      teJudul.text = kelas.judul;
      teLinkyutub.text = kelas.linkyutube;
      teMaterikelas.text = kelas.materikelas;
      teResume.text = kelas.resume;
      teInfo.text = kelas.info;
    }

    return new AlertDialog(
      title: new Text(isEdit ? 'Edit detail!' : 'Create Your Claas !'),
      content: new SingleChildScrollView(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            getTextField("Judul", teJudul),
            getTextField("Linkyutub", teLinkyutub),
            getTextField("Materikelas", teMaterikelas),
            getTextField("Resume", teResume),
            getTextField("Info", teInfo),
            new GestureDetector(
              onTap: () => onTap(isEdit, _kelasDashboardState, context),
              child: new Container(
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                child: getAppBorderButtonKelas(isEdit ? "Edit" : "Add",
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

  Widget getAppBorderButtonKelas(String buttonLabel, EdgeInsets margin) {
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

  Kelas getData(bool isEdit) {
    return new Kelas(isEdit ? kelas.id : "", teJudul.text, teLinkyutub.text,
        teMaterikelas.text, teResume.text, teInfo.text);
  }

  onTap(bool isEdit, AddKelasCallback _kelasDashboardState,
      BuildContext context) {
    if (isEdit) {
      _kelasDashboardState.update(getData(isEdit));
    } else {
      _kelasDashboardState.addKelas(getData(isEdit));
    }

    Navigator.of(context).pop();
  }
}

//Call back of Kelas dashboad
abstract class AddKelasCallback {
  void addKelas(Kelas kelas);

  void update(Kelas kelas);
}
