import 'package:aschoologye/Screen/HomeIcon.dart';
import 'package:aschoologye/material/constans.dart';
import 'package:aschoologye/Screen/signup.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            padding: new EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                new Text(
                  "Sign In",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(fontSize: 25),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 40),
                ),
                new TextField(
                  decoration: new InputDecoration(
                    hintText: "Email",
                    labelText: "Email",
                    border: new OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 20),
                ),
                new TextField(
                  obscureText: true,
                  decoration: new InputDecoration(
                    hintText: "Password",
                    labelText: "Password",
                    border: new OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeIcon(),
                      ),
                    );
                  },
                  child: Text("Sign In"),
                  color: AsPalette.skyblue,
                  textColor: AsPalette.blue,
                ),
                FlatButton(
                    child: Text(
                      "You don't have an account?",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: AsPalette.blue,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Signup(),
                        ),
                      );
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
