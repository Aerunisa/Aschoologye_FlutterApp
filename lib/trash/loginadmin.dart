import 'package:aschoologye/Screen/signin.dart';
import 'package:aschoologye/service/validation.dart';
import 'package:flutter/material.dart';
import 'package:aschoologye/material/constans.dart';
import 'package:google_fonts/google_fonts.dart';

class LogAdm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LogAdmPage();
  }
}

class LogAdmPage extends State<LogAdm> with Validation {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                new Text(
                  "Admin",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(fontSize: 10),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 40),
                ),
                new TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: new InputDecoration(
                    hintText: "Email",
                    labelText: "example@email.com",
                    border: new OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  validator: validateEmail,
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 20),
                ),
                new TextFormField(
                  obscureText: true,
                  decoration: new InputDecoration(
                    hintText: "Password",
                    labelText: "Password",
                    border: new OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  validator: validatePass,
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SigninPage(),
                      ),
                    );
                  },
                  child: Text("Sign In"),
                  color: AsPalette.skyblue,
                  textColor: AsPalette.blue,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
