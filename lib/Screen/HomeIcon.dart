import 'package:flutter/material.dart';
import 'package:aschoologye/material/constans.dart';
import 'package:aschoologye/service/AuthService.dart';

final AuthService _auth = AuthService();

class HomeIcon extends StatefulWidget {
  @override
  State createState() => HomeIconState();
}

class HomeIconState extends State<HomeIcon> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: AsPalette.blue,
            expandedHeight: 100.0,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                "Aschoologye",
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 30.0,
                children: <Widget>[
                  MenuIcon(
                    iconnya: Icons.people,
                    iconColor: Colors.brown,
                    label: 'About',
                    navigateTo: '/About',
                  ),
                  MenuIcon(
                    iconnya: Icons.personal_video,
                    iconColor: Colors.red,
                    label: 'Test',
                    navigateTo: '/Test',
                  ),
                  MenuIcon(
                    iconnya: Icons.forum,
                    iconColor: Colors.blueAccent,
                    label: 'Forum',
                    navigateTo: '/Forum',
                  ),
                  MenuIcon(
                    iconnya: Icons.class_,
                    iconColor: Colors.amber,
                    label: 'Class',
                    navigateTo: '/listclas',
                  ),
                  MenuIcon(
                    iconnya: Icons.apps,
                    iconColor: Colors.deepOrangeAccent,
                    label: 'Seminar',
                    navigateTo: '/Accon',
                  ),
                  MenuIcon(
                    iconnya: Icons.book,
                    iconColor: Colors.lightBlue,
                    label: 'Blog',
                    navigateTo: '/Account',
                  ),
                  MenuIcon(
                    iconnya: Icons.calendar_today,
                    iconColor: Colors.teal,
                    label: 'Activity',
                    navigateTo: '/CalActiv',
                  ),
                  MenuIcon(
                    iconnya: Icons.help_outline,
                    iconColor: Colors.red,
                    label: 'Ask Center',
                    navigateTo: '',
                  ),
                ],
              ),
            ]),
          ),
          // SliverList(
          //   delegate: SliverChildListDelegate(
          //     [
          //       Container(color: Colors.white, height: 100.0),
          //       Container(
          //         height: 150.0,
          //         decoration: BoxDecoration(
          //           image: DecorationImage(
          //               image: AssetImage("imgfolder/youtube.jpg"),
          //               fit: BoxFit.cover),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
      bottomNavigationBar: new Theme(
        data: Theme.of(context).copyWith(
          canvasColor: const Color.fromRGBO(8, 59, 102, 1),
        ), // sets the inactive color of the `BottomNavigationBar`
        child: new BottomNavigationBar(
          items: [
            new BottomNavigationBarItem(
                icon: new IconButton(
                    icon: Icon(Icons.all_out, color: const Color(0xFFFFFFFF)),
                    onPressed: () async {
                      await _auth.signOut();
                    }),
                title: new Text(
                  "LogOut",
                  style: new TextStyle(
                    color: const Color(0xFFFFFFFF),
                  ),
                )),
            new BottomNavigationBarItem(
                icon: new IconButton(
                    icon: Icon(Icons.people, color: const Color(0xFFFFFFFF)),
                    onPressed: () => Navigator.pushNamed(context, '/Profile')),
                title: new Text(
                  "Account",
                  style: new TextStyle(
                    color: const Color(0xFFFFFFFF),
                  ),
                )),
            new BottomNavigationBarItem(
                icon: new IconButton(
                    icon: Icon(Icons.home, color: const Color(0xFFFFFFFF)),
                    onPressed: () => Navigator.pushNamed(context, '/Home')),
                title: new Text(
                  "Home",
                  style: new TextStyle(
                    color: const Color(0xFFFFFFFF),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

class MenuIcon extends StatelessWidget {
  final IconData iconnya;
  final Color iconColor;
  final String label;
  final String navigateTo;

  MenuIcon({this.iconnya, this.iconColor, this.label, this.navigateTo});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              color: iconColor.withOpacity(.2),
              borderRadius: BorderRadius.circular(10.0)),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: IconButton(
              icon: new Icon(
                iconnya,
                color: iconColor,
              ),
              onPressed: () {
                Navigator.pushNamed(context, navigateTo);
              },
            ),
          ),
        ),
        SizedBox(height: 5.0),
        Text(label),
      ],
    ));
  }
}
