import 'package:aschoologye/material/constans.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:aschoologye/service/validation.dart';

class NewMateriPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NewMateriPageState();
  }
}

class NewMateriPageState extends State<NewMateriPage> with Validation {
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
                Text(
                  "Create New Knowledge",
                  style: GoogleFonts.poppins(
                      fontSize: 25,
                      color: AsPalette.green,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                ),
                TextFormField(
                  decoration: new InputDecoration(
                    labelText: "ID Material",
                    hintText: "ID Materi",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: validateIDMateri,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                ),
                TextField(
                  decoration: new InputDecoration(
                    labelText: "Material Title",
                    hintText: "Material Title",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                ),
                TextField(
                  maxLines: 5,
                  decoration: new InputDecoration(
                    labelText: "Content",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                ),
                TextField(
                  maxLines: 5,
                  decoration: new InputDecoration(
                    labelText: "Quote",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                ),
                TextField(
                  decoration: new InputDecoration(
                    labelText: "Link",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                ),
                RaisedButton(
                  child: Text("Submit"),
                  onPressed: () {},
                  color: AsPalette.green,
                  textColor: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
