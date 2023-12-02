import 'package:flutter/material.dart';
import 'package:lecture29firebase_dbms/Signup.dart';

import 'Home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController useremaillogin = TextEditingController();
  TextEditingController userpasslogin = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login"),centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
               SizedBox(
              height: 30,
            ),
            TextField(
              controller: useremaillogin,
            ),
              SizedBox(
              height: 10,
            ),
            TextField(
              controller: userpasslogin,
            ),
                SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Home(),
                      ));
                },
                child: Text("Login")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Signup(),
                      ));
                },
                child: Text("Signup")),
          ],
        ),
      ),
    );
  }
}
