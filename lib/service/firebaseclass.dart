import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:aschoologye/service/pojodata.dart';

class FirebaseDatabaseUtil {
  DatabaseReference _counterRef;
  DatabaseReference _kelasRef;
  StreamSubscription<Event> _counterSubscription;
  StreamSubscription<Event> _messagesSubscription;
  FirebaseDatabase database = new FirebaseDatabase();
  int _counter;
  DatabaseError error;

  DatabaseReference getKelas() {
    return _kelasRef;
  }

  static final FirebaseDatabaseUtil _instance =
      new FirebaseDatabaseUtil.internal();

  FirebaseDatabaseUtil.internal();

  factory FirebaseDatabaseUtil() {
    return _instance;
  }

  void initState() {
    _counterRef = FirebaseDatabase.instance.reference().child('counter');

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

  void dispose() {
    _messagesSubscription.cancel();
    _counterSubscription.cancel();
  }
}
