import 'package:flutter/material.dart';
import 'package:login/loginPage.dart';
import 'package:login/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Text("hai its me"),
              SizedBox(
                height: 20,
              ),
              ElevatedButton.icon(
                  onPressed: () {
                    logout(context);
                  },
                  icon: Icon(Icons.exit_to_app),
                  label: Text("Logout")),
            ],
          ),
        ),
      ),
    );
  }

  logout(BuildContext context)async{
    final _sharedpref =await SharedPreferences.getInstance();
    await _sharedpref.clear();
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (cnt1)=>ScreenLogin()), (route) => false);
  }
}
