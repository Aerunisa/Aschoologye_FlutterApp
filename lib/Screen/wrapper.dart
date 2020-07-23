import 'package:aschoologye/Screen/HomeIcon.dart';
import 'package:aschoologye/service/usersevice.dart';
import 'package:flutter/material.dart';
import 'package:aschoologye/Screen/screen.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    if (user == null) {
      return ScreenPage();
    } else {
      return HomeIcon();
    }
  }
}
