import 'package:flutter/material.dart';
import 'package:aschoologye/Screen/Maps.dart';
import 'package:aschoologye/material/constans.dart';
import 'package:aschoologye/widget/backbutton.dart';

class AboutPages extends StatefulWidget {
  @override
  _AboutPagesState createState() => _AboutPagesState();
}

//  appBar: AppBar(
//         title: Text('About Aschoologye'),
//         backgroundColor: Color.fromRGBO(8, 59, 102, 1),
//       ),
class _AboutPagesState extends State<AboutPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AsPalette.kLightYellow,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            20,
            20,
            20,
            0,
          ),
          child: Column(
            children: <Widget>[
              MyBackButton(),
              SizedBox(height: 30.0),
              Text(
                'About Aschoologye',
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w700),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Divider(),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                            'Berawal dari susahnya memahami belajar sendiri, Kami Tim Aschoologye bertekat untuk membantu pelajar, Agar lebih mudah memahami pelajaran apapun dengan Mudah, Telah tersedianya dengan gratis layanan Kami untuk Anda.'),
                        Divider(),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                            'Aschoologye juga membuat portal untuk berbagi ke sesama pelajar, Saling berbagi ilmu dan pengalaman dari situs Kami, Dimulai dari bersama untuk tujuan menghilangkan, Kesenjangan dan Masa depan yang lebih Cerah. Aschoologye For You About US Together We Strong.'),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: 40.0,
                      width: 120,
                      decoration: BoxDecoration(
                        color: AsPalette.kGreen,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MapsPage(),
                            ),
                          );
                        },
                        child: Center(
                          child: Text(
                            'MAPS',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
