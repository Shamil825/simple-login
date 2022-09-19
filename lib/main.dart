import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/loginPage.dart';
import 'package:login/splash.dart';




const Save_key_name='userLoggedIn';
main(List<String> args) {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({ Key? key }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home: Scaffold(
      body: ScreenFlash(),
    ),
    );
  }
}