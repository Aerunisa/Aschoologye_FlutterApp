import 'package:aschoologye/Screen/signup.dart';
import 'package:flutter/material.dart';
import 'package:aschoologye/Screen/signin.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:async';
import 'dart:convert' show json;

import "package:http/http.dart" as http;

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

class Signgoogle extends StatefulWidget {
  @override
  State createState() => SigngoogleState();
}

class SigngoogleState extends State<Signgoogle> {
  GoogleSignInAccount _currentUser;
  String _contactText;

  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      setState(() {
        _currentUser = account;
      });
      if (_currentUser != null) {
        _handleGetContact();
      }
    });
    _googleSignIn.signInSilently();
  }

  Future<void> _handleGetContact() async {
    setState(() {
      _contactText = "Loading contact info...";
    });
    final http.Response response = await http.get(
      'https://people.googleapis.com/v1/people/me/connections'
      '?requestMask.includeField=person.names',
      headers: await _currentUser.authHeaders,
    );
    if (response.statusCode != 200) {
      setState(() {
        _contactText = "People API gave a ${response.statusCode} "
            "response. Check logs for details.";
      });
      print('People API ${response.statusCode} response: ${response.body}');
      return;
    }
    final Map<String, dynamic> data = json.decode(response.body);
    final String namedContact = _pickFirstNamedContact(data);
    setState(() {
      if (namedContact != null) {
        _contactText = "I see you know $namedContact!";
      } else {
        _contactText = "No contacts to display.";
      }
    });
  }

  String _pickFirstNamedContact(Map<String, dynamic> data) {
    final List<dynamic> connections = data['connections'];
    final Map<String, dynamic> contact = connections?.firstWhere(
      (dynamic contact) => contact['names'] != null,
      orElse: () => null,
    );
    if (contact != null) {
      final Map<String, dynamic> name = contact['names'].firstWhere(
        (dynamic name) => name['displayName'] != null,
        orElse: () => null,
      );
      if (name != null) {
        return name['displayName'];
      }
    }
    return null;
  }

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  Future<void> _handleSignOut() => _googleSignIn.disconnect();

  Widget _buildBody() {
    if (_currentUser != null) {
      return Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ListTile(
            title: Text(
              'Profile',
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
          ),
          ListTile(
            leading: GoogleUserCircleAvatar(
              identity: _currentUser,
            ),
            title: Text(_currentUser.displayName ?? ''),
            subtitle: Text(_currentUser.email ?? ''),
          ),
          Text(
            _contactText ?? '',
            style: TextStyle(color: Colors.white),
          ),
          RaisedButton(
            child: const Text('Go Home'),
            onPressed: () {
              Navigator.pushNamed(context, '/Home');
            },
          ),
          RaisedButton(
            child: const Text('LogOut'),
            onPressed: _handleSignOut,
          ),
        ],
      ));
    } else {
      return Column(
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
          RaisedButton(
            child: const Text(
              'Sign In with Email',
            ),
            onPressed: () => _pushPage(context, SigninPage()),
            color: Color(0xFF9FA8DA),
            padding: const EdgeInsets.all(8),
          ),
          RaisedButton(
            child: const Text(
              'Sign Up with Email',
            ),
            onPressed: () => _pushPage(context, Signup()),
            color: Color(0xFFE8EAF6),
            padding: const EdgeInsets.all(8),
          ),
          RaisedButton(
            child: new Image.asset(
              "imgfolder/google.png",
              width: 200.10,
            ),
            onPressed: _handleSignIn,
            color: Color(0xFF1E88E5),
          ),
          const Text("You are not currently signed in."),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: _buildBody(),
    ));
  }

  void _pushPage(BuildContext context, Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (_) => page),
    );
  }
}
