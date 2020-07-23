// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:aschoologye/service/usersevice.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:firebase_database/firebase_database.dart';

// final fire = FirebaseDatabase.instance;

// class AuthService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final ref = fire.reference().child("userdata");
//   User _userFromFirebaseUser(FirebaseUser user) {
//     return user != null ? User(uid: user.uid) : null;
//   }

//   Stream<User> get user {
//     return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
//   }

//   //sign in anon
//   Future registerEmailandPassword(String email, String password) async {
//     try {
//       AuthResult result = await _auth.createUserWithEmailAndPassword(
//           email: email, password: password);
//       FirebaseUser user = result.user;
//       ref.child(user.uid).set({
//         "email": email,
//         "password": password,
//       });
//       return _userFromFirebaseUser(user);
//     } catch (e) {
//       print(e.toString());
//       return null;
//     }
//   }


// }
