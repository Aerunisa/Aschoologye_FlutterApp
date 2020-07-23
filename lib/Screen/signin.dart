import 'package:aschoologye/Screen/signup.dart';
import 'package:flutter/material.dart';
import 'package:aschoologye/service/AuthService.dart';
import 'package:aschoologye/Screen/loadingScreen.dart';

class SigninPage extends StatefulWidget {
  @override
  _SigninPageState createState() => _SigninPageState();
}

final AuthService _auth = AuthService();
final _formKey = GlobalKey<FormState>();
RegExp regx = RegExp(r"^[a-z0-9_]*$", caseSensitive: false);
bool loading = false;
String email = '';
String password = '';
String error = '';

class _SigninPageState extends State<SigninPage> {
  @override
  Widget build(BuildContext context) {
    return loading
        ? LoadingScreen()
        : Scaffold(
            //isi scaffold
            resizeToAvoidBottomPadding: false,

            body: Container(
              //isi body: Container
              decoration: BoxDecoration(
                //jumlah stop berbanding lurus dengan jumlah warna
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomCenter,
                  //jumlah stop berbanding lurus dengan jumlah warna
                  stops: [0.3, 0.6],
                  colors: [
                    Color.fromRGBO(128, 128, 0, 1),
                    Color.fromRGBO(240, 230, 140, 1),
                  ],
                ),
              ),
              child: Container(
                //isi child: Container
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomCenter,
                      //jumlah stop berbanding lurus dengan jumlah warna
                      stops: [0.3, 0.6],
                      colors: [
                        Color.fromRGBO(189, 183, 107, 1),
                        Color.fromRGBO(238, 232, 170, 1),
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
                          Padding(padding: EdgeInsets.fromLTRB(10, 7, 10, 15)),
                          Text(
                            "Login",
                            style: TextStyle(
                              fontFamily: 'Righteous',
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
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
                            Text("Username",
                                style: TextStyle(
                                  color: Colors.white,
                                )),
                            Container(
                                margin: EdgeInsets.only(top: 10, bottom: 8),
                                child: TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (String value) {
                                    if (value.isEmpty) {
                                      return 'Insert the Value';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      hintText: "Email",
                                      hoverColor: Colors.white,
                                      prefixIcon: Icon(Icons.message),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(28))),
                                  onChanged: (value) {
                                    setState(() => email = value);
                                  },
                                )),
                            Text("Password",
                                style: TextStyle(
                                  color: Colors.white,
                                )),
                            Container(
                                margin: EdgeInsets.only(top: 10, bottom: 8),
                                child: TextFormField(
                                  keyboardType: TextInputType.text,
                                  obscureText: true,
                                  validator: (String value) {
                                    if (value.isEmpty) {
                                      return 'Insert Your Password';
                                    } else if (!(regx.hasMatch(value))) {
                                      return 'Dont use special character!';
                                    } else if (value.length < 6) {
                                      return 'Minimun 6 characters !';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      hintText: "Password",
                                      prefixIcon: Icon(Icons.lock),
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(28))),
                                  onChanged: (value) {
                                    setState(() => password = value);
                                  },
                                )),
                            FlatButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0)),
                              color: Colors.blue,
                              textColor: Colors.white,
                              child: Text('Sign In'),
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  setState(() => loading = true);
                                  dynamic result = await _auth
                                      .signInEmailandPassword(email, password);
                                  if (result == null) {
                                    setState(() {
                                      loading = false;
                                      error = 'Please Insert a valid email';
                                    });
                                  }
                                }
                              },
                            ),
                            FlatButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              color: Colors.black12,
                              textColor: Colors.white,
                              child: Text('Sign Up'),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Signup()));
                              },
                            ),
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
                  //isi child: Column
                ),
                //child: Container
              ),
              //body: Container
            ),
            //scaffold
          );
  }
}
