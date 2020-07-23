import 'package:aschoologye/Screen/signin.dart';
import 'package:flutter/material.dart';
import 'package:aschoologye/service/AuthService.dart';
import 'package:aschoologye/Screen/loadingScreen.dart';

class Signup extends StatefulWidget {
  @override
  _SignupPage createState() => _SignupPage();
}

final AuthService _auth = AuthService();
final _formKey = GlobalKey<FormState>();
RegExp regx = RegExp(r"^[a-z0-9_]*$", caseSensitive: false);
bool loading = false;

class _SignupPage extends State<Signup> {
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? LoadingScreen()
        : Scaffold(
            resizeToAvoidBottomPadding: false,
            body: Container(
              //isi body: Container
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomCenter,
                  stops: [0.6, 0.9],
                  colors: [
                    Color.fromRGBO(0, 0, 0, 1),
                    Color.fromRGBO(72, 61, 139, 1),
                  ],
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomCenter,
                      stops: [0.6, 0.9],
                      colors: [
                        Color.fromRGBO(245, 255, 250, 1),
                        Color.fromRGBO(245, 255, 250, 1),
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 18.0,
                          color: Colors.transparent.withOpacity(.5),
                          spreadRadius: 12.5),
                    ]),
                margin: EdgeInsets.fromLTRB(40, 35, 40, 50),
                child: Column(
                  //isi child: Column
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 45, top: 15),
                      child: Column(
                        children: <Widget>[
                          Image.asset('imgfolder/aschoologye.png',
                              width: 120, height: 75),
                          Text(
                            "Sign Up",
                            style: TextStyle(
                                fontFamily: 'Rubik',
                                fontSize: 19,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 5, 10, 20),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            Text("Email"),
                            Container(
                                margin: EdgeInsets.only(top: 10, bottom: 8),
                                child: TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                      hintText: "Email",
                                      prefixIcon: Icon(Icons.message),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(28))),
                                  validator: (value) =>
                                      value.isEmpty ? "Enter an Email" : null,
                                  onChanged: (value) {
                                    setState(() => email = value);
                                  },
                                )),
                            Text("Password"),
                            Container(
                                margin: EdgeInsets.only(top: 10, bottom: 8),
                                child: TextFormField(
                                  keyboardType: TextInputType.text,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                      hintText: "Password",
                                      prefixIcon: Icon(Icons.lock),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(28))),
                                  validator: (value) => value.length < 6
                                      ? "Enter a password Minimum 6 chars Long"
                                      : null,
                                  onChanged: (value) {
                                    setState(() => password = value);
                                  },
                                )),
                            FlatButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0)),
                              color: Colors.blue,
                              textColor: Colors.white,
                              child: Text('Create Account'),
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  dynamic result =
                                      await _auth.registerEmailandPassword(
                                          email, password);

                                  setState(() => loading = true);
                                  if (result == null) {
                                    setState(() {
                                      error = 'Please Insert a valid email';
                                      loading = false;
                                    });
                                  }
                                }
                                return false;
                              },
                            ),
                            FlatButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0)),
                                color: Colors.black12,
                                textColor: Colors.white,
                                child: Text('Sign In'),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SigninPage()));
                                }),
                            SizedBox(height: 12.0),
                            Text(
                              error,
                              style:
                                  TextStyle(color: Colors.red, fontSize: 14.0),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //scaffold
          );
  }
}
