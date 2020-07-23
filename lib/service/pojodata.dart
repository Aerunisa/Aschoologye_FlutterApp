import 'package:firebase_database/firebase_database.dart';

class Seminar {
  String _id;
  String _name;
  String _detail;
  String _link;
  String _info;

  Seminar(this._id, this._name, this._detail, this._link, this._info);

  String get name => _name;

  String get detail => _detail;

  String get link => _link;

  String get info => _info;

  String get id => _id;

  Seminar.fromSnapshot(DataSnapshot snapshot) {
    _id = snapshot.key;
    _name = snapshot.value['name'];
    _detail = snapshot.value['detail'];
    _link = snapshot.value['link'];
    _info = snapshot.value['info'];
  }
}

class Kelas {
  String _id;
  String _judul;
  String _linkyutube;
  String _materikelas;
  String _resume;
  String _info;

  Kelas(this._id, this._judul, this._linkyutube, this._materikelas,
      this._resume, this._info);

  String get judul => _judul;

  String get linkyutube => _linkyutube;

  String get materikelas => _materikelas;

  String get resume => _resume;

  String get info => _info;

  String get id => _id;

  Kelas.fromSnapshot(DataSnapshot snapshot) {
    _id = snapshot.key;
    _judul = snapshot.value['judul'];
    _linkyutube = snapshot.value['linkyutube'];
    _materikelas = snapshot.value['materikelas'];
    _resume = snapshot.value['resume'];
    _info = snapshot.value['info'];
  }
}

class Forum {
  String _id;
  String _nama;
  String _question;

  Forum(this._id, this._nama, this._question);

  String get question => _question;

  String get nama => _nama;

  String get id => _id;

  Forum.fromSnapshot(DataSnapshot snapshot) {
    _id = snapshot.key;
    _nama = snapshot.value['nama'];
    _question = snapshot.value['question'];
  }
}
