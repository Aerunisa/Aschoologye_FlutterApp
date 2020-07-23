import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:aschoologye/service/pojodata.dart';

class FirebaseDatabaseUtil {
  DatabaseReference _counterRef;
  DatabaseReference _seminarRef;
  DatabaseReference _kelasRef;
  DatabaseReference _forumRef;
  StreamSubscription<Event> _counterSubscription;
  StreamSubscription<Event> _messagesSubscription;
  FirebaseDatabase database = new FirebaseDatabase();
  int _counter;
  DatabaseError error;

  static final FirebaseDatabaseUtil _instance =
      new FirebaseDatabaseUtil.internal();

  FirebaseDatabaseUtil.internal();

  factory FirebaseDatabaseUtil() {
    return _instance;
  }

  void initState() {
    // Demonstrates configuring to the database using a file
    _counterRef = FirebaseDatabase.instance.reference().child('counter');
    // Demonstrates configuring the database directly
    _forumRef = database.reference().child('forumOp');
    _seminarRef = database.reference().child('seminar');
    _kelasRef = database.reference().child('Kelas');
    database.reference().child('counter').once().then((DataSnapshot snapshot) {
      print('Connected to second database and read ${snapshot.value}');
    });
    database.setPersistenceEnabled(true);
    database.setPersistenceCacheSizeBytes(10000000);
    _counterRef.keepSynced(true);

    _counterSubscription = _counterRef.onValue.listen((Event event) {
      error = null;
      _counter = event.snapshot.value ?? 0;
    }, onError: (Object o) {
      error = o;
    });
  }

  DatabaseError getError() {
    return error;
  }

  int getCounter() {
    return _counter;
  }

  DatabaseReference getSeminar() {
    return _seminarRef;
  }

  addSeminar(Seminar seminar) async {
    final TransactionResult transactionResult =
        await _counterRef.runTransaction((MutableData mutableData) async {
      mutableData.value = (mutableData.value ?? 0) + 1;

      return mutableData;
    });

    if (transactionResult.committed) {
      _seminarRef.push().set(<String, String>{
        "name": "" + seminar.name,
        "detail": "" + seminar.detail,
        "link": "" + seminar.link,
        "info": "" + seminar.info,
      }).then((_) {
        print('Transaction  committed.');
      });
    } else {
      print('Transaction not committed.');
      if (transactionResult.error != null) {
        print(transactionResult.error.message);
      }
    }
  }

  void deleteSeminar(Seminar seminar) async {
    await _seminarRef.child(seminar.id).remove().then((_) {
      print('Transaction  committed.');
    });
  }

  void updateSeminar(Seminar seminar) async {
    await _seminarRef.child(seminar.id).update({
      "name": "" + seminar.name,
      "detail": "" + seminar.detail,
      "link": "" + seminar.link,
      "info": "" + seminar.info,
    }).then((_) {
      print('Transaction  committed.');
    });
  }

  void dispose() {
    _messagesSubscription.cancel();
    _counterSubscription.cancel();
  }

  //---------------------------- KELAS VOID YO --------------------------------//

  DatabaseReference getKelas() {
    return _kelasRef;
  }

  addKelas(Kelas kelas) async {
    final TransactionResult transactionResult =
        await _counterRef.runTransaction((MutableData mutableData) async {
      mutableData.value = (mutableData.value ?? 0) + 1;

      return mutableData;
    });

    if (transactionResult.committed) {
      _kelasRef.push().set(<String, String>{
        "judul": "" + kelas.judul,
        "linkyutub": "" + kelas.linkyutube,
        "materikelas": "" + kelas.materikelas,
        "resume": "" + kelas.resume,
        "info": "" + kelas.info,
      }).then((_) {
        print('Transaction  committed.');
      });
    } else {
      print('Transaction not committed.');
      if (transactionResult.error != null) {
        print(transactionResult.error.message);
      }
    }
  }

  void deleteKelas(Kelas kelas) async {
    await _kelasRef.child(kelas.id).remove().then((_) {
      print('Transaction  committed.');
    });
  }

  void updateKelas(Kelas kelas) async {
    await _kelasRef.child(kelas.id).update({
      "judul": "" + kelas.judul,
      "linkyutub": "" + kelas.linkyutube,
      "materikelas": "" + kelas.materikelas,
      "resume": "" + kelas.resume,
      "info": "" + kelas.info,
    }).then((_) {
      print('Transaction  committed.');
    });
  }

  //---------------------------- KELAS VOID YO --------------------------------//

  DatabaseReference getForum() {
    return _kelasRef;
  }

  addForum(Forum forum) async {
    final TransactionResult transactionResult =
        await _counterRef.runTransaction((MutableData mutableData) async {
      mutableData.value = (mutableData.value ?? 0) + 1;

      return mutableData;
    });

    if (transactionResult.committed) {
      _forumRef.push().set(<String, String>{
        "nama": "" + forum.nama,
        "question": "" + forum.question,
      }).then((_) {
        print('Transaction  committed.');
      });
    } else {
      print('Transaction not committed.');
      if (transactionResult.error != null) {
        print(transactionResult.error.message);
      }
    }
  }

  void deleteForum(Forum forum) async {
    await _forumRef.child(forum.id).remove().then((_) {
      print('Transaction  committed.');
    });
  }

  void updateForum(Forum forum) async {
    await _forumRef.child(forum.id).update({
      "nama": "" + forum.nama,
      "question": "" + forum.question,
    }).then((_) {
      print('Transaction  committed.');
    });
  }
}
