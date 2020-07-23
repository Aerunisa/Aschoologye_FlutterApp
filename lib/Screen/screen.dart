import 'package:aschoologye/service/AuthService.dart';
import 'package:flutter/material.dart';
import 'package:aschoologye/Screen/signin.dart';
import 'package:aschoologye/Screen/signup.dart';

class ScreenPage extends StatefulWidget {
  @override
  _ScreenPageState createState() => _ScreenPageState();
}

class _ScreenPageState extends State<ScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  new Image.asset(
                    "imgfolder/caturtrans.png",
                    width: 300.10,
                  ),
                  new Padding(
                    padding: const EdgeInsets.only(bottom: 30.0, top: 50.0),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(16),
              alignment: Alignment.center,
            ),
            Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(34, 64, 67, 1),
                borderRadius: BorderRadius.circular(30),
              ),
              child: FlatButton(
                child: Center(
                  child: Text(
                    'Login with Email',
                    style: TextStyle(
                      color: Color.fromRGBO(247, 247, 250, 1),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                onPressed: () => _pushPage(context, SigninPage()),
                padding: const EdgeInsets.all(8),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(8, 59, 102, 1),
                borderRadius: BorderRadius.circular(30),
              ),
              child: FlatButton(
                child: Center(
                  child: Text(
                    'Sign Up with Email',
                    style: TextStyle(
                      color: Color.fromRGBO(247, 247, 250, 1),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                onPressed: () => _pushPage(context, Signup()),
                padding: const EdgeInsets.all(8),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              child: FlatButton(
                child: new Image.asset(
                  "imgfolder/google.png",
                  width: 200.10,
                ),
                onPressed: () async {
                  bool res = await AuthService().loginWithGoogle();
                  if (!res) print('Error Logging in with Google');
                },
              ),
            ),
            const Text("You are not currently signed in."),
          ],
        ),
      ),
    );
  }

  void _pushPage(BuildContext context, Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (_) => page),
    );
  }
}
