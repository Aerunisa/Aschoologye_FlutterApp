import 'package:flutter/material.dart';
import 'package:aschoologye/material/constans.dart';

class Aclaas extends StatefulWidget {
  @override
  _AclaasState createState() => _AclaasState();
}

class _AclaasState extends State<Aclaas> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: AsPalette.blue,
            expandedHeight: 0.0,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                "Class ",
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 1,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0,
                children: <Widget>[
                  MenuIcon(
                    iconnya: 'imgfolder/fire.png',
                    label: 'How to Store Image one FireStore',
                    navigateTo: '/yutub',
                  ),
                  MenuIcon(
                    iconnya: 'imgfolder/youtube.png',
                    label: 'design app with slivers ',
                    navigateTo: '/youtube',
                  ),
                  MenuIcon(
                    iconnya: 'imgfolder/databases.png',
                    label: 'create Your calculator',
                    navigateTo: '/Forum',
                  ),
                ],
              ),
            ]),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/Kelas'),
        child: Icon(Icons.control_point_duplicate),
      ),
    );
  }
}

class MenuIcon extends StatelessWidget {
  final String iconnya;
  final String label;
  final String navigateTo;

  MenuIcon({this.iconnya, this.label, this.navigateTo});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, navigateTo);
              },
              child: new Image.asset(
                iconnya,
                width: 300.10,
              ),
            ),
          ),
        ),
        SizedBox(height: 5.0),
        Text(label),
      ],
    ));
  }
}
