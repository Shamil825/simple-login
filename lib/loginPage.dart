import 'package:flutter/material.dart';
import 'package:login/account.dart';
import 'package:login/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenLogin extends StatefulWidget {
  ScreenLogin({Key? key}) : super(key: key);

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  final _username = TextEditingController();

  final _password = TextEditingController();

  final _confirm = TextEditingController();

  bool _message = true;

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(height: 20),
              TextFormField(
                controller: _username,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "user name",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _password,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "password",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'is empty';
                  } else {
                    Null;
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _confirm,
                obscureText: true,
                decoration: const InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: "confirm password",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'is empty';
                  } else {
                    Null;
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Visibility(
                      visible: !_message,
                      child: Text(
                        "error",
                        style: TextStyle(color: Colors.red),
                      )),
                  ElevatedButton.icon(
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          check(context);
                        } else {
                          Null;
                        }
                      },
                      icon: const Icon(Icons.check),
                      label: const Text("Login")),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }

  check(BuildContext context) async {
    final password = _password.text;
    final confirmpassword = _confirm.text;

    if (password == confirmpassword) {
      print("correct");

      final _sharedpref = await SharedPreferences.getInstance();
      _sharedpref.setBool(Save_key_name, true);

      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const Account()));
    } else {
      print("incorrect");
    }
  }
}
