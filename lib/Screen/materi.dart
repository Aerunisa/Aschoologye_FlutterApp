import 'package:flutter/material.dart';

class Materi1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Materi1Page();
  }
}

class Materi1Page extends State<Materi1> {
  Widget build(BuildContext context) {
    Widget imageSection = Container(
      child: Image.asset('images/konten1.svg'),
    );
    Widget titleSection = Container(
      padding: EdgeInsets.only(top: 16),
      child: Text(
        'Beginner Firebase',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
    Widget descSection = Container(
      padding: EdgeInsets.all(16),
      child: Text(
          'Firebase adalah suatu layanan dari Google yang digunakan untuk'
          'mempermudah para pengembang aplikasi dalam mengembangkan aplikasi.'
          'Dengan adanya Firebase, pengembang aplikasi bisa fokus mengembangkan '
          'aplikasi tanpa harus memberikan usaha yang besar.'),
    );

    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            imageSection,
            titleSection,
            descSection,
          ],
        ),
      ),
    );
  }
}
