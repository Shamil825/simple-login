import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:login/account.dart';
import 'package:login/loginPage.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:login/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
class ScreenFlash extends StatefulWidget {
  const ScreenFlash({Key? key}) : super(key: key);

  @override
  State<ScreenFlash> createState() => _ScreenFlashState();
}

class _ScreenFlashState extends State<ScreenFlash> {
  @override
  void initState() {
   checkUSerLoggedIn();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(child: SpinKitCubeGrid(
  color: Colors.blue,
  size: 50.0,
),),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Future gotologin() async {
   await Future.delayed(
      Duration(seconds: 3),
    );
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (ctx) => ScreenLogin(),
      ),
    );
  }


  Future checkUSerLoggedIn()async{
    final _sharedpref=await SharedPreferences.getInstance();
   final _userLoggedIn=_sharedpref.getBool(Save_key_name);
   if(_userLoggedIn==null || _userLoggedIn==false){
     gotologin();
   }else{
     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (cnx)=>Account()));
   }
  }
}
